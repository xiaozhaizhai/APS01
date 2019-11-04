package com.supcon.orchid.WOM.services.impl;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.annotation.Resource;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import com.supcon.orchid.ec.services.ConditionService;
import com.supcon.orchid.workflow.engine.services.BAPJAXBProvider;
import com.supcon.orchid.security.OrchidAuthenticationToken;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.entities.CompanyStaff;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.foundation.services.CompanyStaffService;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.foundation.ws.entities.JWSListResultDTO;
import com.supcon.orchid.foundation.ws.entities.JWSResultDTO;
import com.supcon.orchid.foundation.ws.entities.PageParamDTO;
import com.supcon.orchid.foundation.ws.entities.PageValueDTO;
import com.supcon.orchid.foundation.ws.entities.PaginationDTO;
import com.supcon.orchid.foundation.ws.entities.SimulationMap;
import com.supcon.orchid.foundation.ws.utils.FilterUtils;
import com.supcon.orchid.i18n.InternationalResource;
import com.supcon.orchid.WOM.entities.WOMActiveExelog;
import com.supcon.orchid.WOM.entities.WOMBatchNumRule;
import com.supcon.orchid.WOM.entities.WOMBatchProdTaskPart;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTask;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderHead;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderPart;
import com.supcon.orchid.WOM.entities.WOMCheckManage;
import com.supcon.orchid.WOM.entities.WOMInspect;
import com.supcon.orchid.WOM.entities.WOMProduceTaskManage;
import com.supcon.orchid.WOM.entities.WOMPutInManage;
import com.supcon.orchid.WOM.entities.WOMTaskReportManage;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialPart;
import com.supcon.orchid.WOM.entities.WOMProActAndBatState;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;
import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
import com.supcon.orchid.WOM.services.WOMTaskReportingWSService;
import com.supcon.orchid.WOM.services.WOMTaskReportingService;
import com.supcon.orchid.WOM.services.WOMTaskReportingPartService;
	
/* CUSTOM CODE START(wsserviceimpl,import,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="WOMTaskReporting",targetNamespace = "http://ws.supcon.com")
public class WOMTaskReportingWSServiceImpl implements WOMTaskReportingWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private WOMTaskReportingService taskReportingService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private WOMTaskReportingPartService taskReportingPartService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取生产报工数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTaskReportingByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			WOMTaskReporting taskReporting = taskReportingService.loadTaskReportingByBussinessKey(businessKey);
			if(taskReporting == null){
				return set404Error(result);
			}
			//添加辅模型
			List<WOMTaskReportingPart> taskReportingPartList = clearTaskReportingPartNonMainField(taskReportingService.getTaskReportingPartList(taskReporting));
			taskReporting.setTaskReportingPartList(taskReportingPartList);
			
			setSuccessResult(result, taskReporting);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取生产报工数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTaskReportingByPk(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(pk == null){
				return set500Error(result, "主键不能为空。");
			}
		
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			
			WOMTaskReporting taskReporting = taskReportingService.getTaskReporting(id);
			if(taskReporting == null || !taskReporting.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<WOMTaskReportingPart> taskReportingPartList = clearTaskReportingPartNonMainField(taskReportingService.getTaskReportingPartList(taskReporting));
			taskReporting.setTaskReportingPartList(taskReportingPartList);
			setSuccessResult(result, taskReporting);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改生产报工数据
	 * @param 生产报工对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateTaskReporting(
		@WebParam(name="taskReporting")WOMTaskReporting taskReporting,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(taskReporting == null){
				return set500Error(result, "生产报工不能为空。");
			}
			
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				return set500Error(result, "ownerStaffUUID不能为空。");
			}
			
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			
			if(!beforeUpdateTaskReporting(taskReporting)){
				return set404Error(result);
			}
			taskReportingService.saveSuperEditTaskReporting(taskReporting, null, null, null, null, null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addTaskReporting(
		@WebParam(name="taskReporting")WOMTaskReporting taskReporting,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(taskReporting == null){
				return set500Error(result, "生产报工不能为空。");
			}
		
			if(taskReporting.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(taskReporting.getTableNo() == null){
				return set500Error(result, "业务主键不能为空。");
			}
			if(ownerStaffUUID == null){
				return set500Error(result, "ownerStaffUUID不能为空。");
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			
			try{
				checkTaskReportingData(taskReporting);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			taskReportingService.saveSuperEditTaskReporting(taskReporting, null, null, null);
			setSuccessResult(result, taskReporting.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteTaskReportingByBusinessKey(
		@WebParam(name="businessKey")String businessKey,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {

		JWSResultDTO result = new JWSResultDTO();
		try{
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				return set500Error(result, "ownerStaffUUID不能为空。");
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			
			if(businessKey == null || businessKey.trim().isEmpty()){
				return set500Error(result, "业务主键不能为空。");
			}
			WOMTaskReporting taskReporting = null;
			try{
				taskReporting = taskReportingService.loadTaskReportingByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(taskReporting == null){
				return set404Error(result);
			}
			taskReportingService.deleteTaskReporting(taskReporting);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteTaskReportingByPk(
		@WebParam(name="pk")String pk,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				return set500Error(result, "ownerStaffUUID不能为空。");
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			
			if(pk == null || pk.trim().isEmpty()){
				return set500Error(result, "主键不能为空。");
			}
			
			Long id = null;
			try{
				id = Long.parseLong(pk);
			}catch(NumberFormatException e){
				return set500Error(result, "pk不是一个Long型数字:"+pk);
			}
			WOMTaskReporting taskReporting = null;
			try{
				taskReporting = taskReportingService.getTaskReporting(id);
			}catch(NullPointerException e){}
			if(taskReporting == null || !taskReporting.isValid()){
				return set404Error(result);
			}
			taskReportingService.deleteTaskReporting(taskReporting);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddTaskReporting(
		@WebParam(name="taskReportingList")List<WOMTaskReporting> taskReportingList,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSListResultDTO result = new JWSListResultDTO();
		try{
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				set500Error(result, "ownerStaffUUID不能为空");
				return result;
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			
			int count = 1;
			for(WOMTaskReporting taskReporting : taskReportingList){
				if(taskReporting.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(taskReporting.getTableNo() == null || taskReporting.getTableNo().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkTaskReportingData(taskReporting);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			taskReportingService.batchSaveSuperEditTaskReporting(taskReportingList, null, null, null);
			for(WOMTaskReporting taskReporting : taskReportingList){
				idList.add(taskReporting.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateTaskReporting(
		@WebParam(name="taskReportingList")List<WOMTaskReporting> taskReportingList,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				return set500Error(result, " ownerStaffUUID不能为空。");
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			
			int count = 1;
			for(WOMTaskReporting taskReporting : taskReportingList){
				try{
					if(!beforeUpdateTaskReporting(taskReporting)){
						result.setErrorMessage("第"+count+"条数据不存在。");
						result.setStatusCode("404");
						return result;
					}
				}catch(BAPException e){
					result.setErrorMessage("第"+count+"条数据有误:"+e.getMessageKey()+"    "+e.getArgs().toString());
					result.setStatusCode("500");
					return result;
				}catch(RuntimeException e){
					return set500Error(result, "第"+count+"条数据有误: "+e.getMessage());
				}
				count++;
			}
			taskReportingService.batchSaveSuperEditTaskReporting(taskReportingList, null, null, null,null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteTaskReportingByPk(
		@WebParam(name="pk")List<String> pk,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				return set500Error(result, "ownerStaffUUID不能为空。");
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			int count = 1;
			List<Long> idList = new ArrayList<Long>();
			for(String k : pk){
				Long id = null;
				try{
					id = Long.parseLong(k);
					idList.add(id);
				}catch(NumberFormatException e){
					return set500Error(result, "第"+count+"个主键不是一个Long型数字:"+k);
				}
				WOMTaskReporting temp = null;
				try{
					temp = taskReportingService.getTaskReporting(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			taskReportingService.deleteTaskReporting(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteTaskReportingByBusinessKey(
		@WebParam(name="businessKey")List<String> businessKey,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {

		JWSResultDTO result = new JWSResultDTO();
		try{
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				return set500Error(result, "ownerStaffUUID不能为空。");
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			if(businessKey == null || businessKey.isEmpty()){
				return set500Error(result, "主键列表为空。");
			}
			List<Long> idList = new ArrayList<Long>();
			for (int i = 0; i < businessKey.size(); i++) {
				WOMTaskReporting temp = null;
				try{
					temp = taskReportingService.loadTaskReportingByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			taskReportingService.deleteTaskReporting(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTaskReportingPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMTaskReporting.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),WOMTaskReporting.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMTaskReporting.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMTaskReporting.class);
				} catch (Exception e) {
					return set500Error(result,"解析排序条件失败： " + e.getMessage());
				}
				String[] orderBys = orderBy.split(",");
				if (detachedCriteria != null && null != orderBys && orderBys.length > 0) {
					for (int i = 0; i < orderBys.length; i++) {
						String[] items = orderBys[i].split(" ");
						if (items != null && items.length == 2) {
							if (null != items[1] && "asc".equalsIgnoreCase(items[1].toString())) {
								if (null != items[0] && items[0].length() > 0) {
									detachedCriteria.addOrder(org.hibernate.criterion.Order.asc(items[0].toString()));
								}
							} else if (null != items[1] && "desc".equalsIgnoreCase(items[1].toString())) {
								if (null != items[0] && items[0].length() > 0) {
									detachedCriteria.addOrder(org.hibernate.criterion.Order.desc(items[0].toString()));
								}
							}
						}
					}
				}
			}
				
			if (null == detachedCriteria) {
				detachedCriteria = DetachedCriteria.forClass(WOMTaskReporting.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMTaskReporting> page = new Page<WOMTaskReporting>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMTaskReporting> datas = taskReportingService.getByPage(page, detachedCriteria);
			List<WOMTaskReporting> taskReportingList = datas.getResult();
			if (taskReportingList == null || taskReportingList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(taskReportingList.toArray());
			PaginationDTO<WOMTaskReporting> pagination = new PaginationDTO<WOMTaskReporting>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据生产报工业务主键查询生产报工下所有辅模型
	 * @param 生产报工业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSListResultDTO result = new JWSListResultDTO();
		try {
			if (businessKey == null || businessKey.trim().isEmpty()) {
				set500Error(result, "业务主键不能为空");
				return result;
			}
			WOMTaskReporting taskReporting = taskReportingService.loadTaskReportingByBussinessKey(businessKey);
			if (taskReporting == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap taskReportingPartMap = new SimulationMap();
			taskReportingPartMap.setName(InternationalResource.get("TaskReportingPart"));
			taskReportingPartMap.setList(taskReportingService.getTaskReportingPartList(taskReporting));
			resultList.add(taskReportingPartMap);
			
			clearCircle(taskReporting);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据生产报工id查询生产报工下所有辅模型
	 * 
	 * @param 生产报工id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO getAllAuxiliaryModelPageByPk(
		@WebParam(name="pk")String pk) {
			
		JWSListResultDTO result = new JWSListResultDTO();
		try {
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				result.setErrorMessage("pk不是一个Long型数字: " + pk);
				result.setStatusCode("500");
				return result;
			}
			WOMTaskReporting taskReporting = taskReportingService.getTaskReporting(id);
			if (taskReporting == null || !taskReporting.isValid()) {
				result.setErrorMessage("找不到生产报工");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap taskReportingPartMap = new SimulationMap();
			taskReportingPartMap.setName(InternationalResource.get("TaskReportingPart"));
			taskReportingPartMap.setList(taskReportingService.getTaskReportingPartList(taskReporting));
			resultList.add(taskReportingPartMap);
			
			clearCircle(taskReporting);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  生产报工明细-------------------------------------------------
	//--hasLink:true---link:HeadId
	/**
	 * 根据生产报工明细业务主键分页查询生产报工明细数据
	 * 
	 * @param 生产报工明细业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTaskReportingPartPageByTaskReportingBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMTaskReportingPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMTaskReportingPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMTaskReportingPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMTaskReportingPart.class);
				} catch (Exception e) {
					return set500Error(result,"解析排序条件失败： " + e.getMessage());
				}
				String[] orderBys = orderBy.split(",");
				if (detachedCriteria != null && null != orderBys && orderBys.length > 0) {
					for (int i = 0; i < orderBys.length; i++) {
						String[] items = orderBys[i].split(" ");
						if (items != null && items.length == 2) {
							if (null != items[1] && "asc".equalsIgnoreCase(items[1].toString())) {
								if (null != items[0] && items[0].length() > 0) {
									detachedCriteria.addOrder(org.hibernate.criterion.Order.asc(items[0].toString()));
								}
							} else if (null != items[1] && "desc".equalsIgnoreCase(items[1].toString())) {
								if (null != items[0] && items[0].length() > 0) {
									detachedCriteria.addOrder(org.hibernate.criterion.Order.desc(items[0].toString()));
								}
							}
						}
					}
				}
			}
				
			if (null == detachedCriteria) {
				detachedCriteria = DetachedCriteria.forClass(WOMTaskReportingPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			WOMTaskReporting taskReporting = taskReportingService.loadTaskReportingByBussinessKey(businessKey);
			if (taskReporting == null) {
				return set500Error(result, "该业务主键的生产报工不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("headId",taskReporting));
			Page<WOMTaskReportingPart> page = new Page<WOMTaskReportingPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMTaskReportingPart> datas = taskReportingPartService.getByPage(page, detachedCriteria);
			List<WOMTaskReportingPart> taskReportingPartList = datas.getResult();
			if (taskReportingPartList == null || taskReportingPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(taskReportingPartList.toArray());
			PaginationDTO<WOMTaskReportingPart> pagination = new PaginationDTO<WOMTaskReportingPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据生产报工明细id分页查询生产报工明细数据
	 * 
	 * @param 生产报工明细id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTaskReportingPartPageByTaskReportingPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMTaskReportingPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), WOMTaskReportingPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMTaskReportingPart.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMTaskReportingPart.class);
				} catch (Exception e) {
					return set500Error(result,"解析排序条件失败： " + e.getMessage());
				}
				String[] orderBys = orderBy.split(",");
				if (detachedCriteria != null && null != orderBys
						&& orderBys.length > 0) {
					for (int i = 0; i < orderBys.length; i++) {
						String[] items = orderBys[i].split(" ");
						if (items != null && items.length == 2) {
							if (null != items[1] && "asc".equalsIgnoreCase(items[1].toString())) {
								if (null != items[0] && items[0].length() > 0) {
									detachedCriteria.addOrder(org.hibernate.criterion.Order.asc(items[0].toString()));
								}
							} else if (null != items[1] && "desc".equalsIgnoreCase(items[1]
											.toString())) {
								if (null != items[0] && items[0].length() > 0) {
									detachedCriteria.addOrder(org.hibernate.criterion.Order.desc(items[0].toString()));
								}
							}
						}
					}
				}
			}
				
			if (null == detachedCriteria) {
				detachedCriteria = DetachedCriteria.forClass(WOMTaskReportingPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			WOMTaskReporting taskReporting = taskReportingService.getTaskReporting(id);
			if (taskReporting == null) {
				return set500Error(result, "该主键的生产报工不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("headId",taskReporting));
			Page<WOMTaskReportingPart> page = new Page<WOMTaskReportingPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMTaskReportingPart> datas = taskReportingPartService.getByPage(page, detachedCriteria);
			List<WOMTaskReportingPart> taskReportingPartList = datas.getResult();
			if (taskReportingPartList == null || taskReportingPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(taskReportingPartList.toArray());
			PaginationDTO<WOMTaskReportingPart> pagination = new PaginationDTO<WOMTaskReportingPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据生产报工明细id分获取生产报工明细数据
	 * 
	 * @param 生产报工明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTaskReportingPart(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMTaskReportingPart taskReportingPart = taskReportingPartService.getTaskReportingPart(id);
			if(taskReportingPart == null){
				return set404Error(result);
			}
			setSuccessResult(result, taskReportingPart);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据生产报工明细业务id修改生产报工明细数据
	 * 
	 * @param 生产报工明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateTaskReportingPart(
		@WebParam(name="taskReportingPart")WOMTaskReportingPart taskReportingPart,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				return set500Error(result, "ownerStaffUUID不能为空。");
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			if(!beforeUpdateTaskReportingPart(taskReportingPart)){
				return set404Error(result);
			}
			taskReportingPartService.saveTaskReportingPart(taskReportingPart, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增生产报工明细
	 * 
	 * @param 生产报工明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addTaskReportingPart(
		@WebParam(name="taskReportingPart")WOMTaskReportingPart taskReportingPart,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(taskReportingPart == null){
				return set500Error(result, "生产报工明细对象不能为空。");
			}
			if(taskReportingPart.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			
			if (ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()) {
				return set500Error(result, "ownerStaffUUID不能为空。");
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			
			try{
				checkTaskReportingPartData(taskReportingPart);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			WOMTaskReporting tempTaskReporting = taskReportingPart.getHeadId();
			if (tempTaskReporting == null) {
				return set500Error(result, "生产报工对象不能为空");
			}
			
			WOMTaskReporting taskReporting = null;
			if(tempTaskReporting.getId()!= null){
				taskReporting = taskReportingService.getTaskReporting(tempTaskReporting.getId());
			}else if(tempTaskReporting.getTableNo() != null){
				taskReporting = taskReportingService.loadTaskReportingByBussinessKey(tempTaskReporting.getTableNo());
			}else{
				return set500Error(result, "生产报工对象必须设置id或业务主键。");
			}
			
			if(taskReporting == null){
				return set404Error(result);
			}
			taskReportingPart.setTableInfoId(taskReporting.getTableInfoId());
			taskReportingPart.setHeadId(taskReporting);
			
			taskReportingPartService.saveTaskReportingPart(taskReportingPart, null);
			Long taskReportingPartId = taskReportingPart.getId();
			setSuccessResult(result, taskReportingPartId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据生产报工明细id 删除生产报工明细
	 * 
	 * @param 生产报工明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteTaskReportingPart(
		@WebParam(name="pk")String pk,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {

		JWSResultDTO result = new JWSResultDTO();
		try {
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				return set500Error(result, "ownerStaffUUID不能为空。");
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字：" + pk);
			}
			
			WOMTaskReportingPart taskReportingPart = null;
			try{
				taskReportingPart = taskReportingPartService.getTaskReportingPart(id);
			}catch(NullPointerException e){}
			if(taskReportingPart == null  || !taskReportingPart.isValid()){
				return set404Error(result);
			}
			taskReportingPartService.deleteTaskReportingPart(taskReportingPart);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改生产报工明细数据，生产报工明细id不能为空
	 *
	 * @param 生产报工明细列表，每个生产报工明细必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateTaskReportingPart(
		@WebParam(name="taskReportingPartList")List<WOMTaskReportingPart> taskReportingPartList,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				return set500Error(result, " ownerStaffUUID不能为空");
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			
			int count = 1;
			for(WOMTaskReportingPart taskReportingPart : taskReportingPartList){
				try{
					if(!beforeUpdateTaskReportingPart(taskReportingPart)){
						result.setErrorMessage("第"+count+"条数据不存在。");
						result.setStatusCode("404");
						return result;
					}
				}catch(BAPException e){
					result.setErrorMessage("第"+count+"条数据有误:"+e.getMessageKey()+"    "+e.getArgs().toString());
					result.setStatusCode("500");
					return result;
				}catch(RuntimeException e){
					return set500Error(result, "第"+count+"条数据有误。具体错误："+e.getMessage());
				}
				count++;
			}
			
			taskReportingPartService.batchImportBaseTaskReportingPart(taskReportingPartList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增生产报工明细数据
	 * 
	 * @param 生产报工明细列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddTaskReportingPart(
		@WebParam(name="taskReportingPartList")List<WOMTaskReportingPart> taskReportingPartList,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSListResultDTO result = new JWSListResultDTO();
		try{
			//staff
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				set500Error(result, " ownerStaffUUID不能为空");
				return result;
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			
			if(taskReportingPartList == null){
				set500Error(result, "taskReportingPartList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMTaskReportingPart taskReportingPart : taskReportingPartList){
				if(taskReportingPart.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(taskReportingPart.getHeadId() == null){
						set500Error(result, "第"+count+"条数据出错：生产报工对象不能为空。");
						return result;
					}
					WOMTaskReporting taskReporting = getTaskReporting(taskReportingPart.getHeadId());
					if(taskReporting == null){
						set500Error(result, "第"+count+"条数据出错：生产报工对象不存在。");
						return result;
					}
					taskReportingPart.setTableInfoId(taskReporting.getTableInfoId());
					taskReportingPart.setHeadId(taskReporting);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkTaskReportingPartData(taskReportingPart);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			taskReportingPartService.batchImportBaseTaskReportingPart(taskReportingPartList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMTaskReportingPart taskReportingPart : taskReportingPartList){
				idList.add(taskReportingPart.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据生产报工明细id，批量删除生产报工明细数据
	 * 
	 * @param 生产报工明细id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelTaskReportingPart(
		@WebParam(name="pk")List<String> pk,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(ownerStaffUUID == null || ownerStaffUUID.trim().isEmpty()){
				return set500Error(result, "ownerStaffUUID不能为空。");
			}
			try{
				setOrchidAuthenticationToken(ownerStaffUUID);
			}catch(RuntimeException e){
				result.setStatusCode("400");
				result.setErrorMessage(e.getMessage());
				return result;
			}
			
			List<WOMTaskReportingPart> taskReportingPartList = new ArrayList<WOMTaskReportingPart>();
			if(pk == null || pk.isEmpty()){
				return set500Error(result, "pk为空。");
			}
			int count = 1;
			for(String k : pk){
				Long id = null;
				try {
					id = Long.parseLong(k);
				} catch (NumberFormatException e) {
					return set500Error(result, "第"+count+"个pk不是一个Long型数字：" + k);
				}
				
				WOMTaskReportingPart taskReportingPart = taskReportingPartService.getTaskReportingPart(id);
				if(taskReportingPart == null || !taskReportingPart.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				taskReportingPartList.add(taskReportingPart);
				
				count ++;
			}
			for(WOMTaskReportingPart taskReportingPart : taskReportingPartList){
				taskReportingPartService.deleteTaskReportingPart(taskReportingPart);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有生产报工明细数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTaskReportingPartPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMTaskReportingPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMTaskReportingPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMTaskReportingPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMTaskReportingPart.class);
				} catch (Exception e) {
					return set500Error(result,"解析排序条件失败： " + e.getMessage());
				}
				String[] orderBys = orderBy.split(",");
				if (detachedCriteria != null && null != orderBys && orderBys.length > 0) {
					for (int i = 0; i < orderBys.length; i++) {
						String[] items = orderBys[i].split(" ");
						if (items != null && items.length == 2) {
							if (null != items[1] && "asc".equalsIgnoreCase(items[1].toString())) {
								if (null != items[0] && items[0].length() > 0) {
									detachedCriteria.addOrder(org.hibernate.criterion.Order.asc(items[0].toString()));
								}
							} else if (null != items[1] && "desc".equalsIgnoreCase(items[1].toString())) {
								if (null != items[0] && items[0].length() > 0) {
									detachedCriteria.addOrder(org.hibernate.criterion.Order.desc(items[0].toString()));
								}
							}
						}
					}
				}
			}
				
			if (null == detachedCriteria) {
				detachedCriteria = DetachedCriteria.forClass(WOMTaskReportingPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMTaskReportingPart> page = new Page<WOMTaskReportingPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMTaskReportingPart> datas = taskReportingPartService.getByPage(page, detachedCriteria);
			List<WOMTaskReportingPart> taskReportingPartList = datas.getResult();
			if (taskReportingPartList == null || taskReportingPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(taskReportingPartList.toArray());
			PaginationDTO<WOMTaskReportingPart> pagination = new PaginationDTO<WOMTaskReportingPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到生产报工明细则返回空。
	 * @param taskReportingPart
	 * @return
	 */
	private WOMTaskReportingPart getTaskReportingPart(WOMTaskReportingPart taskReportingPart) {
		if (taskReportingPart.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMTaskReportingPart result = taskReportingPartService.getTaskReportingPart(taskReportingPart.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果生产报工明细不存在，返回false；如果原来没有生产报工对象，且修改的时候也没有配置生产报工对象，则报错；如果配置的生产报工对象不存在，则报错；
	 * @param taskReportingPart
	 * @return 
	 */
	private boolean beforeUpdateTaskReportingPart(WOMTaskReportingPart taskReportingPart){
		if(taskReportingPart.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMTaskReportingPart temp = getTaskReportingPart(taskReportingPart);
		if(temp == null){
			return false;
		}
		WOMTaskReporting taskReporting = null;
		if (temp.getHeadId() == null) {
			if (taskReportingPart.getHeadId() == null || (taskReportingPart.getHeadId().getId() == null && taskReportingPart.getHeadId().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				taskReporting = getTaskReporting(taskReportingPart.getHeadId());
				if(taskReporting == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (taskReportingPart.getHeadId() == null || (taskReportingPart.getHeadId().getId() == null && taskReportingPart.getHeadId().getTableNo() == null)) {
				taskReporting = temp.getHeadId();
			} else {
				taskReporting = getTaskReporting(taskReportingPart.getHeadId());
				if (taskReporting == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		taskReportingPart.setTableInfoId(taskReporting.getTableInfoId());
		
		taskReportingPart.setHeadId(taskReporting);
		taskReportingPart.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMTaskReportingPart> clearTaskReportingPartNonMainField(List<WOMTaskReportingPart> list){
		 List<WOMTaskReportingPart> taskReportingPartList = new ArrayList<WOMTaskReportingPart>();
		 for(WOMTaskReportingPart taskReportingPart:list){
			 WOMTaskReportingPart temp = new WOMTaskReportingPart();
			 temp.setId(taskReportingPart.getId());
		 	 taskReportingPartList.add(temp);
		 }
		 return taskReportingPartList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkTaskReportingPartData(WOMTaskReportingPart taskReportingPart){
	}
	 
	
	// ----------------------------公共私有方法----------------------------------------
	private JWSResultDTO setSysError(JWSResultDTO result, Throwable t) {
		logger.error(t.getMessage(),t);
		if(t instanceof BAPException){
			BAPException e = (BAPException) t;
			result.setErrorMessage("BAPException:  "+e.getMessageKey()+"    "+e.getArgs().toString());
			result.setStatusCode("500");
			return result;
		}
		
		if(t.getMessage() != null &&  !t.getMessage().isEmpty()){
			result.setErrorMessage("内部服务器错误：" + t.getMessage());
		}else{
			result.setErrorMessage("内部服务器错误：" + t.toString());
		}
		result.setStatusCode("500");
		return result;
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
	
	
	/**
	 * 获取生产报工对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param taskReporting
	 * @return
	 */
	private WOMTaskReporting getTaskReporting(WOMTaskReporting taskReporting) {
		if (taskReporting.getId() == null && (taskReporting.getTableNo() == null || taskReporting.getTableNo().toString().trim() == ""))
			throw new RuntimeException("生产报工对象业务主键和id不能同时为空");
		if (taskReporting.getId() != null) {
			WOMTaskReporting result = taskReportingService.getTaskReporting(taskReporting .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return taskReportingService.loadTaskReportingByBussinessKey(taskReporting.getTableNo());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个生产报工，则返回false，否则返回true
	 * @param taskReporting
	 */
	private boolean beforeUpdateTaskReporting(WOMTaskReporting taskReporting) {
		taskReporting.setStatus(99);
		if(taskReporting.getTableInfoId() == null){
			throw new RuntimeException("tableInfoId不能为空。");
		}
		WOMTaskReporting temp = getTaskReporting(taskReporting);
		if (temp == null) {
			return false;
		}
		if(taskReporting.getId() == null){
			taskReporting.setId(temp.getId());		
		}
		if(taskReporting.getTableNo() == null){
			taskReporting.setTableNo(temp.getTableNo());
		}
		
		taskReporting.setVersion(temp.getVersion());
		return true;
	}
	
	
	/**
	 * 对PageParamDTO进行预处理。
	 * @param pageParam
	 */
	private void preparePageParam(PageParamDTO pageParam) {
		if (pageParam.getPageNo() < 1) {
			pageParam.setPageNo(1);
		}
		if (pageParam.getPageSize() < 1) {
			pageParam.setPageSize(0);
		} else if (pageParam.getPageSize() > 500) {
			pageParam.setPageSize(500);
		}
	}
	
	/**
	 * 清除生产报工对象下所有辅模型对象中的生产报工对象
	 * @param taskReporting
	 */
	private void clearCircle(WOMTaskReporting taskReporting) {
		if (taskReporting.getTaskReportingPartList() != null && taskReporting.getTaskReportingPartList().size() > 0) {
			for (WOMTaskReportingPart taskReportingPart : taskReporting.getTaskReportingPartList()) {
				taskReportingPart.setHeadId(null);
			}
		}
	
	}
	
	private void setOrchidAuthenticationToken(String ownerStaffUUID){
		Staff staff = staffService.getByUUid(ownerStaffUUID);
		if(staff == null)
			throw new RuntimeException("找不到staff。   ownerStaffUUID："+ownerStaffUUID);
		
		User user = staff.getUser();
		if(user == null)
			throw new RuntimeException("该staff下user为空。  ownerStaffUUID："+ownerStaffUUID);
		
		List<CompanyStaff> companyStaffs =
		companyStaffService.getCompanyStaffs(staff);
		if(companyStaffs == null || companyStaffs.isEmpty())
			throw new RuntimeException("该staff不在Company下。  ownerStaffUUID："+ownerStaffUUID);
		
		OrchidAuthenticationToken orchidAuthenticationToken = null;
		try{
			orchidAuthenticationToken = new OrchidAuthenticationToken(user, null,
			null, companyStaffs.get(companyStaffs.size()-1).getCompany(), staff,
			Collections.EMPTY_LIST, Collections.EMPTY_LIST);
		}catch(NullPointerException e){
			throw new RuntimeException("ownerStaffUUID:"+ownerStaffUUID+"  不正确");
		}
		SecurityContextHolder.getContext().setAuthentication(orchidAuthenticationToken);
	}
	
	/**
	 * 如果有除主键和id以外的不可空字段为null，则抛出异常
	 */
	private void checkTaskReportingData(WOMTaskReporting taskReporting){
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}