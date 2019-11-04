package com.supcon.orchid.WOM.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.supcon.orchid.WOM.daos.*;
import com.supcon.orchid.WOM.entities.*;
import com.supcon.orchid.WOM.enums.DealsEnum;
import com.supcon.orchid.WOM.services.*;
import com.supcon.orchid.WOM.services.impl.handler.ActiveChoseHandler;
import com.supcon.orchid.foundation.services.SystemCodeService;
import org.apache.commons.lang.StringUtils;
import com.supcon.orchid.WOM.daos.WOMProduceTaskActiveDao;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.publicSet.entities.PublicSetActBatState;
import com.supcon.orchid.publicSet.entities.PublicSetBatchInfo;
import com.supcon.orchid.publicSet.services.PublicSetActBatStateService;
import com.supcon.orchid.publicSet.services.PublicSetBatchInfoService;
import com.supcon.orchid.publicSet.services.WOMQualityManService;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.services.BaseServiceImpl;
import com.supcon.orchid.workflow.engine.services.IScriptService;

@Service("wom_qualityManService")
@Transactional
public class WOMQualityManServiceImpl  extends BaseServiceImpl implements
        IScriptService, WOMQualityManService, InitializingBean, DisposableBean {

    public static final String DEAL_TYPE_ADJUST = "publicSetDealType/11";

    /**
     * 不良品处理方式:
     *              保持
     */
    public static final String ACTIVE_DEAL_KEEP = "womActiveEnd/01";
    /**
     * 不良品处理方式:
     *              结束
     */
    public static final String ACTIVE_DEAL_END = "womActiveEnd/02";
    /**
     * 不良品处理方式:
     *              放弃
     */
    public static final String ACTIVE_DEAL_ABANDON = "womActiveEnd/03";

    @Autowired
    private WOMProdTaskActiExelogService prodTaskActiExelogService;

    @Autowired
    private WOMProdTaskActiExelogDao prodTaskActiExelogDao;

    @Resource
    protected SystemCodeService systemCodeService;

    @Autowired
    private PublicSetActBatStateService actBatStateService;

    @Autowired
    private PublicSetBatchInfoService  batchInfoService;

    @Autowired
    private WOMProActAndBatStateService proActAndBatStateService;

    @Autowired
    private WOMBatchPhaseExelogService batchPhaseExelogService;

    @Autowired
    private WOMProduceTaskService produceTaskService;

    @Autowired
    private WOMAdjustOrTempHeadService adjustOrTempHeadService;
    @Autowired
    private WOMAdjustOrTempRecordsDao adjustOrTempRecordsDao;
    @Autowired
    private WOMProduceTaskProcessDao taskProcessDao;

    @Override
    public void destroy() throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void afterPropertiesSet() throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFLowScript(String arg0, Map<String, Object> arg1) {
        // TODO Auto-generated method stub

    }

    @Override
    public void syncEntity(Long arg0, String arg1) {
        // TODO Auto-generated method stub

    }


    /**
     * 检验报告单保存、作废、生效时，调用该方法
     * @param activeRecordID 活动记录ID
     * @param checkReportID  检验报告单ID
     * @param checkResult  检验结论
     * @param status  单据状态
     * @return
     */
    @Override
    public void checkReportBackfillWom(Long activeRecordID, Long checkReportID,
                                       Boolean checkResult, Integer status) {
//TODO
        if(activeRecordID==null){
            return ;
        }

        WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogService.getProdTaskActiExelog(activeRecordID);

        ProcedureReport procedureReport = handler.choseProcfeedWay(DealsEnum.MES);
        Map<String,Object> map = new HashMap<>();
        map.put("selectedActiveId",prodTaskActiExelog.getTaskActiveID().getId());
        map.put("inComeType","pc");
        if(prodTaskActiExelog==null){
            throw new BAPException("工单管理：查找不到对应的活动执行记录!");
        }
        List<WOMProduceTaskActive> produceTaskActives = prodTaskActiExelogDao.findByHql(" from WOMProduceTaskActive where valid = 1 and id = ?", prodTaskActiExelog.getTaskActiveID().getId());

        if (produceTaskActives.isEmpty()) {
            throw new BAPException("工单管理：查找不到对应的活动记录!");
        }
        WOMProduceTaskActive produceTaskActive = produceTaskActives.get(0);
        //放行检验
        Boolean isPassCheck = prodTaskActiExelog.getIsPassCheck();
        //完工检验
        Boolean finalInspection = prodTaskActiExelog.getFinalInspection();
        //完工检验合格之后是否需要放行
        Boolean needPass=false;
        if(prodTaskActiExelog.getTaskID()!=null){
            needPass=prodTaskActiExelog.getTaskID().getProductId().getIsCtrlPass();
        }

        // 88 保存 0 作废  99 生效
        if(status==88){
            //检验报告单保存，则需要将活动执行记录表的检验报告单ID进行回填。
            prodTaskActiExelog.setCheckResultID(checkReportID);

        }else if(status==0){
            //检验报告单作废时，则需要将活动执行记录表的检验报告单ID进行清空。
            prodTaskActiExelog.setCheckResultID(null);

        }else if(status==99){   //单据生效
            //放行检验，即非普通检验
            if(isPassCheck){
                prodTaskActiExelog.setCheckResultID(checkReportID);
                if(checkResult){
                    //回填检验结论
                    prodTaskActiExelog.setCheckResult("合格");
                    //获取生产检验
                    WOMProActAndBatState proActAndBatState = getProActAndBatState();
                    //非完工检验
                    if(!finalInspection){
                        //更新活动执行记录的活动与批状态为待生产不良品处理
                        produceTaskActive.setActiveBatchState(proActAndBatState.getActiveBatchStateID());
                        prodTaskActiExelog.setActiveBatchStateID(proActAndBatState.getActiveBatchStateID());
                        //处理活动与phase的状态
                        dealWithActiveAndPhaseState( proActAndBatState, prodTaskActiExelog, produceTaskActive);
                    }else{
                        if(!needPass){   //不需要放行
                            //更新活动执行记录的活动与批状态为合格放行
                            produceTaskActive.setActiveBatchState(proActAndBatState.getActiveBatchStateID());
                            prodTaskActiExelog.setActiveBatchStateID(proActAndBatState.getActiveBatchStateID());
                            //更新批次信息表中的活动与批状态为合格放行
                            updateBatchInfoState(prodTaskActiExelog,proActAndBatState.getActiveBatchStateID()==null?null:proActAndBatState.getActiveBatchStateID().getId(),checkReportID,null);
                            //处理活动与phase的状态
                            dealWithActiveAndPhaseState( proActAndBatState, prodTaskActiExelog, produceTaskActive);
                        }else{
                            //更新活动执行记录的活动与批状态为合格待放行
                            prodTaskActiExelog.setActiveBatchStateID(actBatStateService.getActBatState(1001L));
                            produceTaskActive.setActiveBatchState(actBatStateService.getActBatState(1001L));
                            //更新批次信息表中的活动与批状态为合格待放行
                            updateBatchInfoState(prodTaskActiExelog,1001L,checkReportID,null);
                            List<WOMProActAndBatState> proActAndBatStates = proActAndBatStateService.getProActAndBatStates("valid=1 and activeBatchStateID=1001", null);
                            //处理活动与phase的状态
                            dealWithActiveAndPhaseState( proActAndBatStates.size()>0?proActAndBatStates.get(0):null, prodTaskActiExelog, produceTaskActive);
                        }

                    }

                }else{
                    prodTaskActiExelog.setCheckResult("不合格");
                    //更新活动执行记录的活动与批状态为待生产不良品处理
                    produceTaskActive.setActiveBatchState(actBatStateService.getActBatState(1002L));
                    prodTaskActiExelog.setActiveBatchStateID(actBatStateService.getActBatState(1002L));
                    if(finalInspection){
                        //更新批次信息表中的活动与批状态为待生产不良品处理
                        updateBatchInfoState(prodTaskActiExelog,1002L,checkReportID,null);
                    }
                }

            }
        }

        //将活动结束
        procedureReport.endActive(map);

    }



    /**
     * 不良品处理单保存、作废、生效时，调用该方法
     * @param activeRecordID 活动记录ID
     * @param rejectsDealID 不良品处理单ID
     * @param dealType 处理方式
     * @param status 单据状态
     * @return
     */
    @Override
    public void rejectsDealBackfillWom(Long activeRecordID, Long rejectsDealID,
                                       String dealType, Integer status) {
        if(activeRecordID==null){
            return ;
        }
        WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogService.getProdTaskActiExelog(activeRecordID);
        if(prodTaskActiExelog==null){
            throw new BAPException("工单管理：查找不到对应的活动执行记录!");
        }

        ProcedureReport procedureReport = handler.choseProcfeedWay(DealsEnum.MES);
        Map<String,Object> map = new HashMap<>();
        map.put("inComeType","pc");
        //活动与批状态
        PublicSetActBatState actBatState=null;
        //生产检验
        WOMProActAndBatState proActAndBatState=null;
        //根据处理方式查找对应的活动与批状态
        List<PublicSetActBatState> actBatStates = actBatStateService.getActBatStates("valid=1 and  dealType='"+dealType+"'", null);
        if(actBatStates.size()>0){
            actBatState=actBatStates.get(0);
        }

        //根据活动与批状态查找生产检验
        if(actBatState!=null){
            List<WOMProActAndBatState> proActAndBatStates = proActAndBatStateService.getProActAndBatStates("valid=1 and activeBatchStateID="+actBatState.getId(), null);
            if(proActAndBatStates.size()>0){
                proActAndBatState=proActAndBatStates.get(0);
            }
        }

        //如果请检单是从机动执行过来的
        if (StringUtils.equals(prodTaskActiExelog.getActiveSource().getId(),"womActiveSource/04")) {
            if (prodTaskActiExelog.getAdjustRecordID() == null) {
                throw new BAPException("工单管理：机动执行时，未绑定机动执行记录!");
            }
            WOMAdjustOrTempRecords adjustOrTempRecords = adjustOrTempRecordsDao.get(prodTaskActiExelog.getAdjustRecordID());

            if(status==88){
                //不良品处理单保存，则需要将活动执行记录表的检验报告单ID进行回填。
                adjustOrTempRecords.setRejectsDeal(rejectsDealID);
                prodTaskActiExelog.setRejectsDealID(rejectsDealID);
            }else if(status==0){
                //不良品处理单作废，则需要将活动执行记录表的不良品处理单ID进行清空。
                adjustOrTempRecords.setRejectsDeal(null);
                prodTaskActiExelog.setRejectsDealID(null);
            }else if(status==99){

                //不良品处理单生效，则需要将活动执行记录表的检验报告单ID进行回填。
                adjustOrTempRecords.setRejectsDeal(rejectsDealID);
                prodTaskActiExelog.setRejectsDealID(rejectsDealID);

                if(actBatState!=null && proActAndBatState!=null){
                    //更新活动执行记录的活动与批状态
                    adjustOrTempRecords.setActiveRecordBatchState(actBatState);
                    prodTaskActiExelog.setActiveBatchStateID(actBatState);
                    //处理活动与phase的状态
                    //dealWithActiveAndPhaseState(proActAndBatState,prodTaskActiExelog,produceTaskActive);
                    //完工检验
                    if(prodTaskActiExelog.getFinalInspection()){
                        //更新批次信息表的活动与批状态
                        updateBatchInfoState(prodTaskActiExelog , actBatState.getId(),null,rejectsDealID);
                    }

                    if (StringUtils.equals(proActAndBatState.getActiveEnd().getId(),ACTIVE_DEAL_KEEP)) {
                        if (StringUtils.equals(actBatState.getDealType().getId(),DEAL_TYPE_ADJUST)) {
                            //如果 不良品处理方式 是调整 则新建调整单 并绑定当前质检活动
                            WOMProduceTaskProcess taskProcess = taskProcessDao.get(adjustOrTempRecords.getProcessID());
                            String purpose = "isForAdjust";
                            adjustOrTempHeadService.generatDealActive(taskProcess,purpose,null);
                        }
                        prodTaskActiExelogDao.save(prodTaskActiExelog);
                        adjustOrTempRecordsDao.save(adjustOrTempRecords);
                        adjustOrTempRecordsDao.flush();
                        adjustOrTempRecordsDao.clear();
                    }else if(StringUtils.equals(proActAndBatState.getActiveEnd().getId(),ACTIVE_DEAL_END)){
                        prodTaskActiExelogDao.save(prodTaskActiExelog);
                        adjustOrTempRecordsDao.save(adjustOrTempRecords);
                        womProduceTaskActiveDao.flush();
                        womProduceTaskActiveDao.clear();
                        //将活动结束
                        map.put("activeRecordId",adjustOrTempRecords.getId());
                        procedureReport.adjustEndActive(map);
                    }else {
                        //整个生产批提前结束,暂不处理
                    }
                }

            }
        }else {
            WOMProduceTaskActive produceTaskActive = womProduceTaskActiveDao.get(prodTaskActiExelog.getTaskActiveID().getId());


            if(status==88){
                //不良品处理单保存，则需要将活动执行记录表的检验报告单ID进行回填。
                produceTaskActive.setRejectsDeal(rejectsDealID);
                prodTaskActiExelog.setRejectsDealID(rejectsDealID);
            }else if(status==0){
                //不良品处理单作废，则需要将活动执行记录表的不良品处理单ID进行清空。
                produceTaskActive.setRejectsDeal(null);
                prodTaskActiExelog.setRejectsDealID(null);
            }else if(status==99){

                //不良品处理单生效，则需要将活动执行记录表的检验报告单ID进行回填。
                produceTaskActive.setRejectsDeal(rejectsDealID);
                prodTaskActiExelog.setRejectsDealID(rejectsDealID);

                if(actBatState!=null && proActAndBatState!=null){
                    //更新活动执行记录的活动与批状态
                    produceTaskActive.setActiveBatchState(actBatState);
                    prodTaskActiExelog.setActiveBatchStateID(actBatState);
                    //处理活动与phase的状态
                    //dealWithActiveAndPhaseState(proActAndBatState,prodTaskActiExelog,produceTaskActive);
                    //完工检验
                    if(prodTaskActiExelog.getFinalInspection()){
                        //更新批次信息表的活动与批状态
                        updateBatchInfoState(prodTaskActiExelog , actBatState.getId(),null,rejectsDealID);
                    }

                    if (StringUtils.equals(proActAndBatState.getActiveEnd().getId(),ACTIVE_DEAL_KEEP)) {
                        if (StringUtils.equals(actBatState.getDealType().getId(),DEAL_TYPE_ADJUST)) {
                            //如果 不良品处理方式 是调整 则新建调整单 并绑定当前质检活动
                            WOMProduceTaskProcess taskProcess = produceTaskActive.getOrderProcessId();
                            String purpose = "isForAdjust";
                            adjustOrTempHeadService.generatDealActive(taskProcess,purpose,produceTaskActive.getId());
                        }
                        prodTaskActiExelogDao.save(prodTaskActiExelog);
                        womProduceTaskActiveDao.save(produceTaskActive);
                    }else if(StringUtils.equals(proActAndBatState.getActiveEnd().getId(),ACTIVE_DEAL_END)){
                        prodTaskActiExelogDao.save(prodTaskActiExelog);
                        womProduceTaskActiveDao.save(produceTaskActive);
                        womProduceTaskActiveDao.flush();
                        womProduceTaskActiveDao.clear();
                      	//将活动结束
                        map.put("selectedActiveId",produceTaskActive.getId());
                        //将活动结束
                        procedureReport.endActive(map);
                    }else {
                        //整个生产批提前结束,暂不处理
                    }
                }

            }
        }
    }


    /*
     * 更新批次信息表中的活动与批状态
     */
    private void updateBatchInfoState(WOMProdTaskActiExelog prodTaskActiExelog ,Long activeBatchStateID,Long checkReportID,Long rejectsDealID ){
        //生产批号
        String batchNum = prodTaskActiExelog.getBatchNum();
        PublicSetBatchInfo batchInfo = batchInfoService.getBybatchNumNoException(batchNum);
        if(batchInfo!=null){
            batchInfo.setActiveBatchStateID(actBatStateService.getActBatState(activeBatchStateID));
            if(checkReportID!=null)
                batchInfo.setCheckResultID(checkReportID);
            if(rejectsDealID!=null)
                batchInfo.setRejectsDealID(rejectsDealID);
        }
        batchInfoService.updateBatchInfoData(batchInfo);
    }

    /*
     * 查找生产检验合格且无需放为是的数据
     */
    private WOMProActAndBatState getProActAndBatState(){
        List<WOMProActAndBatState> proActAndBatStates = proActAndBatStateService.getProActAndBatStates("valid=1 and quaWithoutPass=1", null);
        if(proActAndBatStates.size()==0){
            throw new BAPException("工单管理-生产检验：未设置生产检验合格且无需放为是的数据");
        }
        if(proActAndBatStates.size()>1){
            throw new BAPException("工单管理-生产检验：生产检验合格且无需放为是的数据必须仅有一条");
        }
        return proActAndBatStates.get(0);
    }

    @Autowired
    private WOMProduceTaskActiveDao womProduceTaskActiveDao;
    /*
     * 根据生产检验中活动结束所设置的状态进行处理活动与phase的状态
     * 保持：	状态不变
     * 结束：	活动、Phase执行记录、Phase都结束
     * 放弃：	活动、Phase执行记录结束；phase不结束。用于返工、报废
     * 提前结束：	活动不结束；Phase执行记录、Phase结束。用于风险放行
     */
    @Autowired
    private ActiveChoseHandler handler;
    private void dealWithActiveAndPhaseState(WOMProActAndBatState proActAndBatState, WOMProdTaskActiExelog prodTaskActiExelog, WOMProduceTaskActive produceTaskActive){
        prodTaskActiExelogDao.save(prodTaskActiExelog);
        womProduceTaskActiveDao.save(produceTaskActive);
        womProduceTaskActiveDao.flush();
        womProduceTaskActiveDao.clear();
        if(proActAndBatState==null || prodTaskActiExelog==null ){
            return;
        }
        SystemCode activeEnd = proActAndBatState.getActiveEnd();
        if(activeEnd==null){
            return;
        }
        String phaseID = prodTaskActiExelog.getPhaseID();
        ProcedureReport procedureReport = handler.choseProcfeedWay(DealsEnum.MES);
        Map<String,Object> map = new HashMap<>();
        map.put("",produceTaskActive.getId());
        map.put("inComeType","pc");
        //结束
        if(activeEnd.getId().equals("womActiveEnd/02")){
            //将活动结束
            procedureReport.endActive(map);

            // 将phase进度表中的记录进行更新
//			batchPhaseExelogService.updateBatchPhaseState(phaseID);

            // 将批控的phaseID状态结束
//			produceTaskService.endPhaseActive(phaseID,false);
        }
        //放弃
        if(activeEnd.getId().equals("womActiveEnd/03")){

            //将活动结束
            procedureReport.endActive(map);

            // 将phase进度表中的记录进行更新
//			batchPhaseExelogService.updateBatchPhaseState(phaseID);

        }
//		//提前结束
//		if(activeEnd.getId().equals("womActiveEnd/04")){
//			// 将phase进度表中的记录进行更新
//			batchPhaseExelogService.updateBatchPhaseState(phaseID);
//
//			// 将批控的phaseID状态结束
//			produceTaskService.endPhaseActive(phaseID,false);
//		}


    }


}
