package com.supcon.orchid.WOM.services.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.supcon.orchid.WOM.daos.*;
import com.supcon.orchid.WOM.entities.*;

import com.supcon.orchid.WOM.enums.DealsEnum;
import com.supcon.orchid.WOM.services.impl.handler.ActiveChoseHandler;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.supcon.orchid.MESBasic.daos.impl.MESBasicBaseCustClassDaoImpl;
import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicObjWareStore;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.MESBasic.services.MESBasicFacWareMaterialService;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService;
import com.supcon.orchid.MESBasic.services.MESBasicObjWareStoreService;
import com.supcon.orchid.MESBasic.services.MaterialService;
import com.supcon.orchid.MESBasic.services.QCSService;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.services.RMCheckDepartmentSetService;
import com.supcon.orchid.RM.services.RMFormulaProcessActiveService;
import com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService;
import com.supcon.orchid.WOM.services.WOMInterfaceSelfService;
import com.supcon.orchid.WOM.services.WOMProduceTaskActiveService;
import com.supcon.orchid.WOM.services.WOMProduceTaskService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialPartService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialService;
import com.supcon.orchid.WOM.services.WOMTaskReportingPartService;
import com.supcon.orchid.WOM.services.WOMTaskReportingService;
import com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService;
import com.supcon.orchid.ec.entities.EntityTableInfo;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.publicSet.services.PublicSetActBatStateService;
import com.supcon.orchid.publicSet.services.WOMInterfaceService;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.services.BaseServiceImpl;
import com.supcon.orchid.workflow.engine.entities.Deployment;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.workflow.engine.services.IScriptService;
import com.supcon.orchid.workflow.engine.services.ProcessService;
import com.supcon.orchid.workflow.engine.services.TaskService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialPartService;

import org.apache.commons.lang.StringUtils;

import com.supcon.orchid.WOM.services.*;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.supcon.orchid.security.OrchidAuthenticationToken;

import java.util.Collection;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.supcon.orchid.foundation.services.UserService;
import com.supcon.orchid.orm.entities.IStaff;
import com.supcon.orchid.orm.entities.IRole;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.foundation.entities.Company;
import com.supcon.orchid.foundation.services.CompanyService;
import com.supcon.orchid.foundation.services.RoleService;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.i18n.InternationalResource;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

import com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService;
import com.supcon.orchid.MESBasic.services.MESBasicStoreSetService;
import com.supcon.orchid.WOM.services.WOMBatchingRejectPartsService;
import com.supcon.orchid.WOM.entities.WOMBatchingRejectParts;
import com.supcon.orchid.MESBasic.services.MESBasicInterfaceLogService;

/*******************接口导入 start**********************************/
import com.supcon.orchid.WOM.services.WSSyncTaskPayService;
import com.supcon.orchid.WOM.services.WsSyncWOMPutInMaterialService;
import com.supcon.orchid.services.ConsulService;
/*******************接口导入   end**********************************/

@Service("wom_interfaceService")
@Transactional
public class WOMInterfaceServiceImpl extends BaseServiceImpl implements
        IScriptService, WOMInterfaceService,WOMInterfaceSelfService, InitializingBean, DisposableBean{

    WOMTaskReporting report;
    private List<WOMTaskReportingPart> reportParts;
    @Resource
    private WOMTaskReportingService taskReportingService;
    @Resource
    private WOMTaskReportingPartService taskReportingPartService;
    @Resource
    private WOMProduceTaskService produceTaskService;
    @Resource
    private MESBasicFacWareMaterialService facWareMaterialService;
    @Resource
    private WOMPutInMaterialPartService putInMaterialPartService;
    @Resource
    private WOMPutInMaterialService putInMaterialService;
    @Autowired
    private BundleContext bundleContext;
    @Resource
    private WOMBatchingMaterialPartService  batchingMaterialPartService ;
    @Autowired
    private UserService userService;
    @Resource
    private RMCheckDepartmentSetService checkDepartmentSetService;
    @Autowired
    private UserService userServcie;
    @Autowired
    private CompanyService companyService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private UserDetailsService userDetailsService;
    @Resource
    private WOMProdTaskActiExelogService prodTaskActiExelogService;
    @Resource
    private WOMWaitPutinRecordsService waitPutinRecordsService;
    @Resource
    private WOMWaitPutinRecordsService waitPutinService;
    @Resource
    private WOMBatchPhaseExelogService batchPhaseExelogService;
    @Autowired
    private WOMBatchPhaseExelogDao batchPhaseExelogDao;
    @Autowired
    private WOMProdTaskProcExelogDao prodTaskProcExelogDao;
    @Autowired
    private WOMProduceTaskDao produceTaskDao;
    @Autowired
    private ProcessService processService;
    @Autowired
    private WOMPutInMaterialDao putInMaterialDao;
    @Autowired
    private WOMPutInMaterialPartDao putInMaterialPartDao;
    @Autowired
    private WOMProdTaskActiExelogDao prodTaskActiExelogDao;
    @Autowired
    private WOMProduceTaskActiveService produceTaskActiveService;
    @Autowired
    private MESBasicFactoryModelService factoryModelService;
    @Autowired
    private MESBasicProductService mESBasic_productService;
    @Autowired
    private RMFormulaProcessActiveService rMFormulaProcessActiveService;
    @Autowired
    private PublicSetActBatStateService actBatStateService;
    @Autowired
    private WOMAdjustOrTempHeadService adjustOrTempHeadService;
    @Autowired
    private WOMAdjustOrTempRecordsDao recordsDao;
    @Autowired
    private WOMProduceTaskActiveDao activeDao;
    /*******************接口导入 start**********************************/
    @Autowired
    private WsSyncWOMPutInMaterialService wsSyncWOMPutInMaterialService;
    @Autowired
    private WSSyncTaskPayService wsSyncTaskPayService;
    @Resource
    private ConsulService consulService;
    @Autowired
    private ActiveChoseHandler handler;
    /*******************接口导入   end**********************************/

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
     * 检验报告出来之后，进行的操作
     * @param activeRecordID  活动执行记录ID
     * @param batchNum   生产批号
     * @param isQualified  是否检验合格
     * @param dealType   处理类型  1-合格，2-让步，3-返工，4-报废，5-调整
     * @return
     */
    @Override
    public boolean  setPhaseFinish(Long activeRecordID,String batchNum,boolean isQualified,String dealType) {
        WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogService.getProdTaskActiExelog(activeRecordID);
        WOMProduceTaskActive prodTaskActive = prodTaskActiExelog.getTaskActiveID();
        //查到检验报告单
        Long checkResultID = null;
        String result = null;
        String sql = "SELECT ID,RESULT FROM QUALITYMAN_MANU_CHECKS WHERE VALID= 1 AND ACTIVE_ID = ? ORDER BY ID DESC";
        List<Object[]> list = prodTaskActiExelogDao.createNativeQuery(sql,activeRecordID).list();
        String errorMsg = "处理成功";
        if (!list.isEmpty()) {
            checkResultID = list.get(0)[0] != null ? Long.valueOf(list.get(0)[0].toString()) : null;
            result = list.get(0)[1] != null ? list.get(0)[1].toString() : null;
        }
        prodTaskActiExelog.setCheckResult(result);
        prodTaskActiExelog.setCheckResultID(checkResultID);
        prodTaskActiExelogDao.save(prodTaskActiExelog);
        prodTaskActiExelogDao.flush();
        prodTaskActiExelogDao.clear();
        Map<String,Object> map = new HashMap<>();
        if(prodTaskActive != null){
            prodTaskActive.setInspectResult(result);
            activeDao.save(prodTaskActive);
            activeDao.flush();
            activeDao.clear();
            if (prodTaskActive.getBatchPhaseID() == null) {
                if (StringUtils.equals("合格",result)){
                    //将活动结束
                    map.put("selectedActiveId",prodTaskActive.getId());
                    map.put("inComeType","pc");
                    WOMResult womResult = handler.choseProcfeedWay(DealsEnum.MES).endActive(map);
                    errorMsg = womResult.getMsg();
                }
            }else {
                //long long ago daima xian bu guan.
                if (usePhase(batchNum, isQualified, prodTaskActive)) return false;
            }
        }else {
            if (StringUtils.equals("不合格",result)) {
                WOMAdjustOrTempRecords adjustOrTempRecords = recordsDao.get(prodTaskActiExelog.getAdjustRecordID());
                adjustOrTempRecords.setInspectResult(result);
                adjustOrTempRecords.setInspectRecordId(checkResultID);
                recordsDao.save(adjustOrTempRecords);
                recordsDao.flush();
                recordsDao.clear();
            }
            //如果是从机动过来的检验，结束机动活动
            if (StringUtils.equals("合格",result) && StringUtils.isBlank(dealType) && prodTaskActiExelog.getAdjustRecordID() !=null && StringUtils.equals(prodTaskActiExelog.getActiveSource().getId(),"womActiveSource/04") ) {
                map.put("activeRecordId",prodTaskActiExelog.getAdjustRecordID());
                map.put("inComeType","pc");
                WOMResult womResult = handler.choseProcfeedWay(DealsEnum.MES).adjustEndActive(map);
                errorMsg =  womResult.getMsg();
            }
        }
        if(!StringUtils.equals(errorMsg,"处理成功")){
            throw new BAPException(errorMsg);
        }
        return true;
    }

    private boolean usePhase(String batchNum, boolean isQualified, WOMProduceTaskActive prodTaskActive) {
        WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),Restrictions.eq("taskActiveID",prodTaskActive),
                Restrictions.eq("phaseID",prodTaskActive.getBatchPhaseID()));//根据批控phaseId获取工单活动
        if(prodTaskActiExelog == null){
            log.error("找不到对应工序活动记录");
            return true;
        }
        if(prodTaskActiExelog.getBatchNum() != null && !batchNum.equals(prodTaskActiExelog.getBatchNum())){
            log.error("批号无法对应");
            return true;
        }

        if(isQualified){ //检验合格
            Date date = new Date();
            prodTaskActiExelog.setIsFinish(true);
            prodTaskActiExelog.setEndTime(date);
            prodTaskActiExelogService.saveProdTaskActiExelog(prodTaskActiExelog, null, null, null, false);//设置活动记录结束

            //如果一个phase对应多个活动，等所有活动都结束后再家属phase
            boolean allActiExelogFinish = true;
            List<WOMProdTaskActiExelog> prodTaskActiExelogs = prodTaskActiExelogDao.findByCriteria(Restrictions.eq("valid", true),
                    Restrictions.eq("phaseID",prodTaskActive.getBatchPhaseID()));
            if(prodTaskActiExelogs != null && prodTaskActiExelogs.size() > 0){
                for(WOMProdTaskActiExelog actiExelog : prodTaskActiExelogs){
                    if(!actiExelog.getIsFinish()){
                        allActiExelogFinish = false;
                    }
                }
            }
            if(allActiExelogFinish){
                endPhaseActive(prodTaskActiExelog.getPhaseID());//结束phase
            }
        }else{
            //目前检验不合格都重新发起请检
            addApplyCheckByActiveExelog(prodTaskActiExelog);

            /*if(dealType != null && "2".equals(dealType) ){//质检合格或者让步，立即结束活动
				Date date = new Date();
				prodTaskActiExelog.setIsFinish(true);
				prodTaskActiExelog.setEndTime(date);
				prodTaskActiExelogService.saveProdTaskActiExelog(prodTaskActiExelog, null, null, null, false);//设置活动记录结束

				endPhaseActive(prodTaskActiExelog.getPhaseID());//结束phase
		}else if(dealType != null &&
				("3".equals(dealType) || "4".equals(dealType) )){//返工或报废，异常结束活动、工序、工单，目前功能实现不了，暂时不考虑这种状况
			Date date = new Date();
			prodTaskActiExelog.setIsFinish(true);
			prodTaskActiExelog.setEndTime(date);
			prodTaskActiExelogService.saveProdTaskActiExelog(prodTaskActiExelog, null, null, null, false);//设置活动记录结束

			WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),
					Restrictions.eq("phaseID",prodTaskActiExelog.getPhaseID()));//根据批控phaseId获取工单活动
			if(batchPhaseExelog!=null){
				batchPhaseExelog.setEndTime(date);
				batchPhaseExelog.setIsFinish(true);//执行结束
				batchPhaseExelogDao.save(batchPhaseExelog);//设置phase记录结束
			}else{
				log.error("无法找到对应phase执行记录");
				return false;
			}

			WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true),
					Restrictions.eq("batchUnitID",batchPhaseExelog.getTaskProcessID().getBatchUnitID()));//根据批控unitId获取工单活动记录
			if(procExeLog!=null){
				procExeLog.setState(new SystemCode("womProActiveType/complete"));
				procExeLog.setEndTime(date);
				prodTaskProcExelogDao.save(procExeLog);
			}else{
				log.error("无法找到对应工序执行记录");
				return false;
			}

			WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true),
					Restrictions.eq("batchProdTaskID",batchPhaseExelog.getTaskID().getBatchProdTaskID()));//根据批控工单Id获取工单
			if(prodTask!=null){
				prodTask.setActEndTime(date);//修改工单结束执行时间
				prodTask.setTaskState(new SystemCode("womTaskState/03"));//先修改工单状态为结束
				produceTaskDao.save(prodTask);
			}else{
				log.error("无法找到对应工单执行记录");
				return false;
			}
		}else{//调整，发起另一张请检单
			addApplyCheckByActiveExelog(prodTaskActiExelog);
			}*/
        }
        return false;
    }

    /**
     * 生成报工记录
     * @param taskID 指令单ID
     * @param batchNum  生产批号
     * @param num  报工数量
     * @param staff 报工人
     */
    @Override
    public boolean addTaskReportingTable(Long taskID, String batchNum,BigDecimal num, Staff staff) {
        //模拟登陆
        User u=staff!=null?staff.getUser():null;
        if(u!=null){
            String companyCode=u.getStaff().getMainPosition().getCompany().getCode();
            setSession(u.getName(),companyCode);
        }else{
            throw new BAPException("用户登陆失败，不能生成报工记录");
        }
        report= new WOMTaskReporting();
        // 报工表头数据回填
        WOMProduceTask task=new WOMProduceTask();
        if(taskID!=null){
            task=produceTaskService.getProduceTask(taskID);
        }
        if(task==null && batchNum!=null){
            task=produceTaskService.getProduceTasks("productBatchNum= '"+batchNum+"'", null).size()>0?
                    produceTaskService.getProduceTasks("productBatchNum= '"+batchNum+"'", null).get(0):null;
        }
        //如果指令单为空，则结束该方法
        if(task==null){
            return false;
        }
        report.setTaskID(task);
        report.setBatchNum(task.getProductBatchNum());
        report.setProductID(task.getProductId());
        report.setReportDate(new Date());
        report.setReportStaff(staff);
        report.setReportType(new SystemCode("womReportType/02"));
        //仓库  根据车间仓中设置的信息查找   modify by pl  20170807
        MESBasicFacWareMaterial facWareMaterial=this.getFacWareMaterialByfp(task.getFactoryId(), task.getProductId());
        if(facWareMaterial!=null){
            report.setWareID(facWareMaterial.getWareId());
        }
        // 表体数据
        reportParts = new ArrayList<WOMTaskReportingPart>();
        WOMTaskReportingPart part= new WOMTaskReportingPart();
        part.setTaskID(task);
        part.setBatchNum(task.getProductBatchNum());
        part.setProductID(task.getProductId());
        part.setReportDate(new Date());
        part.setReportStaff(staff);
        part.setReportType(new SystemCode("womReportType/02"));
        part.setProBatchNum(task.getProductBatchNum());
        part.setReportNum(num);
        //仓库与货位
        if(facWareMaterial!=null){
            part.setWareId(facWareMaterial.getWareId());
            part.setStoreID(facWareMaterial.getStoreId());
        }
        reportParts.add(part);
        DataGridService dataGridService = new DataGridService() {
            @Override
            public void execute() {
                if (reportParts != null && !reportParts.isEmpty()) {
                    for (WOMTaskReportingPart item : reportParts) {
                        item.setHeadId(report);
                        item.setTableInfoId(report.getTableInfoId());
                        //taskReportingPartService.saveTaskReportingPart(item, null, "WOM_7.5.0.0_taskReporting_taskReportingView","noEvent");
                        taskReportingPartService.saveTaskReportingPart(item, null, null,"noEvent");
                    }
                }
            }
        };
        // 将新生成的表单变为生效状态
        WorkFlowVar workFlowVar = new WorkFlowVar();
        workFlowVar.setOperateType("submit");
        // 生效
        //taskReportingService.saveSuperEditTaskReporting(report, workFlowVar, dataGridService, "", false);
        taskReportingService.saveUserByBatch(report, workFlowVar, dataGridService, "", false);

        //生成SAP的生产入库单
        /*******************接口导入 start**********************************/
        if(consulService.getValueAsBoolean("platform/bap/WOM/WOM.isSynSAP")){
            wsSyncTaskPayService.sendSAP(taskID);
        }
        /*******************接口导入   end**********************************/

        return true;

    }


    /**
     *  根据活动记录生成投料记录
     * 	activeExelog 活动执行记录
     *  isPDA 是否PDA执行
     *  userName 用户名
     */
    private List<WOMPutInMaterialPart> parts;
    private WOMPutInMaterial putInMaterial;
    @Override
    public void addPutinRecordByActiceExelog(WOMProdTaskActiExelog activeExelog, Boolean isPDA,String userName) {
        //模拟登陆
        User u=userService.getUser(userName);
        if(u!=null){
            String companyCode=u.getStaff().getMainPosition().getCompany().getCode();
            setSession(userName,companyCode);
        }else{
            throw new BAPException("用户登陆失败，不能生成投料记录");
        }

        putInMaterial= new WOMPutInMaterial();
        // 投料单表头数据回填
        putInMaterial.setPutinStaff(activeExelog.getStaffID());
        if (isPDA) {
            putInMaterial.setPutinType(new SystemCode("womPutinType/03"));
        } else {
            putInMaterial.setPutinType(new SystemCode("womPutinType/02"));
        }
        putInMaterial.setTaskID(activeExelog.getTaskID());
        Long cId = getCurrentCompanyId();
        if(cId == null){
            cId = activeExelog.getCid();
        }
        putInMaterial.setCid(cId);
        putInMaterial.setCreateStaffId(u.getStaff().getId());
        putInMaterial.setCreatePositionId(u.getStaff().getMainPositionId());
        putInMaterial.setCreateDepartmentId(u.getStaff().getMainPosition().getDepartment().getId());
        putInMaterial.setOwnerStaffId(u.getStaff().getId());
        putInMaterial.setOwnerPositionId(u.getStaff().getMainPositionId());
        putInMaterial.setOwnerDepartmentId(u.getStaff().getMainPosition().getDepartment().getId());
        // 表体数据
        parts = new ArrayList<WOMPutInMaterialPart>();

        //PDA投料  modify by pl  20170807
        if(isPDA ){

			/*
			WorkFlowVar workFlowVar = new WorkFlowVar();
			workFlowVar.setOperateType("save");
			Deployment deployment=processService.getCurrentDeploymentByKey("putinFlow");
			if(deployment==null){
				throw new BAPException(InternationalResource.get("WOM.erroMeasge.radion14829pppp93"));
			}
            */

            putInMaterial.setVersion(0);
            putInMaterial.setStatus(99);
            //20171109
            putInMaterialService.saveWOMPutInMaterialByDao(putInMaterial);

			/*
            putInMaterialService.save(putInMaterial, deployment.getId(), null, workFlowVar, null, "WOM_7.5.0.0_putInMaterial_putinView");
			putInMaterialDao.flush();
			putInMaterialDao.createNativeQuery("update EC_TABLE_INFO set STATUS=99 where id=?", putInMaterial.getTableInfoId()).executeUpdate();
			 //将代办删除
			putInMaterialDao.createNativeQuery("delete from wf_pending where table_info_id=?",putInMaterial.getTableInfoId()).executeUpdate();
			*/


            WOMPutInMaterialPart part= new WOMPutInMaterialPart();
            part.setHeadId(putInMaterial);
            part.setTableInfoId(putInMaterial.getTableInfoId());
            part.setCid(cId);
            if(activeExelog != null){
                part.setBatchNum(activeExelog.getProductNum());
                /*List<WOMBatchingMaterialPart> bms=batchingMaterialPartService.getBatchingMaterialParts("phaseID='"+activeExelog.getPhaseID()+"'", null);
                if(bms != null && bms.size() > 0){
                	part.setBatchNum(bms.get(0).getBatchNum());
                }*/
                part.setFactoryId(activeExelog.getFactoryID());
                part.setProductId(activeExelog.getProductID());

                Date startTime = activeExelog.getStartTime() != null ? activeExelog.getStartTime():new Date();
                part.setPutinDate(startTime);
                Date endTime = activeExelog.getEndTime() != null ? activeExelog.getEndTime():new Date();
                part.setPutinEndDate(endTime);
                part.setPutinStaff(activeExelog.getStaffID());
                part.setPutinType(putInMaterial.getPutinType());
                Long between=(endTime.getTime() - startTime.getTime())/1000;//除以1000是为转换成秒
                Long min=between/60;
                part.setTakeTime(min.intValue());

                part.setTaskActiveId(activeExelog.getTaskActiveID());
                part.setTaskID(activeExelog.getTaskID());
                part.setTaskProcessId(activeExelog.getTaskProcessID());
                part.setUseNum(activeExelog.getActualNum());
            }

            if(activeExelog.getActiveType() != null){
                //如果是投配料或者配料活动，仓库货物从配料仓查找  modify by pl  20170807
                if( "activeType/activeType2".equals(activeExelog.getActiveType().getId()) ||  "activeType/activeType4".equals(activeExelog.getActiveType().getId()) ){
                    MESBasicObjWareStore wareStore=this.getObjWareStoreByfp(activeExelog.getFactoryID(), activeExelog.getProductID());
                    if(wareStore!=null){
                        part.setWareID(wareStore.getWare());
                        part.setStoreID(wareStore.getStore());
                    }

                }
                //如果是手工投料活动，仓库货物从车间仓查找  modify by pl  20170807
                if( activeExelog.getActiveType().getId().equals("activeType/activeType3")  ){
                    MESBasicFacWareMaterial wareStore=this.getFacWareMaterialByfp(activeExelog.getFactoryID(), activeExelog.getProductID());
                    if(wareStore!=null){
                        part.setWareID(wareStore.getWareId());
                        part.setStoreID(wareStore.getStoreId());
                    }

                }
            }

            putInMaterialPartDao.save(part);

            // 添加生成SAP出库单的数据，此时仓库与货位应该可以拿到了
            /*******************接口导入 start**********************************/

            if(consulService.getValueAsBoolean("platform/bap/WOM/WOM.isSynSAP")){
                wsSyncWOMPutInMaterialService.syncWOMPutInMaterial(putInMaterial.getId()); // webservice
            }
            /*******************接口导入   end**********************************/
        }
        //批控投料--投配料，根据投配料查找对应的配料活动  modify by pl  20170807
        if(!isPDA && activeExelog.getActiveType().getId().equals("activeType/activeType4") ){

            List<WOMBatchingMaterialPart> bms=batchingMaterialPartService.getBatchingMaterialParts("phaseID='"+activeExelog.getPhaseID()+"'", null);
            for(WOMBatchingMaterialPart bm:bms){
                WOMPutInMaterialPart part= new WOMPutInMaterialPart();
                part.setCid(cId);
                part.setBatchNum(bm.getBatchNum());
                part.setFactoryId(bm.getFactoryId());
                part.setProductId(bm.getProductId());
                part.setPutinDate(new Date());
                part.setPutinEndDate(new Date());
                part.setPutinStaff(activeExelog.getStaffID());
                part.setPutinType(putInMaterial.getPutinType());
                part.setTakeTime(0);
                part.setTaskActiveId(activeExelog.getTaskActiveID());
                part.setTaskID(activeExelog.getTaskID());
                part.setTaskProcessId(activeExelog.getTaskProcessID());
                part.setUseNum(bm.getDoneNum());
                part.setTaskProcessId(activeExelog.getTaskProcessID());
                MESBasicObjWareStore wareStore=this.getObjWareStoreByfp(activeExelog.getFactoryID(), activeExelog.getProductID());
                if(wareStore!=null){
                    part.setWareID(wareStore.getWare());
                    part.setStoreID(wareStore.getStore());
                }
                parts.add(part);
            }
            DataGridService dataGridService = new DataGridService() {
                @Override
                public void execute() {
                    if (parts != null && !parts.isEmpty()) {
                        for (WOMPutInMaterialPart item : parts) {
                            item.setHeadId(putInMaterial);
                            item.setTableInfoId(putInMaterial.getTableInfoId());
                            putInMaterialPartService.savePutInMaterialPart(item, null, "WOM_7.5.0.0_putInMaterial_putinView","noEvent");
                        }
                    }
                }
            };
            // 将新生成的表单变为生效状态
            WorkFlowVar workFlowVar = new WorkFlowVar();
            workFlowVar.setOperateType("submit");
            // 生效
            //putInMaterialService.saveSuperEditPutInMaterial(putInMaterial, workFlowVar, dataGridService, null, false);
            putInMaterialService.saveUsedByInterface(putInMaterial, workFlowVar, dataGridService, null, false);

            // 添加生成SAP出库单的数据，此时仓库与货位应该可以拿到了
            /*******************接口导入 start**********************************/

            if(consulService.getValueAsBoolean("platform/bap/WOM/WOM.isSynSAP")){
                wsSyncWOMPutInMaterialService.syncWOMPutInMaterial(putInMaterial.getId()); // webservice
            }
            /*******************接口导入   end**********************************/
        }
        //批控自动投料--不需要配料   modify by pl  20170807
        if(!isPDA && activeExelog.getActiveType().getId().equals("activeType/activeType3") ){
            WOMPutInMaterialPart part= new WOMPutInMaterialPart();
            part.setCid(cId);
            //part.setBatchNum(activeExelog.getBatchNum());//自动投料没有物料批号
            part.setFactoryId(activeExelog.getFactoryID());
            part.setProductId(activeExelog.getProductID());
            Date startTime = activeExelog.getStartTime() != null ? activeExelog.getStartTime():new Date();
            part.setPutinDate(startTime);
            Date endTime = activeExelog.getEndTime() != null ? activeExelog.getEndTime():new Date();
            part.setPutinEndDate(endTime);
            part.setPutinStaff(activeExelog.getStaffID());
            part.setPutinType(putInMaterial.getPutinType());
            Long between=(endTime.getTime() - startTime.getTime())/1000;//除以1000是为转换成秒
            Long min=between/60;
            part.setTakeTime(min.intValue());
            part.setTaskActiveId(activeExelog.getTaskActiveID());
            part.setTaskID(activeExelog.getTaskID());
            part.setTaskProcessId(activeExelog.getTaskProcessID());
            part.setUseNum(activeExelog.getActualNum());
            //如果是批控自动投料活动，仓库货物从车间仓查找
            MESBasicFacWareMaterial wareStore=this.getFacWareMaterialByfp(activeExelog.getFactoryID(), activeExelog.getProductID());
            if(wareStore!=null){
                part.setWareID(wareStore.getWareId());
                part.setStoreID(wareStore.getStoreId());
            }
            parts.add(part);
            DataGridService dataGridService = new DataGridService() {
                @Override
                public void execute() {
                    if (parts != null && !parts.isEmpty()) {
                        for (WOMPutInMaterialPart item : parts) {
                            item.setHeadId(putInMaterial);
                            item.setTableInfoId(putInMaterial.getTableInfoId());
                            putInMaterialPartService.savePutInMaterialPart(item, null, "WOM_7.5.0.0_putInMaterial_putinView","noEvent");
                        }
                    }
                }
            };
            // 将新生成的表单变为生效状态
            WorkFlowVar workFlowVar = new WorkFlowVar();
            workFlowVar.setOperateType("submit");
            // 生效
            //putInMaterialService.saveSuperEditPutInMaterial(putInMaterial, workFlowVar, dataGridService, null, false);
            putInMaterialService.saveUsedByInterface(putInMaterial, workFlowVar, dataGridService, null, false);

            // 添加生成SAP出库单的数据，此时仓库与货位应该可以拿到了
            /*******************接口导入 start**********************************/

            if(consulService.getValueAsBoolean("platform/bap/WOM/WOM.isSynSAP")){
                wsSyncWOMPutInMaterialService.syncWOMPutInMaterial(putInMaterial.getId()); // webservice
            }
            /*******************接口导入   end**********************************/

        }



    }


    /**
     *  根据活动记录生成请检单
     * 	activeExelog 活动执行记录
     */
    @Transactional
    @Override
    public void addApplyCheckByActiveExelog(WOMProdTaskActiExelog activeExelog) {
        Map<String, Object> paramMap=new HashMap<String, Object>();
        paramMap.put("UpTableId", activeExelog.getTaskID().getId());
        paramMap.put("UpTableType", "QMupTableType/taskOrder");
        paramMap.put("TableType", "QMtableType/manu");
        Long prodId = null;
        //如果是过程检，加入生产批的衍生批号
        if(activeExelog.getFinalInspection()){
            prodId = activeExelog.getTaskID().getProductId().getId();
            paramMap.put("BusiType", "QMbusiTypeManu/manu");
        }else{
            prodId = activeExelog.getFormularActice().getProduct()!=null?
                    activeExelog.getFormularActice().getProduct().getId():null;
            paramMap.put("BusiType", "QMbusiTypeManu/process");
        }

        //请检单创建人、创建部门根据配方中设置的请检部门查找
        if(activeExelog.getFormularActice()!=null && !"".equals( activeExelog.getFormularActice()) ){
            List<RMCheckDepartmentSet> cds=checkDepartmentSetService.getCheckDepartmentSets("activeID="+activeExelog.getFormularActice().getId(), null);
            if(cds.size()>0){
                RMCheckDepartmentSet cd=cds.get(0);
                paramMap.put("CreateStaffId", cd.getApplyCheckStaff().getId());
                paramMap.put("CreateDeptId", cd.getApplyCheckDept().getId());
                paramMap.put("CreatePositionId", cd.getApplyCheckStaff().getMainPositionId());
                paramMap.put("CheckDeptId", cd.getExeCheckDept().getId());
            }else{
                paramMap.put("CreateStaffId", activeExelog.getTaskID().getCreateStaffId());
              	paramMap.put("CreateDeptId", activeExelog.getTaskID().getOwnerPosition().getDepartment().getId());
                paramMap.put("CreatePositionId", activeExelog.getTaskID().getCreateStaff().getMainPositionId());
            }
        }

        paramMap.put("CreateTime", new Date());
        //请检物品信息
        List<Map<String,Object>> prodList=new ArrayList<Map<String,Object>>();
        Map<String, Object> prodListParamMap=new HashMap<String, Object>();
        if(activeExelog.getFormularActice()!=null ){
            //物品ID
            prodListParamMap.put("ProdId",prodId);
            //质量标准
            prodListParamMap.put("StandId", activeExelog.getFormularActice().getQualityStandard()!=null?
                    activeExelog.getFormularActice().getQualityStandard().getId():null);
            //样品模板
            prodListParamMap.put("SamleProjId", activeExelog.getFormularActice().getTestProduct()!=null?
                    activeExelog.getFormularActice().getTestProduct().getId():null);

            //是否需要不良品处理  add by pl 2017-11-07
            prodListParamMap.put("NeedDeal", activeExelog.getIsPassCheck());
            //批号
            prodListParamMap.put("BatchCode", activeExelog.getBatchNum());

        }
        prodList.add(prodListParamMap);
        paramMap.put("ProdList", prodList);
        paramMap.put("BatchNum", activeExelog.getTaskID().getProductBatchNum());
        paramMap.put("ProcessId", activeExelog.getTaskProcessID()!=null?activeExelog.getTaskProcessID().getId():null);
        //活动执行记录ID传给请检单
        paramMap.put("ActiveId", activeExelog.getId());

        Long cId = getCurrentCompanyId();
        if(cId == null){
            cId = activeExelog.getCid();
        }
        paramMap.put("CID", cId);

        //请检单的备注信息进行拼接
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("指令单："+activeExelog.getTaskID().getTableNo());
        if(activeExelog.getTaskProcessID()!=null){
            stringBuffer.append("; 工序："+activeExelog.getTaskProcessID().getName());
        }
        stringBuffer.append("; 活动："+activeExelog.getActiveName());
        if (activeExelog.getActiveSource() != null){
            stringBuffer.append("; 来源于："+activeExelog.getActiveSource().getFullPathName());
        }
        paramMap.put("Memo", stringBuffer.toString());

        ServiceReference ref = bundleContext.getServiceReference(QCSService.class.getName());
        if(null != ref) {
            QCSService qCSService = (QCSService) bundleContext.getService(ref);
            qCSService.createInspect(paramMap);
        }else {
            // 如果物料模块未发布，则 ref 为空，需要提示用户发布质量模块
            throw new BAPException("质量模块未发布，无法生成请检单，请联系管理员！");
        }
    }


    /**
     * 需要手工操作的phase，操作之后将批控的phase结束
     * @param phaseID
     * @return
     */
    public void endPhaseActive(String phaseID){
        // 将phase进度表中的记录进行更新
        batchPhaseExelogService.updateBatchPhaseState(phaseID);
        // 将批控的phaseID状态结束
        produceTaskService.endPhaseActive(phaseID,false);
    }


    //后台模拟登录，会创建session
    private void setSession(String username,String companyCode){
        Authentication authentication = null;
        UserDetails details = null;
        Company company = companyService.getCompanyByCode(companyCode);
        details = userDetailsService.loadUserByUsername(username +"$$"+company.getId());
        authentication = new UsernamePasswordAuthenticationToken(details, details.getPassword(), details.getAuthorities());

        User user = (User) authentication.getPrincipal();
        IStaff staff = user.getStaff();
        List<com.supcon.orchid.foundation.entities.Role> rolelist = roleService.getRoles(user, company);
        List<IRole> roles = new ArrayList<IRole>();
        for(com.supcon.orchid.foundation.entities.Role role : rolelist){
            roles.add((IRole)role);
        }
        authentication = new OrchidAuthenticationToken(authentication.getPrincipal(), authentication.getCredentials(),
                authentication.getDetails(), company, staff, (Collection)roles, user.getAuthorities());

        SecurityContext securityContext = SecurityContextHolder.getContext();
        securityContext.setAuthentication(authentication);
    }

    /**
     * PDA扫码投料完成时，调用此方法，在MES中生成投料记录，生成活动执行记录，将配料记录的状态改为已投料，将待投料记录修改为已执行
     * @param waitPutinRecordID   待投料记录ID
     * @param userName  投料用户
     * @return
     */
    @Override
    public void addRecordsAndUpdateState(Long waitPutinRecordID,
                                         String userName) {
        // 将配料记录的状态改为已投料
        WOMWaitPutinRecords record = waitPutinRecordsService
                .getWaitPutinRecords(waitPutinRecordID);
        if (record.getBatchMaterialID() != null) {
            batchingMaterialPartService.updateBatchMaterialState(record
                    .getBatchMaterialID());
        }
        // 将待投料记录修改为已执行
        waitPutinService.updateWaitPutinRecordState(record,userName);
        // 生成活动执行记录
        WOMProdTaskActiExelog actiExelog = prodTaskActiExelogService
                .addActiExelogByWaitPutinRecord(record);
        // MES中生成投料记录
        addPutinRecordByActiceExelog(actiExelog,
                true, userName);
    }

    /**
     * PDA判断工作单元是否存在方法
     * @param factoryCode
     * @return
     */
    @Override
    public String checkFactoryCode(String factoryCode) {
        StringBuilder factoryCodeStr = new StringBuilder("");
        List<MESBasicFactoryModel> factoryCodeList = new ArrayList<MESBasicFactoryModel>();
        List<Object> params = new ArrayList<Object>();
        String[] factoryCodeArr = factoryCode.split(",", -1);
        String sql = "this_.CODE = ? AND this_.valid = 1 ";
        for(int i=0;i<factoryCodeArr.length;i++){
            params.clear();
            params.add(factoryCodeArr[i]);
            factoryCodeList =  factoryModelService.getFactoryModels(sql, params);
            if(factoryCodeList.size() == 0){   //不存在,拼接
                factoryCodeStr = factoryCodeStr.append(factoryCodeArr[i]).append(",");
            }

        }
        if(factoryCodeStr.length() > 0){
            factoryCodeStr.deleteCharAt(factoryCodeStr.length()-1);
        }
        return factoryCodeStr.toString();
    }

    /**
     * PDA手工投料，确认，根据待投料记录ID,更新待投料记录的实际投料数量、投料人，且在MES中生成活动执行记录、投料记录
     */
    @Override
    public void addPutinRecordsAndUpdateActualNum(Boolean confirmFlag,Long waitPutinRecordID,
                                                  Double currentNum,String product, String productNum, String userName,String productProperty) {
        //非机动投料时 更新待投料记录：实际投料数量、投料人
        WOMWaitPutinRecords waitPutinRecord = waitPutinRecordsService.getWaitPutinRecords(waitPutinRecordID);
        if(confirmFlag){
            waitPutinRecordsService.updateActualNum(waitPutinRecord,currentNum, userName);
        }

        //生成活动执行记录
        WOMProdTaskActiExelog actiExelog = null;
        actiExelog = prodTaskActiExelogService
                .addActiExelogByWaitPutinRecordByHand(waitPutinRecord,currentNum,product, productNum, userName,confirmFlag,productProperty);

        //MES中生成投料记录
        addPutinRecordByActiceExelog(actiExelog,
                true, userName);
    }

    /**
     * PDA手工投料：结束，根据待投料记录ID,结束待投料记录
     */
    @Override
    public void endWaitPutinRecords(Long waitPutinRecordID,String userName) {
        WOMWaitPutinRecords waitPutinRecord = waitPutinRecordsService.getWaitPutinRecords(waitPutinRecordID);
        // 将待投料记录修改为已执行
        waitPutinRecordsService.updateWaitPutinRecordState(waitPutinRecord,userName);
    }

    /**
     * PDA手工投料 根据物品编码判断物品是否存在方法
     * @param product  物品编码/代码
     * @param productProperty   物品属性标志
     * @return
     */
    @Override
    public List<MESBasicProduct> checkProduct(String product,String productProperty) {
        List<MESBasicProduct> productList = null;
        if("code".equals(productProperty)){
            productList = mESBasic_productService.findByProperty("productCode", product);
        }else if("model".equals(productProperty)){
            productList = mESBasic_productService.findByProperty("productModel", product);
        }
        return productList;
    }

    /**
     * PDA掺料处理，根据工作单元编码查询有执行中的工序的工作单元
     * @param factoryCode
     * @return
     */
    @Override
    public List<Map<String, Object>> getProcessingFacList(String factoryCode) {
        String[] factoryCodeArr = factoryCode.split(",");

        String hqlString = "from MESBasicFactoryModel where code in (:list) AND valid = 1 ";
        List<MESBasicFactoryModel> factoryCodeList =  prodTaskProcExelogDao.createQuery(hqlString).setParameterList("list", Arrays.asList(factoryCodeArr)).list();
		/*StringBuilder sBuilder = new StringBuilder("code in (");
		for (int i = 0; i < factoryCodeArr.length; i++) {
			sBuilder.append("'").append(factoryCodeArr[i]).append("',");
		}
		sBuilder.deleteCharAt(sBuilder.length()-1).append(") and valid = 1 ");
		List<MESBasicFactoryModel> factoryCodeList =  factoryModelService.getFactoryModels(sBuilder.toString(), null);*/

        String hql= "select distinct procExelog from WOMProdTaskProcExelog procExelog,WOMWaitPutinRecords waitPutinRds where "
                + "procExelog.taskProcessID = waitPutinRds.taskProcessID and procExelog.state = 'womProActiveType/executing' "
                + "and waitPutinRds.activeSource = 'womActiveSource/02' and waitPutinRds.isFinish = false and waitPutinRds.mobileTerminal = true "
                + "and procExelog.factoryID.code in (:list) ";

        Query query = prodTaskProcExelogDao.createQuery(hql);
        List<WOMProdTaskProcExelog> procExelogsList = query.setParameterList("list", Arrays.asList(factoryCodeArr)).list();

        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        for(int i = 0;i < factoryCodeList.size();i++){
            Map<String, Object> map = new HashMap<String, Object>();
            for (int j = 0; j < procExelogsList.size(); j++) {
                if (factoryCodeList.get(i).getCode().equals(procExelogsList.get(j).getFactoryID().getCode())) {
                    map.put("factoryName", factoryCodeList.get(i).getName());
                    if (procExelogsList.get(j).getTaskID() != null) {
                        map.put("productBatchNum", procExelogsList.get(j).getTaskID().getProductBatchNum());
                    }else {
                        map.put("productBatchNum", null);
                    }
                    map.put("taskProcessID", procExelogsList.get(j).getTaskProcessID().getId());
                    map.put("id", procExelogsList.get(j).getId());
                    list.add(map);
                    break;
                }
                if(j == procExelogsList.size()-1){
                    map.put("factoryName", factoryCodeList.get(i).getName());
                    map.put("productBatchNum", null);
                    map.put("taskProcessID", null);
                    map.put("id", -1L);
                    list.add(map);
                }
            }
            if (procExelogsList.size() == 0) {
                map.put("factoryName", factoryCodeList.get(i).getName());
                map.put("productBatchNum", null);
                map.put("taskProcessID", null);
                map.put("id", -1L);
                list.add(map);
            }
        }
        //重新排序-降序
        /*Collections.sort(list, new Comparator<Map<String,Object>>() {

         *//**
         * return 1 表示m1 < m2; 0 表示m1 = m2; -1 表示m1 > m2
         *//*
			@Override
			public int compare(Map<String, Object> m1, Map<String, Object> m2) {
				//按照id大小降序
				if (Long.parseLong(m1.get("id") != null ? m1.get("id").toString():"-1") < Long.parseLong(m2.get("id") != null ? m2.get("id").toString():"-1")) {
					return 1;
				}else if (Long.parseLong(m1.get("id") != null ? m1.get("id").toString():"-1") == Long.parseLong(m2.get("id") != null ? m2.get("id").toString():"-1")) {
					return 0;
				}
				return -1;
			}

		});*/
        List<Map<String, Object>> list2 = new ArrayList<Map<String,Object>>();
        Iterator<Map<String, Object>> iterator = list.iterator();
        while (iterator.hasNext()) {
            Map<String, Object> map = iterator.next();
            if (Long.valueOf(map.get("id").toString()).equals(-1L)) {
                list2.add(map);
                iterator.remove();
            }

        }
        list.addAll(list2);
        return list;
    }

    /**
     * PDA调整/机动处理，根据【不良品处理单ID、配方工序ID用于调整处理】【指令单工序ID、配方工序ID用于机动处理】查询配方工序活动（调整措施）及执行次数、开始/结束状态
     * @param rejectsDealID
     * @param formulaProcessID
     * @param taskProcessID
     * @return
     */
    @Override
    public List<Map<String, Object>> getFormulaProcessActives(Long rejectsDealID,Long formulaProcessID,Long taskProcessID) {
        //创建对象返回带手机端
        List<Map<String, Object>> formulaProActiListNew = new ArrayList<Map<String, Object>>();
        //查询配方工序活动
        String hql = "";
        if (rejectsDealID != null) {  //调整处理
            hql = "processId.id = "+formulaProcessID+" and isForAdjust = true and mobileTerminal = true order by activeType.id ";
        }
        if (taskProcessID != null) {  //机动处理
            hql = "processId.id = "+formulaProcessID+" and isForTemp = true and mobileTerminal = true order by activeType.id ";
        }
        List<RMFormulaProcessActive> rMFormulaprocessActiList = rMFormulaProcessActiveService.getFormulaProcessActives(hql, null);
        int rMFormulaprocessActiListLength = rMFormulaprocessActiList.size();
        if ( rMFormulaprocessActiListLength == 0) {  //不存在配方工序活动  直接返回
            return formulaProActiListNew;
        }

        //查询执行次数及开始/结束状态:按照配方工序活动、是否完成分组 找到某个配方活动下的执行次数及是否存在未结束的调整措施，将查出的结果然后通过java在封装
        String sql = "";
        List<Map<String, Object>> prodTaskActiExelogList = null;
        if (rejectsDealID != null) {  //调整处理
            sql = "select count(FORMULAR_ACTICE) COUNT,max(START_TIME) MAX_START_TIME,max(END_TIME) MAX_END_TIME,max(ID) ID,FORMULAR_ACTICE,IS_FINISH "+
                    "from WOM_PROD_TASK_ACTI_EXELOGS "+
                    "where REJECTS_DEALID = ? and ISPDA = ? and FORMULAR_ACTICE is not null "+
                    "group by FORMULAR_ACTICE,IS_FINISH "+
                    "order by FORMULAR_ACTICE,IS_FINISH ";
            prodTaskActiExelogList = prodTaskActiExelogDao.createNativeQuery(sql, rejectsDealID,1)
                    .setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        }
        if (taskProcessID != null) {  //机动处理
            sql = "select count(FORMULAR_ACTICE) COUNT,max(START_TIME) MAX_START_TIME,max(END_TIME) MAX_END_TIME,max(ID) ID,FORMULAR_ACTICE,IS_FINISH "+
                    "from WOM_PROD_TASK_ACTI_EXELOGS "+
                    "where TASK_PROCESSID = ? and ISPDA = ? and FORMULAR_ACTICE is not null "+
                    "group by FORMULAR_ACTICE,IS_FINISH "+
                    "order by FORMULAR_ACTICE,IS_FINISH ";
            prodTaskActiExelogList = prodTaskActiExelogDao.createNativeQuery(sql, taskProcessID,1)
                    .setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        }

        int prodTaskActiExelogLength = prodTaskActiExelogList.size();
        List<Map<String,Object>> newProdTaskActiExelogList = new ArrayList<Map<String,Object>>(); //新封装活动执行记录对象，用于处理prodTaskActiExelogList

        for (int i = 0; i < prodTaskActiExelogLength; i++) {//根据配方工序活动判断是否存在相同的，即完成/未完成的项
            //最后一项是不相等项目，因为里层for循环进不去，故直接将其add到列表中
            if (i == prodTaskActiExelogLength-1) {
                newProdTaskActiExelogList.add(prodTaskActiExelogList.get(i));
                break;
            }
            if (!prodTaskActiExelogList.get(i).get("FORMULAR_ACTICE").toString().equals(prodTaskActiExelogList.get(i+1).get("FORMULAR_ACTICE").toString())) {
                newProdTaskActiExelogList.add(prodTaskActiExelogList.get(i));
            }else {
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("COUNT", new BigDecimal(prodTaskActiExelogList.get(i).get("COUNT").toString()).add(new BigDecimal(prodTaskActiExelogList.get(i+1).get("COUNT").toString())));
                map.put("MAX_START_TIME", prodTaskActiExelogList.get(i).get("MAX_START_TIME"));
                map.put("MAX_END_TIME", prodTaskActiExelogList.get(i).get("MAX_END_TIME"));
                map.put("FORMULAR_ACTICE", prodTaskActiExelogList.get(i).get("FORMULAR_ACTICE"));
                map.put("IS_FINISH", prodTaskActiExelogList.get(i).get("IS_FINISH"));
                map.put("ID", prodTaskActiExelogList.get(i).get("ID"));
                newProdTaskActiExelogList.add(map);
                i = i+1;  //i的值+1，(因为还有外层循环i++)跳过相等项的比较
            }

        }

        //封装返回到手机端的对象
        int newProdTaskActiExelogListLen = newProdTaskActiExelogList.size();
        for (int i = 0; i < rMFormulaprocessActiListLength; i++) {
            Map<String, Object> map = new HashMap<String, Object>();
            for (int j = 0; j < newProdTaskActiExelogListLen; j++) {
                if (rMFormulaprocessActiList.get(i).getId().toString().equals(newProdTaskActiExelogList.get(j).get("FORMULAR_ACTICE").toString())) {
                    map = encapsulationMap(map,rMFormulaprocessActiList.get(i),newProdTaskActiExelogList.get(j));
                    formulaProActiListNew.add(map);
                    break;
                }

                if (j == newProdTaskActiExelogListLen - 1 ) {
                    map = encapsulationMap(map,rMFormulaprocessActiList.get(i),null);
                    formulaProActiListNew.add(map);
                }

            }
            if (newProdTaskActiExelogListLen == 0) {
                map = encapsulationMap(map,rMFormulaprocessActiList.get(i),null);
                formulaProActiListNew.add(map);
            }

        }


        return formulaProActiListNew;
    }


    /**
     * 封装配方工序活动的map对象
     * @param map
     * @param rmProActi
     * @param prodActiExeLogMap
     * @return
     */
    private Map<String, Object> encapsulationMap(Map<String, Object> map,RMFormulaProcessActive rmProActi,
                                                 Map<String, Object> prodActiExeLogMap) {
        map.put("formulaProcActiID", rmProActi.getId());  //配方工序活动ID
        map.put("formulaProcActiName", rmProActi.getName());//配方工序活动名称
        map.put("formulaProcActiType", rmProActi.getActiveType().getId()); //配方工序活动类型
        if (rmProActi.getProduct() == null) {
            map.put("productName", null);
            map.put("productCode", null);
            map.put("productModel", null);
        }else {
            MESBasicProduct product = rmProActi.getProduct();
            map.put("productName", product.getProductName());
            map.put("productCode", product.getProductCode());
            map.put("productModel", product.getProductModel());
        }
        if(prodActiExeLogMap != null){
            map.put("count", "("+prodActiExeLogMap.get("COUNT").toString() +"次)");
            map.put("id", prodActiExeLogMap.get("ID"));
            if ("0".equals(prodActiExeLogMap.get("IS_FINISH").toString())) {  //未结束
                map.put("time", prodActiExeLogMap.get("MAX_START_TIME"));
                map.put("isFinish", false);
                map.put("startEndText", "结束");
            }else {
                map.put("time", prodActiExeLogMap.get("MAX_END_TIME"));
                map.put("isFinish", true);
                map.put("startEndText", "开始");
            }
			/*map.put("maxStartTime", prodActiExeLogMap.get("MAX_START_TIME"));
			map.put("maxEndTime", prodActiExeLogMap.get("MAX_END_TIME"));
			map.put("isFinish", ? false : true );
			map.put("startEndText", "开始");*/
        }else {
            map.put("count", "");
            map.put("time", null);
            map.put("isFinish", true);  //为null设为true
            map.put("startEndText", "开始");
            map.put("id", null);
        }

        return map;
    }

    /**
     *PDA调整/机动处理，手工投料，生成活动执行记录、投料单 【activeExeID活动执行记录用于调整处理】【procExeLogID工序执行记录用于机动处理】
     * @param activeExeID   活动执行记录
     * @param  procExeLogID 工序执行记录
     * @param formulaProcActiID  配方工序活动
     * @param currentNum   投料数量
     * @param product   物料编码/代码
     * @param productNum 物料批号
     * @param userName
     * @param productProperty 判断物品参数(product)是Code还是Model
     */
    @Override
    public void addExeLogAndPutinRecords(Long activeExeID,Long procExeLogID,Long formulaProcActiID, Double currentNum, String product,
                                         String productNum, String userName, String productProperty) {
        //生成活动执行记录
        WOMProdTaskActiExelog actiExelog = null;
        actiExelog = prodTaskActiExelogService
                .insertActiExeLog(activeExeID,procExeLogID,formulaProcActiID,currentNum,product, productNum, userName,productProperty);

        //生成投料记录
        addPutinRecordByActiceExelog(actiExelog,
                true, userName);

    }

    /**
     * PDA机动处理,根据工作单元编码 在工序执行记录表中查询存在执行中的工序且由该工序中存在“可机动执行”的配方工序活动(由配方工序查询)
     * @param factoryCode
     * @return
     */
    @Override
    public List<WOMProdTaskProcExelog> getmaneuverFacList(String factoryCode) {
        String[] arrCode = factoryCode.split(",");
//		String hql = "from WOMProdTaskProcExelog where state.id = ? and factoryID.code in (:list) ";

        String hql = "from WOMProdTaskProcExelog where state.id = ? and factoryID.code in (:list) and formularProcess.id in (select distinct processId.id from RMFormulaProcessActive where isForTemp = true and mobileTerminal = true)  ";

        List<WOMProdTaskProcExelog> prodTaskExeActilogsList = prodTaskActiExelogDao.createQuery(hql,"womProActiveType/executing")
                .setParameterList("list", Arrays.asList(arrCode)).list();
        return prodTaskExeActilogsList;
    }

    /**
     * PDA机动处理，普通检验，生成活动执行记录、发起请检
     * @param formulaProcActiID
     * @param procExeLogID
     * @param userName
     */
    @Override
    public void inspectByManeuver(Long formulaProcActiID, Long procExeLogID,
                                  String userName) {
        //生成活动执行记录
        WOMProdTaskActiExelog actiExelog = null;
        actiExelog = prodTaskActiExelogService.insertActiExeLogByManeuver(formulaProcActiID, procExeLogID, userName);

        //发起请检
        addApplyCheckByActiveExelog(actiExelog);
    }


    @Resource
    private MESBasicObjWareStoreService  objWareStoreService;

    /**
     * 根据工作单元、物品，以及配料仓的设置数据，来查找目的仓与货位。进行配料，PDA投配料、配料调拨时，查找物料的仓库信息调用此方法
     * @param fac  工作中心
     * @param pro 物品
     * @return
     */
    public MESBasicObjWareStore  getObjWareStoreByfp(MESBasicFactoryModel fac,MESBasicProduct pro){

        MESBasicObjWareStore  wareStore =new MESBasicObjWareStore();
        //如果 工作中心或者物品为空，则返回查询不到结果
        if(fac==null || pro==null ){
            return null;
        }
        while(true){
            List<MESBasicObjWareStore> wareStores=new ArrayList<MESBasicObjWareStore>();
            if(!fac.getIsOnlyStore()){
                //不是多货位
                wareStores=objWareStoreService.getObjWareStores("objFactory="+fac.getId() + " and valid=1", null);
                if(wareStores.size()>0){
                    wareStore=wareStores.get(0);
                    break;
                }
            }else{
                //多货位
                wareStores=objWareStoreService.getObjWareStores("objFactory="+fac.getId()+" and product="+pro.getId() + " and valid=1", null);
                if(wareStores.size()>0){
                    wareStore=wareStores.get(0);
                    break;
                }
            }

            if(wareStores.size()<=0){
                //如果没有找到配料仓数据，则向工作中心的父节点查找
                Long facID=fac.getParentId();
                //父节点ID为-1 表示为根目录，则退出循环
                if(facID==-1){
                    break;
                }
                fac=factoryModelService.getFactoryModel(facID);
                if(!fac.getIsOnlyStore()){
                    //不是多货位
                    wareStores=objWareStoreService.getObjWareStores("objFactory="+fac.getId() + " and valid=1", null);
                    if(wareStores.size()>0){
                        wareStore=wareStores.get(0);
                        break;
                    }
                }else{
                    //多货位
                    wareStores=objWareStoreService.getObjWareStores("objFactory="+fac.getId()+" and product="+pro.getId() + " and valid=1", null);
                    if(wareStores.size()>0){
                        wareStore=wareStores.get(0);
                        break;
                    }
                }

            }
        }

        return wareStore;
    }


    /**
     * 根据工作单元、物品，以及车间仓的设置数据，来查找目的仓与货。未进行配料时，如PDA手工投料、批控自动投料，确定物料的仓库货位调用该方法。
     * @param fac 工作中心
     * @param pro 物品
     * @return
     */
    public MESBasicFacWareMaterial getFacWareMaterialByfp(MESBasicFactoryModel fac,MESBasicProduct pro){

        //如果 工作中心或者物品为空，则返回查询不到结果
        if(fac==null || pro==null ){
            return null;
        }
        MESBasicFacWareMaterial fwm=new MESBasicFacWareMaterial();
        while(true){
            //根据 工作中心与物品，查找车间仓数据
            List<MESBasicFacWareMaterial> fwms =facWareMaterialService.getFacWareMaterials("productId="+pro.getId()+" and factoryId="+fac.getId() + " and valid=1", null);
            if(fwms.size()>0){
                fwm=fwms.get(0);
                break;
            }else{
                //如果没有找到车间仓数据，则向工作中心的父节点查找
                Long facID=fac.getParentId();
                //父节点ID为-1 表示为根目录，则退出循环
                if(facID==-1){
                    break;
                }
                fac=factoryModelService.getFactoryModel(facID);
                List<MESBasicFacWareMaterial> fwmsp =facWareMaterialService.getFacWareMaterials("productId="+pro.getId()+" and factoryId="+fac.getId() + " and valid=1", null);
                if(fwmsp.size()>0){
                    fwm=fwmsp.get(0);
                    break;
                }
            }
        }

        return fwm;

    }

    /**
     * PDA进行调整处理，调整结束之后，点击【请检】按钮，调用此方法，然后重新发起请检
     * @param activeExeID   活动执行记录ID
     */
    @Override
    public Boolean applyCheckByPDA(Long activeExeID) {
        Boolean flag=true;
        try {
            WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogService.getProdTaskActiExelog(activeExeID);
            //将活动执行记录的不良品处理单ID进行清空
            prodTaskActiExelog.setRejectsDealID(null);
            prodTaskActiExelog.setActiveBatchStateID(actBatStateService.getActBatState(1000L));
            prodTaskActiExelogDao.save(prodTaskActiExelog);
            //发起请检单
            addApplyCheckByActiveExelog(prodTaskActiExelog);

        } catch (Exception e) {
            log.error(e.getMessage(),e);
            flag=false;
        }
        return flag;
    }

    @Resource
    private WOMBatchingRejectPartsService batchingRejectPartsServices;

    @Resource
    private MESBasicStoreSetService storeService;

    @Autowired
    private StaffService staffService;

    /**
     * 退料签收
     */
    public String recivedRejectReocrd(String postParams){
        User currentUser = (User) getCurrentUser();
        try {
            JSONArray jsonArray = new JSONArray(postParams);
            StringBuilder synData = new StringBuilder();
            int count = 1;
            Date recivedDate = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = new Date();
            String dateStr = sdf.format(date);
            for(int i = 0; i < jsonArray.length(); i++ ){
                JSONObject jsonObject = (JSONObject) jsonArray.get(i);
                Long rejectRecordId = jsonObject.getLong("rejectRecordId");
                Long wareId = jsonObject.getLong("wareId");
                MESBasicWare ware = new MESBasicWare();
                ware.setId(wareId);
                String storeId = jsonObject.getString("storeId");
                MESBasicStoreSet store = null;
                if(storeId != null && storeId.length() > 0){
                    store = storeService.getStoreSet(Long.valueOf(storeId));
                }
                Long revicedStaffId = jsonObject.getLong("rejectReceiveStaff");
                Staff staff = currentUser != null? currentUser.getStaff(): staffService.get(revicedStaffId);

                WOMBatchingRejectParts rejectParts = batchingRejectPartsServices.getBatchingRejectParts(rejectRecordId);
                rejectParts.setIsReceived(true);
                rejectParts.setWare(ware);
                rejectParts.setStore(store);
                rejectParts.setReceiveDate(recivedDate);
                rejectParts.setRejectReceiveStaff(staff!=null?staff:rejectParts.getRejectExeStaff());
                batchingRejectPartsServices.saveBatchingRejectParts(rejectParts, null);

				/*if (rejectParts.getWare() != null &&
                         ("YL".equals(rejectParts.getWare().getWareCode()) ||
                                 "ZJ".equals(rejectParts.getWare().getWareCode()) ||
                                 "ZZ02".equals(rejectParts.getWare().getWareCode()))) {//只有原料库，中间体库和周转库需要同步
					synData.append("{");
					synData.append("\"iRowNo\":" + count + ",");// 行号，自增长
					synData.append("\"dDate\":\"" + dateStr + "\",");// 日期
                    synData.append("\"cPersonCode\":\""+ "00117" + "\",");//业务员默认00117
					synData.append("\"cWhCode\":\"" + (rejectParts.getWare() != null ? rejectParts.getWare().getWareCode() : " ") + "\",");// 仓库编码
					synData.append("\"cPosCode\":\"" + (rejectParts.getStore() != null ? rejectParts.getStore().getPlaceSetCode() : " ") + "\",");// 货位编码
					synData.append("\"cInvCode\":\"" + rejectParts.getRejectProduct().getProductCode() + "\",");// 物料编码
					synData.append("\"iQuantity\":" + rejectParts.getRejectNum() + ",");// 物料数量
					synData.append("\"iNum\":0,");// 件数

					synData.append("\"cMemo\":\"" + rejectParts.getProductBatchNum() + "\",");// 备注,物料批号
					synData.append("\"cBatch\":\"" + rejectParts.getProductBatchNum() + "\",");// 物料批号
					synData.append("\"dMadeDate\":\"" + (rejectParts.getBatchingPartId().getDmadeDate()!=null?sdf.format(rejectParts.getBatchingPartId().getDmadeDate()):" ") + "\"");// 生产日期
					synData.append("\"cFree1\":" + "" + ",");//包装单重
					synData.append("\"cDefine28\":\"" + "" + "\"");// 包装规格
					synData.append("},");

					count++;
				}*/
            }

			/*if (consulService.getValueAsBoolean("platform/bap/WOM/WOM.isSynU8") && synData.length() > 0) {
				log.info("退料签收，同步U8 ： " + synData.toString());
				StringBuilder postSynData = new StringBuilder("[");
				postSynData.append(synData);
				postSynData.deleteCharAt(synData.length()-1);
				postSynData.append("]");
				u8WOMService.buildRdrecord10FromMesRejectRecived(postSynData.toString());
			}*/
        } catch (JSONException e) {
            return e.getMessage();
        }
        return "";
    }

    @Autowired
    private TaskService taskService;

    /**
     * 生成报工单
     * @param taskID 指令单ID
     * @param staff 报工人
     * @param reportState 指令单状态
     * @param reportNum 报工数量
     *
     */
    @Override
    public boolean addTaskReportingTable(String taskID,Staff staff,String reportState, String reportNum){
        //模拟登陆
        User u=staff!=null?staff.getUser():null;
        if(u!=null){
            String companyCode=u.getStaff().getMainPosition().getCompany().getCode();
            setSession(u.getName(),companyCode);
        }else{
            throw new BAPException("用户登陆失败，不能生成报工记录");
        }

        WOMProduceTask task=new WOMProduceTask();
        if(taskID!=null){
            task=produceTaskService.getProduceTask(Long.valueOf(taskID));
        }
        //如果指令单为空，则结束该方法
        if(task==null){
            return false;
        }

        if ("autoReportOnFinish/01".equals(reportState)) {//不报工，不进行处理
            return true;
        }

        // 报工表头数据回填
        report = new WOMTaskReporting();
        report.setTaskID(task);
        report.setBatchNum(task.getProductBatchNum());
        report.setProductID(task.getProductId());
        report.setReportDate(new Date());
        report.setReportStaff(staff);
        report.setReportType(new SystemCode("womReportType/02"));
        //仓库  根据车间仓中设置的信息查找   modify by pl  20170807
        MESBasicFacWareMaterial facWareMaterial=this.getFacWareMaterialByfp(task.getFactoryId(), task.getProductId());
        if(facWareMaterial!=null){
            report.setWareID(facWareMaterial.getWareId());
        }
        // 表体数据
        reportParts = new ArrayList<WOMTaskReportingPart>();
        WOMTaskReportingPart part= new WOMTaskReportingPart();
        part.setTaskID(task);
        part.setBatchNum(task.getProductBatchNum());
        part.setProductID(task.getProductId());
        part.setReportDate(new Date());
        part.setReportStaff(staff);
        part.setReportType(new SystemCode("womReportType/02"));
        part.setProBatchNum(task.getProductBatchNum());
        part.setReportNum(new BigDecimal(reportNum));
        //仓库与货位
        if(facWareMaterial!=null){
            part.setWareId(facWareMaterial.getWareId());
            part.setStoreID(facWareMaterial.getStoreId());
        }
        reportParts.add(part);
        DataGridService dataGridService = new DataGridService() {
            @Override
            public void execute() {
                if (reportParts != null && !reportParts.isEmpty()) {
                    for (WOMTaskReportingPart item : reportParts) {
                        item.setHeadId(report);
                        item.setTableInfoId(report.getTableInfoId());
                        //taskReportingPartService.saveTaskReportingPart(item, null, "WOM_7.5.0.0_taskReporting_taskReportingView","noEvent");
                        taskReportingPartService.saveTaskReportingPart(item, null, null,"noEvent");
                    }
                }
            }
        };

        // 将新生成的表单变为生效状态
        WorkFlowVar workFlowVar = new WorkFlowVar();
        //工单报工状态为报工单不提交生成保存状态的报工单；否则生成提交状态的报工单
        if("autoReportOnFinish/02".equals(reportState)){
            report.setStatus(EntityTableInfo.STATUS_RUNNING);
            report.setCreateStaff(staff);
            report.setCreateStaffId(staff.getId());
            report.setCreatePosition(staff.getMainPosition());
            report.setCreatePositionId(staff.getMainPosition().getId());
            report.setCreateDepartment(staff.getMainPosition().getDepartment());
            report.setCreateDepartmentId(staff.getMainPosition().getDepartment().getId());
            report.setOwnerStaff(staff);
            report.setOwnerStaffId(staff.getId());
            report.setOwnerPosition(staff.getMainPosition());
            report.setOwnerPositionId(staff.getMainPosition().getId());
            report.setOwnerDepartment(staff.getMainPosition().getDepartment());
            report.setOwnerDepartmentId(staff.getMainPosition().getDepartment().getId());
            workFlowVar.setOperateType("save");
            Long deploymentId = taskService.getCurrentDeployment("taskReportingFlow").getId();
            taskReportingService.save(report, deploymentId, null, workFlowVar, dataGridService);
        }else{
            workFlowVar.setOperateType("submit");
            taskReportingService.saveUserByBatch(report, workFlowVar, dataGridService, "", false);
        }
        // 生效
        //taskReportingService.saveSuperEditTaskReporting(report, workFlowVar, dataGridService, "", false);


        //生成SAP的生产入库单
        /*******************接口导入 start**********************************/
        //if(consulService.getValueAsBoolean("platform/bap/WOM/WOM.isSynSAP")){
        //	wsSyncTaskPayService.sendSAP(Long.valueOf(taskID));
        //}
        /*******************接口导入   end**********************************/

        return true;
    }

    @Resource
    private MESBasicInterfaceLogService mesBasicInterfaceLogService;
    //pims接口测试，获取实时值
    @Override
    public String getPimsRealValue(String tags){
        String returnStr = mesBasicInterfaceLogService.getTagRealValue(tags);
        if(returnStr != null && returnStr.length() > 0){
            return returnStr;
        }
        return null;
    }
    //pims接口测试，获取历史值
    @Override
    public String getPimsHistoryValue(String tags, String startTime, String endTime, int interval, int pageNo, int pageSize){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date end = new Date();
        Date start = new Date();

        if(endTime != null && endTime.length() > 0){
            try {
                end = sdf.parse(endTime);
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if(startTime != null && startTime.length() > 0){
            try {
                start = sdf.parse(startTime);
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        String returnStr = mesBasicInterfaceLogService.getTagHistoryValue(tags, start, end, interval, pageNo, pageSize);
        if(returnStr != null && returnStr.length() > 0){
            return returnStr;
        }
        return null;
    }
	
	//userless, but without it, cant deploy
	@Override
	public boolean checkAndDealBackWomAndsetPhaseFinish(Long activeID,Long reportId, String batchNum, Boolean checkResult,String dealType, Integer status,String reportClass) {
		
		Boolean result=true;
		return result;
	}

}
