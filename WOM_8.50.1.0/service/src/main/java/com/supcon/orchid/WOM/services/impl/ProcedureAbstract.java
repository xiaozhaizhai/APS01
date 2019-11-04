package com.supcon.orchid.WOM.services.impl;



import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.WOM.daos.*;
import com.supcon.orchid.WOM.entities.*;
import com.supcon.orchid.WOM.enums.ResultEnum;
import com.supcon.orchid.WOM.services.*;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.foundation.services.DataPermissionService;
import com.supcon.orchid.foundation.services.SystemCodeService;
import com.supcon.orchid.publicSet.entities.PublicSetBatchInfo;
import com.supcon.orchid.publicSet.services.PublicSetBatchInfoService;

import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.services.BaseServiceImpl;
import com.supcon.orchid.workflow.engine.entities.Deployment;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.workflow.engine.services.ProcessService;
import com.supcon.orchid.workflow.engine.services.TaskService;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.*;

/**
 * Created By guding on 2019/2/22 15:39
 */
@Transactional
@Component
public abstract class ProcedureAbstract extends BaseServiceImpl implements ProcedureReport {

    /**
     *    待执行
     */
    public static final String TASK_STATE_TODO = "womTaskState/01";
    /**
     *    执行中
     */
    public static final String TASK_STATE_DOING = "womTaskState/02";
    /**
     *    已完成
     */
    public static final String TASK_STATE_DONE = "womTaskState/03";
    /**
     *    终止
     */
    public static final String TASK_STATE_STOP = "womTaskState/04";
    /**
     * processState/state01    待执行
     */
    public static final String PROCESS_STATE_TODO = "processState/state01";
    /**
     * processState/state02    执行中
     */
    public static final String PROCESS_STATE_DOING = "processState/state02";
    /**
     * processState/state03    已完成
     */
    public static final String PROCESS_STATE_DONE = "processState/state03";

    /**
     * 常规
     */
    public static final String ACTIVE_TYPE_COMMON = "activeType/activeType1";
    /**
     * 检验
     */
    public static final String ACTIVE_TYPE_INSPECT = "activeType/activeType5";
    /**
     * 产出
     */
    public static final String ACTIVE_TYPE_OUTPUT = "activeType/activeType6";
    /**
     * 投配料
     */
    public static final String ACTIVE_TYPE_BATCHING = "activeType/activeType4";
    /**
     * 配料
     */
    public static final String ACTIVE_TYPE_BATCHES = "activeType/activeType2";
    /**
     * 投料
     */
    public static final String ACTIVE_TYPE_CHARGE = "activeType/activeType3";
    /**
     * 发起类型(分辨是调整单还是正常的工序活动)---调整
     */
    public static final String ACTIVE_ADJUST = "adjust";
    /**
     * 发起类型(分辨是调整单还是正常的工序活动)---调整
     */
    public static final String ACTIVE_COMMON = "common";
    /**
     * 投料单表头
     */
    protected WOMPutInMaterial putInMaterial;
    /**
     * 投料单表体
     */
    protected List<WOMPutInMaterialPart> putInMaterialParts;
    /**
     * 生产报工单表头
     */
    protected WOMTaskReporting taskReporting;
    /**
     * 生产报工单表体
     */
    protected List<WOMTaskReportingPart> taskReportingParts;


    @Autowired
    protected WOMProduceTaskProcessDao produceTaskProcessDao;
    @Autowired
    protected WOMProduceTaskProcessService produceTaskProcessService;
    @Autowired
    protected WOMProduceTaskActiveDao produceTaskActiveDao;
    @Autowired
    protected WOMProduceTaskActiveService produceTaskActiveService;
    @Autowired
    protected WOMProduceTaskDao produceTaskDao;
    @Autowired
    protected WOMProdTaskProcExelogDao prodTaskProcExelogDao;
    @Autowired
    protected WOMProdTaskActiExelogDao prodTaskActiExelogDao;
    @Resource
    protected WOMInterfaceSelfService interfaceSelfService;
    @Autowired
    protected WOMQualityInspectDao qualityInspectDao;
    @Autowired
    protected WOMMaterialsOutputDao materialsOutputDao;
    @Resource
    protected SystemCodeService systemCodeService;
    @Autowired
    protected WOMProcFeedbackHeadDao procFeedbackHeadDao;
    @Autowired
    protected WOMTaskReportingPartService taskReportingPartService;
    @Autowired
    protected WOMTaskReportingService taskReportingService;
    @Autowired
    protected WOMBatchChargeService batchChargeService;
    @Autowired
    protected WOMPutInMaterialPartService putInMaterialPartService;
    @Autowired
    protected WOMPutInMaterialService putInMaterialService;
    @Autowired
    protected DataPermissionService dataPermissionService;
    @Autowired
    protected TaskService taskService;
    @Autowired
    protected WOMAdjustOrTempRecordsDao adjustOrTempRecordsDao;
    @Autowired
    protected WOMAdjustOrTempHeadDao adjustOrTempHeadDao;
    @Autowired
    protected PublicSetBatchInfoService batchInfoService;
    @Autowired
    protected ProcessService processService;
  	@Autowired
    protected WOMStandingcropRefDao standingcropRefDao;

    /* batch mes pda 的数据处理方法    start*/

    /**
     * 新增或更新批次信息
     * @param batchNum
     * @return
     * Created By guding
     */
    protected void updateOrAddBatchInfo(String batchNum,MESBasicProduct thisProd) {
        PublicSetBatchInfo batchInfo = null;
        if (StringUtils.isNotBlank(batchNum)) {
            batchInfo = batchInfoService.getBybatchNumNoException(batchNum);
        }
        if(batchInfo == null){
            batchInfo = new PublicSetBatchInfo();
        }
        batchInfo.setBatchNum(batchNum);// 批号
        batchInfo.setProduct(thisProd);// 物品

        SystemCode passState = null;
        SystemCode checkState = null;
        boolean isAvailable = false;

        // 物品需要质检
        if (thisProd != null && thisProd.getProductBePropCheck()) {
            checkState = (SystemCode) systemCodeService
                    .getSystemCodeByID("publicSetCheckState/02");// 待检验
            if (thisProd.getIsCtrlPass()) {
                passState = (SystemCode) systemCodeService
                        .getSystemCodeByID("publicSetPassState/02");// 待放行
            } else {
                passState = (SystemCode) systemCodeService
                        .getSystemCodeByID("publicSetPassState/01");// 无需放行
            }
        } else {
            if (thisProd.getIsCtrlPass()) {
                passState = (SystemCode) systemCodeService
                        .getSystemCodeByID("publicSetPassState/02");// 待放行
            } else {
                passState = (SystemCode) systemCodeService
                        .getSystemCodeByID("publicSetPassState/01");// 无需放行
                isAvailable = true;
            }
            checkState = (SystemCode) systemCodeService
                    .getSystemCodeByID("publicSetCheckState/01");// 无需检验
        }
        batchInfo.setCheckState(checkState);// 检验状态
        batchInfo.setIsAvailable(isAvailable);// 是否可用
        batchInfo.setPassState(passState);// 放行状态
        SystemCode sourceType = (SystemCode) systemCodeService
                .getSystemCodeByID("publicSetSourceType/05");
        batchInfo.setSourceType(sourceType);
        if (batchInfo.getId() == null) {
            batchInfoService.saveBatchInfoData(batchInfo);
        } else {
            batchInfoService.updateBatchInfoData(batchInfo);
        }
    }

    /**
     * 获取当前登录人
     * @return
     * Created By guding
     */
    protected User getUser() {
        User user = null;
        if (getCurrentUser() == null) {
            throw new BAPException("请登录后再操作！");
        }else {
            user = ((User) getCurrentUser());
        }
        return user;
    }

    /**
     * 插入活动执行记录
     * @param startTime
     * @param object    传入活动对象 1、WOMProduceTaskActive 或 2、WOMAdjustOrTempRecords
     * @return
     * Created By guding
     */
    protected WOMProdTaskActiExelog getWomProdTaskActiExelog(Date startTime, Object object,String type) {
        WOMProdTaskActiExelog prodTaskActiExelog = new WOMProdTaskActiExelog();
        User user = getUser();
        if (StringUtils.equals(type,ACTIVE_COMMON)) {       //当为 普通的活动时
            WOMProduceTaskActive produceTaskActive = (WOMProduceTaskActive) object;
            prodTaskActiExelog.setTaskProcessID(produceTaskActive.getOrderProcessId());
            prodTaskActiExelog.setTaskActiveID(produceTaskActive);
            prodTaskActiExelog.setTableInfoId(produceTaskActive.getHeadID().getTableInfoId());
            prodTaskActiExelog.setActiveName(produceTaskActive.getName());
            prodTaskActiExelog.setActiveType(produceTaskActive.getActiveType());
            prodTaskActiExelog.setActiveSource(produceTaskActive.getActiveSource());
            prodTaskActiExelog.setProductID(produceTaskActive.getProductId());
            prodTaskActiExelog.setFinalInspection(produceTaskActive.getFinalInspection());
            prodTaskActiExelog.setPlanNum(produceTaskActive.getPlanNum());
            prodTaskActiExelog.setRemark(produceTaskActive.getRemark());
            prodTaskActiExelog.setFormularActice(produceTaskActive.getActiveId());
            prodTaskActiExelog.setDataSource(produceTaskActive.getActiveId().getExeSystem());
            prodTaskActiExelog.setIsPassCheck(produceTaskActive.getActiveId().getIsPassCheck());
            prodTaskActiExelog.setTaskID(produceTaskActive.getHeadID());
            prodTaskActiExelog.setBatchNum(produceTaskActive.getHeadID().getProductBatchNum());
            if (StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_INSPECT)) {
                String batchNum = produceTaskActive.getHeadID().getProductBatchNum();
                if (!produceTaskActive.getFinalInspection()) {
                    batchNum = getBatchNum(produceTaskActive.getProductId(), batchNum).getData();

                }
                prodTaskActiExelog.setBatchNum(batchNum);
            }
        }else {     //当为 调整或者机动的活动时
            WOMAdjustOrTempRecords record = (WOMAdjustOrTempRecords) object;
            prodTaskActiExelog.setTaskProcessID(produceTaskProcessDao.get(record.getProcessID()));
            prodTaskActiExelog.setAdjustRecordID(record.getId());
            prodTaskActiExelog.setIsAdjust(true);
            prodTaskActiExelog.setTableInfoId(record.getHeaderID().getTableInfoId());
            prodTaskActiExelog.setActiveName(record.getActiceName());
            prodTaskActiExelog.setFormularActice(record.getFormularActive());
            prodTaskActiExelog.setActiveType(record.getActiveType());
            prodTaskActiExelog.setBatchNum(record.getHeaderID().getProductBatchNum());
            prodTaskActiExelog.setDataSource(new SystemCode("RMsystem/system3"));
            prodTaskActiExelog.setIsPassCheck(true);
            prodTaskActiExelog.setProductID(record.getRecordProduct());
            prodTaskActiExelog.setTaskID(record.getHeaderID());
            prodTaskActiExelog.setActiveSource(record.getRecordDataSource());
            if (StringUtils.equals(record.getActiveType().getId(),ACTIVE_TYPE_INSPECT)) {
                String batchNum = record.getHeaderID().getProductBatchNum();
                if (!record.getFinalInspection()) {
                    batchNum = getBatchNum(record.getRecordProduct(), batchNum).getData();

                }
                prodTaskActiExelog.setBatchNum(batchNum);
            }
        }
        prodTaskActiExelog.setStartTime(startTime);
        prodTaskActiExelog.setStaffID(user.getStaff());
        prodTaskActiExelogDao.save(prodTaskActiExelog);
        prodTaskActiExelogDao.flush();
        prodTaskActiExelogDao.clear();
        return prodTaskActiExelog;
    }

    /**
     * 根据生产批获取请检批号
     * （由于请检时如果不传入批次号，请检流程走不下去，这里暂时定为传入：
     *    生产批号 _ 物品ID _ *count*       这里的count --------- 会从数据库中读取  “生产批号 _ 物品ID _” 已经出现的次数
     *    然后累加
     * ）
     * 比如：当前生产批 ： exampleBatch01 , 请检物品是 "百草枯(id=1001)" , 那么本次请检批次号为 : exampleBatch01_1001_1
     *  如果这个生产过程中 还有一次 百草枯的请检  那么 请检批将会是 : exampleBatch01_1001_2
     *
     * @param product
     * @param batchNum
     * @return
     * Created By guding
     */
    private WOMResult<String> getBatchNum(MESBasicProduct product, String batchNum) {
        //计算当前生产批已经有多少个已经请检的单子，并叠加
        String sql = "SELECT COUNT(1)\n" +
                "FROM \n" +
                "      QUALITYMAN_MANU_INSPECTS THIS_ \n" +
                "      WHERE THIS_.PART_CODE like ? and THIS_.valid = 1";
        //获取次数 并加1
        int count = ((Number) produceTaskProcessDao.createNativeQuery(sql, batchNum + "_"+ product.getId() + "%").uniqueResult()).intValue() + 1;
        //请检批号暂定为 : 生产批号 + 请检物品 + 请检物品出现次数
        batchNum += "_" + product.getId() + "_" + count;
        //创建批次信息
        updateOrAddBatchInfo( batchNum ,product);
        return new WOMResult(ResultEnum.SUCCESS,batchNum);
    }

    /**
     * 插入工序执行记录
     * @param startTime
     * @param produceTaskProcess
     * Created By guding
     */
    protected void createProcExelog(Date startTime, WOMProduceTaskProcess produceTaskProcess) {
        WOMProdTaskProcExelog prodTaskProcExelog = new WOMProdTaskProcExelog();
        prodTaskProcExelog.setTaskProcessID(produceTaskProcess);
        prodTaskProcExelog.setTaskID(produceTaskProcess.getHeadId());
        prodTaskProcExelog.setStartTime(startTime);
        prodTaskProcExelog.setState(new SystemCode("womProActiveType/executing"));
        prodTaskProcExelogDao.save(prodTaskProcExelog);
        prodTaskProcExelogDao.flush();
        prodTaskProcExelogDao.clear();
    }

    /**
     * 开始指令单 1.2.7
     * @param Map<String,String>  taskId：指令单id；  staffId：操作人id；   startTime：开始时间
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息
     */
    //public Map<String, Object> startTask(Map<String, Object> map) {


    //	return null;
    //} 


    /**
     * 结束指令单 1.2.8
     * @param Map<String,String>  taskId：指令单id；  staffId：操作人id；   endTime：结束时间;  finishNum:完成数量;  isReport:是否报工(1:报工/0:不报工)
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息；   isReport:是否报工
     */
    //public Map<String, Object> endTask(Map<String, Object> map) {

    //	return null;
    //}


    /**
     * 开始工序 1.2.5
     * @param Map<String,String>  processId：工序id；  staffId：操作人id；   endTime：结束时间;
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息；
     */
    //public Map<String, Object> startProcess(Map<String, Object> map) {

    //	return null;
    //}


    /**
     * 结束工序  1.2.6
     * @param Map<String,String>  processId：工序id；  staffId：操作人id；   endTime：结束时间;  processExelogId:工序执行记录id
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息；
     */
    // public Map<String, Object> endProcess(Map<String, Object> map) {

    //	return null;
    //}

    /**
     * 开始活动 1.2.1
     * @param Map<String,String>  activeId：工序id；  staffId：操作人id；   startTime：开始时间;
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息； activeId：活动id;  activeType:活动类型
     */
    //public Map<String, Object> startActive(Map<String, Object> map){

    //	return null;
    //}


    /**
     * 结束活动 1.2.3
     * @param Map<String,String>  activeId：工序id；  staffId：操作人id；   endTime：结束时间;  putInNum:投入量；  outComeNum：产出量；    actiExelogId：活动执行记录id;  isAuto:是否手动结束活动(1/0)
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息；     isAuto:是否手动结束活动(1/0)
     */
    //public Map<String, Object> endActive(Map<String, Object> map){

    //	return null;
    //}

    /**
     * 机动活动开始 1.2.2
     * @param Map<String,String>  dealId：活动处理表id；  staffId：操作人id；   startTime：开始时间;
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息； dealId：活动处理表id;  activeType:活动类型；   adjustRecordid：活动处理记录表id
     */
    //public Map<String, Object> adjustStartActive(Map<String, Object> map){

    //	return null;
    //}

    /**
     * 机动活动结束 1.2.4
     * @param Map<String,String>  dealId：活动处理表id；  staffId：操作人id；   endTime：结束时间; putInNum：投入量；  actiExelogId：活动执行记录id；  isAuto:是否手动结束活动(1/0)
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息；；  isAuto:是否手动结束活动(1/0)
     */
    //public Map<String, Object> adjustEndActive(Map<String, Object> map){

    //	return null;
    //}
    //
    /**
     * 下推待投料记录 1.2.9
     * @param Map<String,String>  actiExelogId：活动执行记录id；  staffId：操作人id；   actTime：操作时间;   phaseId：phaseId
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息；
     */
    // public Map<String, Object> addwaitPutInRecord(Map<String, Object> map) {

    //	return null;
    //}

    /**
     * 下推请检单 1.2.10
     * @param Map<String,String>  actiExelogId：活动执行记录id；  staffId：操作人id；   actTime：操作时间;   phaseId：phaseId
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息；
     */
    //public Map<String, Object> addInspect(Map<String, Object> map) {

    //	return null;
    //}

    /**
     * 生成报工单 1.2.11
     * @param Map<String,String>  actiExelogId: 活动执行记录id;  staffId:操作人;  wareId:仓库编码;  storeId:货位编码;  reportType:报工类型(完成报工/过程报工);  productId：物品;  batchNum:批号;
     *                            reportNum:报工数量;  reportTime:报工时间
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息；
     */
    //public Map<String, Object> addTaskReport(Map<String, Object> map) {

    //	return null;
    //}

    /**
     * 1.2.12生成投料记录
     * @param
     * @return Map<String,String> resultCode：0（成功）/-1（失败）；  resultMsg：返回信息；
     */
    //public Map<String, Object> addPutInRecord(Map<String, Object> map) {

    //	return null;
    //}
    /* batch mes pda 的数据处理方法    end*/

    //开始工单//结束工单

    // public abstract
    @Transactional
    private String startActiveCompareParent(WOMProduceTaskProcess produceTaskProcess, WOMProduceTaskActive produceTaskActive, WOMProduceTask produceTask) {
        List<WOMProduceTaskActive> parentsProduceTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and headID=? and parentActive=1 and sort < ?", produceTaskProcess,produceTask,produceTaskActive.getSort());
        for (WOMProduceTaskActive taskActive : parentsProduceTaskActives) {
            if (!StringUtils.equals(taskActive.getExecSort(),produceTaskActive.getExecSort()) && StringUtils.equals(taskActive.getActiveState().getId(),PROCESS_STATE_DOING)) {
                return "活动 [" + taskActive.getName() + "] 还未完成,按照顺序限定不能开始当前活动！";
            }else if(!StringUtils.equals(taskActive.getExecSort(),produceTaskActive.getExecSort()) && StringUtils.equals(taskActive.getActiveState().getId(),PROCESS_STATE_TODO)){
                return "活动 [" + taskActive.getName() + "] 还未执行,按照顺序限定不能开始当前活动！";
            }
        }
        return null;
    }
    @Transactional
    protected WOMResult getCheckSort( WOMProduceTaskActive produceTaskActive, WOMProduceTaskProcess produceTaskProcess, WOMProduceTask produceTask) {
        //判断当前工序是否在可执行的顺序内
        List<WOMProduceTaskProcess> produceTaskProcesses = produceTaskProcessDao.findByHql(" from WOMProduceTaskProcess where valid = 1 and headId=? and exeOrder<? and processState.id!=?", produceTask,produceTaskProcess.getExeOrder(),PROCESS_STATE_DONE);
        if (produceTaskProcesses.size() > 0) {
            return new WOMResult(500,"请按照工序顺序开始活动！");
        }

        //大工序顺序比较完成之后 需要再比较每个活动
        //如果活动不是"投配料"活动，并且是父活动，只需要对比当前所有父节点的顺序即可
        if (produceTaskActive.getParentActive()) {
//             && !StringUtils.equals(ACTIVE_TYPE_BATCHING,produceTaskActive.getActiveType().getId())
            String error = startActiveCompareParent(produceTaskProcess, produceTaskActive, produceTask);
            if (error != null) return new WOMResult(500,error);
        }else {
            //如果当前活动是子活动，需要首先找到父节点，然后对比当前父节点的顺序，然后对比当前父节点下的所有子节点的顺序
            WOMProduceTaskActive parentProduceTaskActive = produceTaskActiveService.getProduceTaskActive(produceTaskActive.getParentActiveId());
            String error = startActiveCompareParent( produceTaskProcess, parentProduceTaskActive, produceTask);
            if (error != null) return new WOMResult(500,error);
            //接着比较所有子节点
            List<WOMProduceTaskActive> childrenProduceTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and parentActiveId=? and sort < ?", parentProduceTaskActive.getId(),produceTaskActive.getSort());
            for (WOMProduceTaskActive childrenProduceTaskActive : childrenProduceTaskActives) {
                if (!StringUtils.equals(childrenProduceTaskActive.getExecSort(),produceTaskActive.getExecSort()) && StringUtils.equals(childrenProduceTaskActive.getActiveState().getId(),PROCESS_STATE_DOING)) {
                    return new WOMResult(500,"活动 [" + childrenProduceTaskActive.getName() + "] 还未完成,按照顺序限定不能开始当前活动！");
                }else if (!StringUtils.equals(childrenProduceTaskActive.getExecSort(),produceTaskActive.getExecSort()) && StringUtils.equals(childrenProduceTaskActive.getActiveState().getId(),PROCESS_STATE_TODO)) {
                    return new WOMResult(500,"活动 [" + childrenProduceTaskActive.getName() + "] 还未开始,按照顺序限定不能开始当前活动！");
                }
            }
        }
        return new WOMResult(ResultEnum.SUCCESS);
    }

    /**
     * 活动开始之前需要判断是否在可执行的顺序之中
     * @param activeId
     * @return
     */
    @Transactional
    @Override
    public WOMResult checkSort(Long activeId) {
        if (activeId != null) {
            WOMProduceTaskActive produceTaskActive = produceTaskActiveDao.get(activeId);
            return getCheckSort(produceTaskActive, produceTaskActive.getOrderProcessId(), produceTaskActive.getHeadID());
        }else {
            return new WOMResult(500,"传入的活动ID为空！");
        }
    }

    protected void generateReportingBill(Date endTime, WOMProduceTask produceTask) {
        String taskReportingViewCode = "WOM_7.5.0.0_taskReporting_taskReportingEdit";
        taskReporting = new WOMTaskReporting();
        //指令单
        taskReporting.setTaskID(produceTask);
        taskReporting.setProductID(produceTask.getProductId());
        taskReporting.setBatchNum(produceTask.getProductBatchNum());
        taskReporting.setReportDate(endTime);
        //报工人
        taskReporting.setReportStaff(((User) getCurrentUser()).getStaff());
        //报工类型：完成报工
        taskReporting.setReportType(new SystemCode("womReportType/02"));

        //找到产出数据
        taskReportingParts = new ArrayList<>();
        WOMTaskReportingPart taskReportingPart = new WOMTaskReportingPart();
        taskReportingPart.setBatchNum(produceTask.getProductBatchNum());
        taskReportingPart.setRemark(produceTask.getRemark());
        taskReportingParts.add(taskReportingPart);

        //表体方法
        DataGridService dataGridService = getDataGridService();
        WorkFlowVar workFlowVar = new WorkFlowVar();
        /*
         *       autoReportOnFinish/01   不报工
         *       autoReportOnFinish/03   报工并提交
         *
         * */
        switch (produceTask.getAutoReportOnFinish().getId()) {
            case "autoReportOnFinish/02" : {    //报工不提交
                Staff staff = ((User) getCurrentUser()).getStaff();
                Long positionId = staff.getMainPosition().getId();
                taskReporting.setCreateStaff(staff);
                taskReporting.setCreatePositionId(positionId);
                taskReporting.setCreateDepartmentId(staff.getMainPosition().getDepartment().getId());
                taskReporting.setOwnerDepartmentId(staff.getMainPosition().getDepartment().getId());
                taskReporting.setOwnerPositionId(positionId);
                taskReporting.setOwnerStaffId(staff.getId());
                taskReporting.setStatus(88);

                Deployment taskReportingFlow = taskService.getCurrentDeployment("taskReportingFlow");
                Long deploymentId = taskReportingFlow.getId();
                String editActivityName = processService.findStartTransitions(deploymentId).getDestination().getName();
                Long staffId = ((User) getCurrentUser()).getStaff().getId();
                List<Long> workflowStaff = dataPermissionService.getPowerUserList(staffId, editActivityName, "taskReportingFlow", taskReportingFlow.getVersion() + "", positionId, null, false);
                workFlowVar.setOperateType("save");
                Set<Long> ids = new HashSet<>();
                ids.addAll(workflowStaff);
                workFlowVar.setAdditionalUsers(ids);
                List<Map<String, ?>> outcomeList = getMaps(deploymentId, ids);
                workFlowVar.setOutcome(processService.findStartTransitions(deploymentId).getName());
                workFlowVar.setOutcomeMap(outcomeList);

                taskReportingService.save(taskReporting, deploymentId, null, workFlowVar, dataGridService,taskReportingViewCode);
				break;
            }
            case "autoReportOnFinish/03" : {    //报工并提交(生效)
                taskReporting.setStatus(99);
                workFlowVar.setOperateType("submit");
                taskReportingService.saveSuperEditTaskReporting(taskReporting,workFlowVar,dataGridService,taskReportingViewCode,false);
              	break;
            }
        }
    }

    private List<Map<String, ?>> getMaps(Long deploymentId, Set<Long> ids) {
        List<Map<String, ?>> outcomeList = new ArrayList<Map<String, ?>>();
        for (Iterator scheduleStaff = ids.iterator(); scheduleStaff.hasNext(); ){
            Map<String, String> outcomeMap = new HashMap<String, String>();
            outcomeMap.put("dec", "保存");
            outcomeMap.put("type", "normal");
            outcomeMap.put("assignUser", scheduleStaff.next().toString());
            outcomeMap.put("outcome", processService.findStartTransitions(deploymentId).getName());
            outcomeList.add(outcomeMap);
        }
        return outcomeList;
    }

    private DataGridService getDataGridService() {
        return new DataGridService() {
            @Override
            public void execute() {
                if (taskReportingParts != null && !taskReportingParts.isEmpty()) {
                    for (WOMTaskReportingPart part : taskReportingParts) {
                        part.setTableInfoId(taskReporting.getTableInfoId());
                        part.setHeadId(taskReporting);
                        taskReportingPartService.saveTaskReportingPart(part, null, "taskReportingEdit");
                    }
                }
            }
        };
    }

}
