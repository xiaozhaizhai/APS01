package com.supcon.orchid.APSWServic.services.impl;

import java.util.*;
import javax.annotation.Resource;
import javax.jws.WebMethod;
import javax.jws.WebService;
import java.math.BigDecimal;

import com.supcon.orchid.APSWServic.entities.APSWSFormula;
import com.supcon.orchid.APSWServic.entities.APSWSFormulaProcess;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.*;
import com.supcon.orchid.RM.services.*;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.services.RMFormulaProcessService;
import com.supcon.orchid.RM.services.RMFormulaService;
import com.supcon.orchid.foundation.entities.Company;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.foundation.services.DataPermissionService;
import com.supcon.orchid.foundation.services.RoleService;
import com.supcon.orchid.foundation.ws.entities.JWSResultDTO;
import com.supcon.orchid.i18n.InternationalResource;
import com.supcon.orchid.orm.entities.IRole;
import com.supcon.orchid.orm.entities.IStaff;
import com.supcon.orchid.security.OrchidAuthenticationToken;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.utils.DateUtils;
import com.supcon.orchid.utils.JsonUtils;
import com.supcon.orchid.workflow.engine.services.ProcessService;
import com.supcon.orchid.workflow.engine.services.TaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.supcon.orchid.APSWServic.entities.APSWSProduct;
import com.supcon.orchid.APSWServic.services.APSWSService;
import org.springframework.beans.factory.annotation.Autowired;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.services.WOMProduceTaskService;
import org.apache.commons.lang.StringUtils;
import com.supcon.orchid.services.ConsulService;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.services.StaffService;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import com.supcon.orchid.foundation.services.CompanyService;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.RM.services.RMProcessTypeService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.APSWServic.entities.APSWSFactoryResource;
import com.supcon.orchid.RM.services.RMForProcessUnitService;
import com.supcon.orchid.APSWServic.entities.APSWSOpResorce;
import com.supcon.orchid.WOM.services.WOMTaskReportingService;
import com.supcon.orchid.RM.entities.RMProcessUnit;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.RM.services.RMProcessUnitService;

import com.supcon.orchid.APSWServic.entities.*;

@WebService(targetNamespace = "http://ws.supcon.com")
public class APSWSServiceImpl implements APSWSService {
    private final Logger logger = LoggerFactory.getLogger(APSWSServiceImpl.class);
    private String formatStr = "yyyy-MM-dd HH:mm:ss";
    private String workflowKey = "makeTaskFlow";
    private String taskType = "produceTask";
    @Autowired
    MESBasicProductService basicProductService;
    @Autowired
    RMFormulaService rmFormulaService;
    @Autowired
    RMFormulaProcessService rmFormulaProcessService;
    @Autowired
    MESBasicFactoryModelService factoryModelService;
    @Autowired
    WOMProduceTaskService produceTaskService;
    @Autowired
    ConsulService consulService;
    @Autowired
    StaffService staffService;
    @Autowired
    CompanyService companyService;
    @Autowired
    UserDetailsService userDetailsService;
    @Autowired
    TaskService taskService;
    @Autowired
     ProcessService processService;
    @Autowired
    DataPermissionService dataPermissionService;
	@Autowired
    RMProcessTypeService processTypeService;
    @Autowired
    RMFormulaService formulaService;
	@Autowired
    WOMTaskReportingService taskReportingService;
  	@Autowired
    RMForProcessUnitChoiceService choiceService;
	@Autowired
    RMProcessUnitService rmProcessUnitService;

    @Override
    @WebMethod
    public JWSResultDTO getProduct(String json) {
      	JWSResultDTO result = new JWSResultDTO();
        Map<String, Object> m = new HashMap<>();
        List<APSWSProduct> list = new ArrayList<>();
        try {
            Map<String, Object> map = (Map<String, Object>) JsonUtils.generateMapFromJson(json);
            String sql = "valid =1";
            List<Object> param = new ArrayList<>();
            if (map.containsKey("AvbCODE") && !map.get("AvbCODE").equals("")) {
                sql = "valid = ?";
                param.add(map.get("AvbCODE"));
            }
            if (map.containsKey("CODE") && !map.get("CODE").equals("")) {
                sql = sql + " and PRODUCT_CODE = ?";
                param.add(map.get("CODE"));
            }

            List<MESBasicProduct> products = basicProductService.findProductsBySql(sql, param);
            if (map.containsKey("MAKMAC") && !map.get("MAKMAC").equals("")) {
                String macmak = map.get("MAKMAC").toString();
                List<MESBasicProduct> bps = new ArrayList<>();
                for (MESBasicProduct bp : products) {
                    if (!bp.getFactory().getCode().equals(macmak)) {
                        bps.add(bp);
                    }
                }
                products.removeAll(bps);
            }

            if (products != null && products.size() > 0) {
                for (MESBasicProduct mbp : products) {
                    APSWSProduct wp = new APSWSProduct();
                    wp.setCode(mbp.getProductCode());

                    wp.setName((mbp.getProductName() == null) ? "" : mbp.getProductName());
                    wp.setProductType((mbp.getProdType() == null) ? "" : mbp.getProdType());
                    if (mbp.getFactory() != null) {
                        wp.setMakmac(mbp.getFactory().getCode() == null ? "" : mbp.getFactory().getCode());                 
                    }
                  	wp.setClassify(mbp.getProductAllas());
                    wp.setCad((mbp.getCad() == null ? "" : mbp.getCad()));

                    if (mbp.getAutoSupply() != null) {
                        wp.setAutoSupply(mbp.getAutoSupply().getFullPathName() == null ? (InternationalResource.get(mbp.getAutoSupply().getValue(), "zh_CN")) : mbp.getAutoSupply().getFullPathName());
                    }

                    if (mbp.getMfgStockMode() != null) {
                        wp.setMfgStockMode(mbp.getMfgStockMode().getFullPathName() == null ? InternationalResource.get(mbp.getAutoSupply().getValue(), "zh_CN") : mbp.getMfgStockMode().getFullPathName());
                    }
                    wp.setMinTargetStock((mbp.getMinTargetStock() == null ? "" : mbp.getMinTargetStock()));
                    wp.setAvbCODE(mbp.getAvbCODE() == null ? "" : mbp.getAvbCODE().toString());
                    wp.setUnitmea(mbp.getUnit() == null ? "" : mbp.getUnit());
                    wp.setParkingsys(mbp.getPaRKINGSYS() == null ? "" : mbp.getPaRKINGSYS());
                    wp.setPurMoveUpDate(mbp.getPurMoveUpDate() == null ? "" : DateUtils.format(mbp.getPurMoveUpDate(), formatStr));
                    wp.setPurDeliverDate(mbp.getPurDeliverDate() == null ? "" : DateUtils.format(mbp.getPurDeliverDate(), formatStr));
                    list.add(wp);
                }
            }
            m.put("Products", list);
            m.put("Error_code", "0");
        } catch (Exception e) {
            m.put("Error_message", e.toString());
            m.put("Error_code", "1");
          	logger.info("exception: ", e);
            String j = JsonUtils.mapToJson(m);
            return set500Error(result, j);
        }
        String productJson = JsonUtils.mapToJson(m);
        return setSuccessResult(result, productJson);
    }


    /**
     * 获取配方接口
     *
     * @param json
     * @return json
     */
    @Override
    @WebMethod
    public JWSResultDTO getFormula(String json) {
      	JWSResultDTO result = new JWSResultDTO();
        Map<String, Object> m = new HashMap<>();
        List<APSWSFormula> list = new ArrayList<>();
        String sql = "valid =1";
        List<Object> param = new ArrayList<>();
        try {
            Map<String, Object> map = (Map<String, Object>) JsonUtils.generateMapFromJson(json);
            if (map.containsKey("ROUTE_CODE") && map.get("ROUTE_CODE") != null) {
                sql = sql + " and CODE = ?";
                param.add(map.get("ROUTE_CODE"));
            }
            List<RMFormula> formulas = rmFormulaService.findFormulasBySql(sql, param);
            for (RMFormula rmFormula : formulas) {
                APSWSFormula apswsFormula = new APSWSFormula();
                apswsFormula.setRoutCode(rmFormula.getCode() == null ? "" : rmFormula.getCode());
                apswsFormula.setRote_name(rmFormula.getName() == null ? "" : rmFormula.getName());
                if (rmFormula.getProduct() != null) {
                    apswsFormula.setMaterialCode(rmFormula.getProduct().getProductCode() == null ? "" : rmFormula.getProduct().getProductCode());
                }
                apswsFormula.setModifyDate(rmFormula.getStartTime() == null ? "" : DateUtils.format(rmFormula.getStartTime(), "yyyy-MM-dd HH:mm:ss"));
                list.add(apswsFormula);
            }
            m.put("Formula", list);
            m.put("Error_code", "0");
        } catch (Exception e) {
            m.put("Error_message", e.toString());
            m.put("Error_code", "1");
          	logger.info("exception: ", e);
            return set500Error(result, JsonUtils.mapToJson(m));
        }
        String formulaJson = JsonUtils.mapToJson(m);
        return setSuccessResult(result, formulaJson);
    }

    /**
     * 获取工序接口
     *
     * @param json
     * @return json
     */
  @Override
    @WebMethod
    public JWSResultDTO getFormulaProcess(String json) {
      	JWSResultDTO result = new JWSResultDTO();
        Map<String, Object> m = new HashMap<>();
        List<APSWSFormulaProcess> list = new ArrayList<>();
        String sql = "valid =1";
        List<Object> param = new ArrayList<>();
        try {
            List<RMProcessType> rmProcessTypes = processTypeService.findProcessTypesByHql("from RMProcessType where valid =1 and name = ?", "包装");

            if (rmProcessTypes != null && rmProcessTypes.size() > 0) {
                sql = sql + " and PROCESS_TYPE = ?";
                param.add(rmProcessTypes.get(0).getId());
            }
            Map<String, Object> map = (Map<String, Object>) JsonUtils.generateMapFromJson(json);
            List<RMFormula> rmFormulas = new ArrayList<>();
            List<RMFormulaProcess> formulaProcesses = new ArrayList<>();
            Boolean a = false;
            if (map.containsKey("ROUTE_CODE") && !map.get("ROUTE_CODE").equals("")) {
                rmFormulas = formulaService.findFormulasByHql("code = ?", map.get("ROUTE_CODE"));
                a = true;
            }
            if ((a && rmFormulas != null && rmFormulas.size() > 0)) {
                sql = sql + " and FORMULA_ID = ?";
                param.add(rmFormulas.get(0).getId());
            }
            if (!(a && rmFormulas.size() == 0)) {
                if (map.containsKey("OP_CODE") && !map.get("OP_CODE").equals("")) {
                    sql = sql + " and PROCESS_CODE = ?";
                    param.add(map.get("OP_CODE"));
                }
                formulaProcesses = rmFormulaProcessService.findFormulaProcesssBySql(sql, param);
            }
            if (formulaProcesses != null && formulaProcesses.size() > 0) {
                for (RMFormulaProcess fp : formulaProcesses) {
                    APSWSFormulaProcess apswsFormulaProcess = new APSWSFormulaProcess();
                    apswsFormulaProcess.setOpCode(fp.getProcessCode());
                    apswsFormulaProcess.setOpName(fp.getName());
                    apswsFormulaProcess.setOpSeq(fp.getProcSort());
                    if (fp.getPersistMode() != null) {
                        apswsFormulaProcess.setPesistMode(fp.getPersistMode().getFullPathName() == null ? InternationalResource.get(fp.getPersistMode().getValue(), "zh_CN") : fp.getPersistMode().getFullPathName());
                    }
                    if (fp.getFormulaId() != null) {
                        apswsFormulaProcess.setRouteCode(fp.getFormulaId().getCode());
                    }
                    apswsFormulaProcess.setTransTime(fp.getTransTime() == null ? "" : fp.getTransTime().toString());
                    list.add(apswsFormulaProcess);
                }
            }
            m.put("Process", list);
            m.put("Error_code", "0");
        } catch (Exception e) {
            m.put("Error_code", "1");
        	logger.info("exception: ", e);
            m.put("Error_message", e.toString());
            return set500Error(result, JsonUtils.mapToJson(m));
        }
        String formulaJson = JsonUtils.mapToJson(m);
        return setSuccessResult(result, formulaJson);
    
    }

	/**
     * 4. 获取报工接口
     *
     * @param json
     * @return json
     */
    @Override
  	public JWSResultDTO getTaskReporting(String json) {
        JWSResultDTO result = new JWSResultDTO();
        Map<String, Object> m = new HashMap<>();
        List<APSWSTaskReporting> list = new ArrayList<>();
        String sql = "this_.valid = 1";
        List<Object> param = new ArrayList<>();
        try {
            if (m.containsKey("APS_DISPATCH_CODE") && m.get("APS_DISPATCH_CODE") != null) {
                sql = sql + " and this_.WORK_CODE = ?";
                param.add(m.get("APS_DISPATCH_CODE"));
            }
            List<WOMProduceTask> produceTasks = produceTaskService.findProduceTasksBySql(sql, param);
            for (WOMProduceTask s : produceTasks) {
                APSWSTaskReporting taskReporting = new APSWSTaskReporting();
                taskReporting.setApsDispatchCode(s.getWorkCode());
                taskReporting.setWorkCode(s.getPlanCode()== null ? "" : s.getPlanCode());
                taskReporting.setMaterialCode(s.getProductId() == null ? "" : s.getProductId().getProductCode());
                taskReporting.setConfQty(s.getProductNum() == null ? "" : s.getProductNum().toString());
                
                taskReporting.setStartDate(s.getPlanStartTime() == null ? "" : DateUtils.format(s.getPlanStartTime(), "yyyy-MM--dd HH:mm:ss"));
                taskReporting.setEndDate(s.getPlanEndTime() == null ? "" : DateUtils.format(s.getPlanEndTime(), "yyyy-MM--dd HH:mm:ss"));

                param.clear();
                param.add(s.getId());
                List<WOMTaskReporting> taskReportings = taskReportingService.findTaskReportingsBySql("this_.valid = 1 and this_.TASKID = ?", param);
                if(taskReportings != null && taskReportings.size() > 0){
                    taskReporting.setReportDate(taskReportings.get(0).getReportDate() == null ? "" : DateUtils.format(taskReportings.get(0).getReportDate(), "yyyy-MM--dd HH:mm:ss"));
                }

                param.clear();
                if(s.getFormularId() != null){
                    param.add(s.getFormularId().getId());
                    List<RMFormulaProcess> formulaProcesss = rmFormulaProcessService.findFormulaProcesssBySql("this_.valid = 1 and this_.FORMULA_ID = ?", param);
                    if(formulaProcesss != null && formulaProcesss.size() > 0){
                        taskReporting.setOpCode(formulaProcesss.get(0).getProcessCode());
                    }
                }

                param.clear();
                if(s.getFormularId() != null){
                    param.add(s.getFormularId().getId());
                    List<RMProcessUnit> processUnits = rmProcessUnitService.findProcessUnitsBySql("this_.valid = 1 and this_.FORMULA_ID = ?", param);
                    if(processUnits != null && processUnits.size() > 0) {
                        if(processUnits.get(0).getUnitId() != null){
                            taskReporting.setReportRes(processUnits.get(0).getUnitId().getCode());
                        }
                    }
                }

                list.add(taskReporting);
            }

            m.put("Process", list);
            m.put("Error_code", "0");
        } catch (Exception e) {
            m.put("Error_code", "1");
            logger.info("exception: ", e);
            m.put("Error_message", e.toString());
            return set500Error(result, JsonUtils.mapToJson(m));
        }
        String formulaJson = JsonUtils.mapToJson(m);
        return setSuccessResult(result, formulaJson);
    }
    /**
     * APS下推工单接口
     * @param json
     * @return json
     */
    @Override
    @WebMethod
    public JWSResultDTO saveProduceTask(String json) {
      	JWSResultDTO result = new JWSResultDTO();
        Map<String, Object> resultMap = new HashMap<>();
        String describe = "";
        try {
            Map<String, Object> map = (Map<String, Object>) JsonUtils.generateMapFromJson(json);
            List<Object> param = new ArrayList<>();
            WOMProduceTask produceTask = new WOMProduceTask();
                 if (map.containsKey("MATERIAL_CODE") && !"".equals(map.get("ROUTE_CODE"))) {
                param.add(map.get("MATERIAL_CODE"));
                List<MESBasicProduct> products = basicProductService.findProductsBySql("valid =1 and PRODUCT_CODE = ?", param);
                if (products.size() > 0) {
                    produceTask.setProductId(products.get(0));
                    RMFormula defaultFormular = produceTaskService.getDefaultFormular(products.get(0).getId(), taskType);
                    produceTask.setFormularId(defaultFormular);
                  	produceTask.setTaskType(new SystemCode("womTaskType/type1"));
                }
            } else {
                throw new Exception("物品编码不可为空！");
            }
            if (map.containsKey("WORK_CODE") && !"".equals(map.get("WORK_CODE"))) {
                produceTask.setWorkCode(map.get("WORK_CODE").toString());
            } else {
                throw new Exception("APS工单号不可为空！");
            }
          
            if (map.containsKey("PLAN_CODE") && !"".equals(map.get("PLAN_CODE"))) {
                produceTask.setPlanCode(map.get("PLAN_CODE").toString());
            }

            if (map.containsKey("QTY") && !"".equals(map.get("QTY"))) {
                produceTask.setProductNum(new BigDecimal(map.get("QTY").toString()));
            } else {
                throw new Exception("制造数量不可为空！");
            }
            if (map.containsKey("PLAN_START_DATE") && !"".equals(map.get("PLAN_START_DATE"))) {
                produceTask.setPlanStartTime(DateUtils.parseDateTime(map.get("PLAN_START_DATE").toString()));
            } else {
                throw new Exception("计划开始时间不可为空！");
            }
            if (map.containsKey("PLAN_END_DATE") && !"".equals(map.get("PLAN_END_DATE"))) {
                produceTask.setPlanEndTime(DateUtils.parseDateTime(map.get("PLAN_END_DATE").toString()));
            } else {
                throw new Exception("计划结束时间不可为空！");
            }
            if (map.containsKey("RES_CODE") && !"".equals(map.get("RES_CODE"))) {//获取到的为工作单元，向上获取生产线
                List<MESBasicFactoryModel> workPoint = getFactoryByCode(map.get("RES_CODE").toString());
                if (workPoint.size() > 0) {
                    MESBasicFactoryModel workArea = factoryModelService.getFactoryModel(workPoint.get(0).getWorkArea());
                    produceTask.setFactoryId(workArea);
                } else {
                    throw new Exception("该资源编码在MES中不存在！");
                }
            } else {
                throw new Exception("资源编码不可为空！");
            }


            //工作流相关配置
            String staffCode = consulService.getValueAsString("platform/bap/WOM/WOM.producePerson");
            Staff staff = null;
            if (null == staffCode || staffCode.isEmpty()) {
                throw new Exception("请先在配置项里设置下单人员！");
            }else {
                staff = staffService.findStaffByCode(staffCode);
                if (null == staff) {
                    throw new Exception("配置项设置的下单人员不存在！");
                }
            }

            if (staff!=null) {
                User u =staff.getUser();
                if (u != null) {
                    String companyCode = u.getStaff().getMainPosition().getCompany().getCode();
                    setSession(u.getName(), companyCode);
                } else {
                    throw new Exception("用户模拟登陆失败！");
                }

                Long positionId = staff.getMainPosition().getId();
                produceTask.setCreateStaff(staff);
                produceTask.setCreateStaffId(staff.getId());
                produceTask.setCreateDepartment(staff.getMainPosition().getDepartment());
                produceTask.setCreateDepartmentId(staff.getMainPosition().getDepartment().getId());
                produceTask.setOwnerDepartmentId(staff.getMainPosition().getDepartment().getId());
                produceTask.setOwnerDepartment(staff.getMainPosition().getDepartment());
                produceTask.setOwnerPositionId(positionId);
                produceTask.setOwnerPosition(staff.getMainPosition());
                produceTask.setCreatePosition(staff.getMainPosition());
                produceTask.setOwnerStaff(staff);
                produceTask.setOwnerStaffId(staff.getId());
                produceTask.setCreatePositionId(positionId);
                produceTask.setValid(true);
                produceTask.setVersion(0);
                produceTask.setCid(staff.getMainPosition().getCompany().getId());


                WorkFlowVar workFlowVar = new WorkFlowVar();
                workFlowVar.setEntityCode("WOM_7.5.0.0_produceTask");
                workFlowVar.setTableName("wom_produce_tasks");
                workFlowVar.setCrossCompanyFlag(false);
                workFlowVar.setGroupEnabled(false);
                workFlowVar.setScriptExcuteBeanName("wOM_produceTaskService");
                Long deploymentId = taskService.getCurrentDeployment(workflowKey).getId();
                String editActivityName = processService.findStartTransitions(deploymentId).getDestination().getName();
                List<Long> workflowStaff = dataPermissionService.getPowerUserList(staff.getId(), editActivityName, workflowKey, "2", positionId, null, false);
                Set<Long> ids = new HashSet<>();
                ids.addAll(workflowStaff);
                workFlowVar.setAdditionalUsers(ids);
                workFlowVar.setOperateType("save");

                produceTaskService.save(produceTask, deploymentId, null, workFlowVar, null);
            }
            resultMap.put("error_code", "0");
        } catch (Exception e) {
         	logger.info(e.toString());
            resultMap.put("error_code", "1");
            describe = e.toString();
            resultMap.put("describe", describe);
            return set500Error(result, JsonUtils.mapToJson(resultMap));
        }
        resultMap.put("describe", describe);
        return setSuccessResult(result, JsonUtils.mapToJson(resultMap));
    }


    /**
     * 获取资源接口
     * @param json
     * @return json
     */
    @Override
    public JWSResultDTO getResourceInfo(String json) {
      	JWSResultDTO result = new JWSResultDTO();
        Map<String, Object> resultMap = new HashMap<>();
        List<APSWSFactoryResource> list = new ArrayList<>();
       // String sql = "1=1";
        List<Object> param = new ArrayList<>();
        List<MESBasicFactoryModel> factoryModels = new ArrayList<>();
        try {
            Map<String, Object> map = (Map<String, Object>) JsonUtils.generateMapFromJson(json);
            if (map.containsKey("RES_CODE") && !"".equals(map.get("RES_CODE"))) {
                factoryModels = getFactoryByCode(map.get("RES_CODE").toString());
            } else if (map.containsKey("RES_GROUP_CODE") && !"".equals(map.get("RES_GROUP_CODE"))) {
                List<MESBasicFactoryModel> groupFactorys = getFactoryByCode(map.get("RES_GROUP_CODE").toString());
                if (groupFactorys.size() == 1) {
                    //查询生产线下对应工作单元
                    param.add(groupFactorys.get(0).getId());
                    factoryModels = factoryModelService.getFactoryModels("this_.valid=1 and this_.PARENT_ID = ?", param);
                } else {
                    throw new Exception("查询不到或查询出多个对应生产线！");
                }
            } else if (map.containsKey("CLASS_CODE") && !"".equals(map.get("CLASS_CODE"))) {
                List<MESBasicFactoryModel> classFactorys = getFactoryByCode(map.get("CLASS_CODE").toString());
                if (classFactorys.size() == 1) {
                    //查询生产区域下对应工作单元
                    param.add(classFactorys.get(0).getId());
                    factoryModels = factoryModelService.getFactoryModels("this_.valid=1 and this_.WORK_AREA = ?", param);
                } else {
                    throw new Exception("查询不到或查询出多个对应生产区域！");
                }
            } else {
                factoryModels = factoryModelService.getFactoryModels("this_.valid=1", param);
            }
            if (factoryModels != null && factoryModels.size() > 0) {
                for (MESBasicFactoryModel factoryModel : factoryModels) {
                    APSWSFactoryResource APSWSFactoryResource = new APSWSFactoryResource();
                    APSWSFactoryResource.setAvbResource("1");
                    APSWSFactoryResource.setDiffer("普通资源");
                    APSWSFactoryResource.setKind("主资源");
                    APSWSFactoryResource.setResCode(factoryModel.getCode());
                    APSWSFactoryResource.setResName(factoryModel.getName());
                   // MESBasicFactoryModel classfactory = factoryModelService.getFactoryModel(factoryModel.getWorkArea());
                    APSWSFactoryResource.setClassCode(factoryModel.getWorkArea() ==null ?"":factoryModelService.getFactoryModel(factoryModel.getWorkArea()).getCode());
                  //  MESBasicFactoryModel groupFactory = factoryModelService.getFactoryModel(factoryModel.getBelongLine());
                    APSWSFactoryResource.setResGroupCode(factoryModel.getBelongLine() ==null ?"":factoryModelService.getFactoryModel(factoryModel.getBelongLine()).getCode());

                    list.add(APSWSFactoryResource);
                }
            } else {
                throw new Exception("查询不到对应资源（工作单元）！");
            }
            resultMap.put("Resource", list);
            resultMap.put("Error_code", "0");
        } catch (Exception e) {
         	logger.info(e.toString());
            resultMap.put("Error_code", "1");
          	resultMap.put("Error_message", e.toString());
            return set500Error(result, JsonUtils.mapToJson(resultMap));
        }
        return setSuccessResult(result,JsonUtils.mapToJson(resultMap));
    }

 	/**
     * 获取工序设备对应关系接口
     * @param json
     * @return json
     */
    @Override
  public JWSResultDTO getOpResource(String json) {
        Map<String, Object> resultMap = new HashMap<>();
        JWSResultDTO result = new JWSResultDTO();
        String sql = "this_.valid=1";
        List<Object> param = new ArrayList<>();
        List<APSWSOpResorce> list = new ArrayList<>();
        List<RMForProcessUnitChoice> unitChoices = new ArrayList<>();
        try {
            Map<String, Object> map = (Map<String, Object>) JsonUtils.generateMapFromJson(json);
            if (map.containsKey("RES_CODE") && !"".equals(map.get("RES_CODE"))) {
                List<MESBasicFactoryModel> node = getFactoryByCode(map.get("RES_CODE").toString());
                if (node.size()>0){
                    sql=sql+" AND UNIT_ID = ?";
                    param.add(node.get(0).getId());
                    unitChoices = choiceService.getForProcessUnitChoices(sql,param);
                }

            }else {
                unitChoices = choiceService.getForProcessUnitChoices(sql, param);
            }
            if (unitChoices != null && unitChoices.size() > 0) {
                for (RMForProcessUnitChoice unitChoice : unitChoices) {
                    APSWSOpResorce opResorce = new APSWSOpResorce();
                    RMFormulaProcess process = unitChoice.getProcessUnitID().getPuprocessId();
                    opResorce.setAvbCode("1");
                    opResorce.setCmdType(process.getCmdType() == null ?  "M": InternationalResource.get(process.getCmdType().getValue(), "zh_CN"));
                    opResorce.setCycleTime(process.getLongTime()==null?"":process.getLongTime().toString());
                    opResorce.setOpName(process.getName());
                    opResorce.setOpCode(process.getProcessCode());
                    opResorce.setPrepareTime(process.getTransTime()==null?"":process.getTransTime().toString());
                    opResorce.setPersistMode(process.getPersistMode() == null ? "ES" : InternationalResource.get(process.getPersistMode().getValue(), "zh_CN"));
                    opResorce.setResCode(unitChoice.getUnitId().getCode());
                    list.add(opResorce);
                }
            }else{
                throw new Exception("查询不到对应工序！");
            }
            resultMap.put("OpResource", list);
            resultMap.put("Error_code", "0");
        } catch (Exception e) {
            logger.info("Exception :",e);
            resultMap.put("Error_code", "1");
            resultMap.put("Error_message", e.toString());
            return set500Error(result, JsonUtils.mapToJson(resultMap));
        }
        return setSuccessResult(result,JsonUtils.mapToJson(resultMap));
    }


    // ----------------------------公共私有方法----------------------------------------

    private List<MESBasicFactoryModel> getFactoryByCode(String code){
        return   factoryModelService.findFactoryModelsByHql("from MESBasicFactoryModel  where code = ? and valid =1",code);
    }

    private JWSResultDTO set500Error(JWSResultDTO result, String error) {
        result.setErrorMessage(error);
        result.setStatusCode("500");
        return result;
    }

    private JWSResultDTO set404Error(JWSResultDTO result) {
        result.setErrorMessage("找不到结果");
        result.setStatusCode("404");
        return result;
    }

    private JWSResultDTO setSuccessResult(JWSResultDTO result, Object obj) {
        result.setResult(obj);
        result.setStatusCode("200");
        return result;
    }
    @Autowired
    private RoleService roleService;
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
}