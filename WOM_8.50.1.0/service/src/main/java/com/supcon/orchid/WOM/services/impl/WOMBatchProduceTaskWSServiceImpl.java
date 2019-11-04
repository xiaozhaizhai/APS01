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
import com.supcon.orchid.WOM.services.WOMBatchProduceTaskWSService;
import com.supcon.orchid.WOM.services.WOMBatchProduceTaskService;
import com.supcon.orchid.WOM.services.WOMBatchProdTaskPartService;
	
/* CUSTOM CODE START(wsserviceimpl,import,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="WOMBatchProduceTask",targetNamespace = "http://ws.supcon.com")
public class WOMBatchProduceTaskWSServiceImpl implements WOMBatchProduceTaskWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private WOMBatchProduceTaskService batchProduceTaskService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private WOMBatchProdTaskPartService batchProdTaskPartService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取指令批量数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchProduceTaskByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			WOMBatchProduceTask batchProduceTask = batchProduceTaskService.loadBatchProduceTaskByBussinessKey(businessKey);
			if(batchProduceTask == null){
				return set404Error(result);
			}
			//添加辅模型
			List<WOMBatchProdTaskPart> batchProdTaskPartList = clearBatchProdTaskPartNonMainField(batchProduceTaskService.getBatchProdTaskPartList(batchProduceTask));
			batchProduceTask.setBatchProdTaskPartList(batchProdTaskPartList);
			
			setSuccessResult(result, batchProduceTask);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取指令批量数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchProduceTaskByPk(
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
			
			WOMBatchProduceTask batchProduceTask = batchProduceTaskService.getBatchProduceTask(id);
			if(batchProduceTask == null || !batchProduceTask.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<WOMBatchProdTaskPart> batchProdTaskPartList = clearBatchProdTaskPartNonMainField(batchProduceTaskService.getBatchProdTaskPartList(batchProduceTask));
			batchProduceTask.setBatchProdTaskPartList(batchProdTaskPartList);
			setSuccessResult(result, batchProduceTask);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改指令批量数据
	 * @param 指令批量对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateBatchProduceTask(
		@WebParam(name="batchProduceTask")WOMBatchProduceTask batchProduceTask,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(batchProduceTask == null){
				return set500Error(result, "指令批量不能为空。");
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
			
			if(!beforeUpdateBatchProduceTask(batchProduceTask)){
				return set404Error(result);
			}
			batchProduceTaskService.saveSuperEditBatchProduceTask(batchProduceTask, null, null, null, null, null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addBatchProduceTask(
		@WebParam(name="batchProduceTask")WOMBatchProduceTask batchProduceTask,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(batchProduceTask == null){
				return set500Error(result, "指令批量不能为空。");
			}
		
			if(batchProduceTask.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(batchProduceTask.getTableNo() == null){
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
				checkBatchProduceTaskData(batchProduceTask);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			batchProduceTaskService.saveSuperEditBatchProduceTask(batchProduceTask, null, null, null);
			setSuccessResult(result, batchProduceTask.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteBatchProduceTaskByBusinessKey(
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
			WOMBatchProduceTask batchProduceTask = null;
			try{
				batchProduceTask = batchProduceTaskService.loadBatchProduceTaskByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(batchProduceTask == null){
				return set404Error(result);
			}
			batchProduceTaskService.deleteBatchProduceTask(batchProduceTask);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteBatchProduceTaskByPk(
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
			WOMBatchProduceTask batchProduceTask = null;
			try{
				batchProduceTask = batchProduceTaskService.getBatchProduceTask(id);
			}catch(NullPointerException e){}
			if(batchProduceTask == null || !batchProduceTask.isValid()){
				return set404Error(result);
			}
			batchProduceTaskService.deleteBatchProduceTask(batchProduceTask);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddBatchProduceTask(
		@WebParam(name="batchProduceTaskList")List<WOMBatchProduceTask> batchProduceTaskList,
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
			for(WOMBatchProduceTask batchProduceTask : batchProduceTaskList){
				if(batchProduceTask.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(batchProduceTask.getTableNo() == null || batchProduceTask.getTableNo().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkBatchProduceTaskData(batchProduceTask);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			batchProduceTaskService.batchSaveSuperEditBatchProduceTask(batchProduceTaskList, null, null, null);
			for(WOMBatchProduceTask batchProduceTask : batchProduceTaskList){
				idList.add(batchProduceTask.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateBatchProduceTask(
		@WebParam(name="batchProduceTaskList")List<WOMBatchProduceTask> batchProduceTaskList,
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
			for(WOMBatchProduceTask batchProduceTask : batchProduceTaskList){
				try{
					if(!beforeUpdateBatchProduceTask(batchProduceTask)){
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
			batchProduceTaskService.batchSaveSuperEditBatchProduceTask(batchProduceTaskList, null, null, null,null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteBatchProduceTaskByPk(
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
				WOMBatchProduceTask temp = null;
				try{
					temp = batchProduceTaskService.getBatchProduceTask(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			batchProduceTaskService.deleteBatchProduceTask(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteBatchProduceTaskByBusinessKey(
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
				WOMBatchProduceTask temp = null;
				try{
					temp = batchProduceTaskService.loadBatchProduceTaskByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			batchProduceTaskService.deleteBatchProduceTask(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchProduceTaskPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMBatchProduceTask.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),WOMBatchProduceTask.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchProduceTask.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchProduceTask.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchProduceTask.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMBatchProduceTask> page = new Page<WOMBatchProduceTask>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchProduceTask> datas = batchProduceTaskService.getByPage(page, detachedCriteria);
			List<WOMBatchProduceTask> batchProduceTaskList = datas.getResult();
			if (batchProduceTaskList == null || batchProduceTaskList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchProduceTaskList.toArray());
			PaginationDTO<WOMBatchProduceTask> pagination = new PaginationDTO<WOMBatchProduceTask>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据指令批量业务主键查询指令批量下所有辅模型
	 * @param 指令批量业务主键
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
			WOMBatchProduceTask batchProduceTask = batchProduceTaskService.loadBatchProduceTaskByBussinessKey(businessKey);
			if (batchProduceTask == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap batchProdTaskPartMap = new SimulationMap();
			batchProdTaskPartMap.setName(InternationalResource.get("BatchProdTaskPart"));
			batchProdTaskPartMap.setList(batchProduceTaskService.getBatchProdTaskPartList(batchProduceTask));
			resultList.add(batchProdTaskPartMap);
			
			clearCircle(batchProduceTask);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据指令批量id查询指令批量下所有辅模型
	 * 
	 * @param 指令批量id
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
			WOMBatchProduceTask batchProduceTask = batchProduceTaskService.getBatchProduceTask(id);
			if (batchProduceTask == null || !batchProduceTask.isValid()) {
				result.setErrorMessage("找不到指令批量");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap batchProdTaskPartMap = new SimulationMap();
			batchProdTaskPartMap.setName(InternationalResource.get("BatchProdTaskPart"));
			batchProdTaskPartMap.setList(batchProduceTaskService.getBatchProdTaskPartList(batchProduceTask));
			resultList.add(batchProdTaskPartMap);
			
			clearCircle(batchProduceTask);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  批量明细-------------------------------------------------
	//--hasLink:true---link:HeadId
	/**
	 * 根据批量明细业务主键分页查询批量明细数据
	 * 
	 * @param 批量明细业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchProdTaskPartPageByBatchProduceTaskBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchProdTaskPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMBatchProdTaskPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchProdTaskPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchProdTaskPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchProdTaskPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			WOMBatchProduceTask batchProduceTask = batchProduceTaskService.loadBatchProduceTaskByBussinessKey(businessKey);
			if (batchProduceTask == null) {
				return set500Error(result, "该业务主键的指令批量不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("headId",batchProduceTask));
			Page<WOMBatchProdTaskPart> page = new Page<WOMBatchProdTaskPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchProdTaskPart> datas = batchProdTaskPartService.getByPage(page, detachedCriteria);
			List<WOMBatchProdTaskPart> batchProdTaskPartList = datas.getResult();
			if (batchProdTaskPartList == null || batchProdTaskPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchProdTaskPartList.toArray());
			PaginationDTO<WOMBatchProdTaskPart> pagination = new PaginationDTO<WOMBatchProdTaskPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据批量明细id分页查询批量明细数据
	 * 
	 * @param 批量明细id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchProdTaskPartPageByBatchProduceTaskPk(	
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchProdTaskPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), WOMBatchProdTaskPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchProdTaskPart.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchProdTaskPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchProdTaskPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			WOMBatchProduceTask batchProduceTask = batchProduceTaskService.getBatchProduceTask(id);
			if (batchProduceTask == null) {
				return set500Error(result, "该主键的指令批量不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("headId",batchProduceTask));
			Page<WOMBatchProdTaskPart> page = new Page<WOMBatchProdTaskPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchProdTaskPart> datas = batchProdTaskPartService.getByPage(page, detachedCriteria);
			List<WOMBatchProdTaskPart> batchProdTaskPartList = datas.getResult();
			if (batchProdTaskPartList == null || batchProdTaskPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchProdTaskPartList.toArray());
			PaginationDTO<WOMBatchProdTaskPart> pagination = new PaginationDTO<WOMBatchProdTaskPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据批量明细id分获取批量明细数据
	 * 
	 * @param 批量明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchProdTaskPart(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMBatchProdTaskPart batchProdTaskPart = batchProdTaskPartService.getBatchProdTaskPart(id);
			if(batchProdTaskPart == null){
				return set404Error(result);
			}
			setSuccessResult(result, batchProdTaskPart);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据批量明细业务id修改批量明细数据
	 * 
	 * @param 批量明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateBatchProdTaskPart(
		@WebParam(name="batchProdTaskPart")WOMBatchProdTaskPart batchProdTaskPart,
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
			if(!beforeUpdateBatchProdTaskPart(batchProdTaskPart)){
				return set404Error(result);
			}
			batchProdTaskPartService.saveBatchProdTaskPart(batchProdTaskPart, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增批量明细
	 * 
	 * @param 批量明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addBatchProdTaskPart(
		@WebParam(name="batchProdTaskPart")WOMBatchProdTaskPart batchProdTaskPart,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(batchProdTaskPart == null){
				return set500Error(result, "批量明细对象不能为空。");
			}
			if(batchProdTaskPart.getId() != null){
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
				checkBatchProdTaskPartData(batchProdTaskPart);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			WOMBatchProduceTask tempBatchProduceTask = batchProdTaskPart.getHeadId();
			if (tempBatchProduceTask == null) {
				return set500Error(result, "指令批量对象不能为空");
			}
			
			WOMBatchProduceTask batchProduceTask = null;
			if(tempBatchProduceTask.getId()!= null){
				batchProduceTask = batchProduceTaskService.getBatchProduceTask(tempBatchProduceTask.getId());
			}else if(tempBatchProduceTask.getTableNo() != null){
				batchProduceTask = batchProduceTaskService.loadBatchProduceTaskByBussinessKey(tempBatchProduceTask.getTableNo());
			}else{
				return set500Error(result, "指令批量对象必须设置id或业务主键。");
			}
			
			if(batchProduceTask == null){
				return set404Error(result);
			}
			batchProdTaskPart.setTableInfoId(batchProduceTask.getTableInfoId());
			batchProdTaskPart.setHeadId(batchProduceTask);
			
			batchProdTaskPartService.saveBatchProdTaskPart(batchProdTaskPart, null);
			Long batchProdTaskPartId = batchProdTaskPart.getId();
			setSuccessResult(result, batchProdTaskPartId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据批量明细id 删除批量明细
	 * 
	 * @param 批量明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteBatchProdTaskPart(
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
			
			WOMBatchProdTaskPart batchProdTaskPart = null;
			try{
				batchProdTaskPart = batchProdTaskPartService.getBatchProdTaskPart(id);
			}catch(NullPointerException e){}
			if(batchProdTaskPart == null  || !batchProdTaskPart.isValid()){
				return set404Error(result);
			}
			batchProdTaskPartService.deleteBatchProdTaskPart(batchProdTaskPart);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改批量明细数据，批量明细id不能为空
	 *
	 * @param 批量明细列表，每个批量明细必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateBatchProdTaskPart(
		@WebParam(name="batchProdTaskPartList")List<WOMBatchProdTaskPart> batchProdTaskPartList,
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
			for(WOMBatchProdTaskPart batchProdTaskPart : batchProdTaskPartList){
				try{
					if(!beforeUpdateBatchProdTaskPart(batchProdTaskPart)){
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
			
			batchProdTaskPartService.batchImportBaseBatchProdTaskPart(batchProdTaskPartList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增批量明细数据
	 * 
	 * @param 批量明细列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddBatchProdTaskPart(
		@WebParam(name="batchProdTaskPartList")List<WOMBatchProdTaskPart> batchProdTaskPartList,
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
			
			if(batchProdTaskPartList == null){
				set500Error(result, "batchProdTaskPartList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMBatchProdTaskPart batchProdTaskPart : batchProdTaskPartList){
				if(batchProdTaskPart.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(batchProdTaskPart.getHeadId() == null){
						set500Error(result, "第"+count+"条数据出错：指令批量对象不能为空。");
						return result;
					}
					WOMBatchProduceTask batchProduceTask = getBatchProduceTask(batchProdTaskPart.getHeadId());
					if(batchProduceTask == null){
						set500Error(result, "第"+count+"条数据出错：指令批量对象不存在。");
						return result;
					}
					batchProdTaskPart.setTableInfoId(batchProduceTask.getTableInfoId());
					batchProdTaskPart.setHeadId(batchProduceTask);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkBatchProdTaskPartData(batchProdTaskPart);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			batchProdTaskPartService.batchImportBaseBatchProdTaskPart(batchProdTaskPartList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMBatchProdTaskPart batchProdTaskPart : batchProdTaskPartList){
				idList.add(batchProdTaskPart.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据批量明细id，批量删除批量明细数据
	 * 
	 * @param 批量明细id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelBatchProdTaskPart(
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
			
			List<WOMBatchProdTaskPart> batchProdTaskPartList = new ArrayList<WOMBatchProdTaskPart>();
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
				
				WOMBatchProdTaskPart batchProdTaskPart = batchProdTaskPartService.getBatchProdTaskPart(id);
				if(batchProdTaskPart == null || !batchProdTaskPart.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				batchProdTaskPartList.add(batchProdTaskPart);
				
				count ++;
			}
			for(WOMBatchProdTaskPart batchProdTaskPart : batchProdTaskPartList){
				batchProdTaskPartService.deleteBatchProdTaskPart(batchProdTaskPart);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有批量明细数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchProdTaskPartPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMBatchProdTaskPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMBatchProdTaskPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchProdTaskPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchProdTaskPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchProdTaskPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMBatchProdTaskPart> page = new Page<WOMBatchProdTaskPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchProdTaskPart> datas = batchProdTaskPartService.getByPage(page, detachedCriteria);
			List<WOMBatchProdTaskPart> batchProdTaskPartList = datas.getResult();
			if (batchProdTaskPartList == null || batchProdTaskPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchProdTaskPartList.toArray());
			PaginationDTO<WOMBatchProdTaskPart> pagination = new PaginationDTO<WOMBatchProdTaskPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到批量明细则返回空。
	 * @param batchProdTaskPart
	 * @return
	 */
	private WOMBatchProdTaskPart getBatchProdTaskPart(WOMBatchProdTaskPart batchProdTaskPart) {
		if (batchProdTaskPart.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMBatchProdTaskPart result = batchProdTaskPartService.getBatchProdTaskPart(batchProdTaskPart.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果批量明细不存在，返回false；如果原来没有指令批量对象，且修改的时候也没有配置指令批量对象，则报错；如果配置的指令批量对象不存在，则报错；
	 * @param batchProdTaskPart
	 * @return 
	 */
	private boolean beforeUpdateBatchProdTaskPart(WOMBatchProdTaskPart batchProdTaskPart){
		if(batchProdTaskPart.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMBatchProdTaskPart temp = getBatchProdTaskPart(batchProdTaskPart);
		if(temp == null){
			return false;
		}
		WOMBatchProduceTask batchProduceTask = null;
		if (temp.getHeadId() == null) {
			if (batchProdTaskPart.getHeadId() == null || (batchProdTaskPart.getHeadId().getId() == null && batchProdTaskPart.getHeadId().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				batchProduceTask = getBatchProduceTask(batchProdTaskPart.getHeadId());
				if(batchProduceTask == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (batchProdTaskPart.getHeadId() == null || (batchProdTaskPart.getHeadId().getId() == null && batchProdTaskPart.getHeadId().getTableNo() == null)) {
				batchProduceTask = temp.getHeadId();
			} else {
				batchProduceTask = getBatchProduceTask(batchProdTaskPart.getHeadId());
				if (batchProduceTask == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		batchProdTaskPart.setTableInfoId(batchProduceTask.getTableInfoId());
		
		batchProdTaskPart.setHeadId(batchProduceTask);
		batchProdTaskPart.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMBatchProdTaskPart> clearBatchProdTaskPartNonMainField(List<WOMBatchProdTaskPart> list){
		 List<WOMBatchProdTaskPart> batchProdTaskPartList = new ArrayList<WOMBatchProdTaskPart>();
		 for(WOMBatchProdTaskPart batchProdTaskPart:list){
			 WOMBatchProdTaskPart temp = new WOMBatchProdTaskPart();
			 temp.setId(batchProdTaskPart.getId());
		 	 batchProdTaskPartList.add(temp);
		 }
		 return batchProdTaskPartList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkBatchProdTaskPartData(WOMBatchProdTaskPart batchProdTaskPart){
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
	 * 获取指令批量对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param batchProduceTask
	 * @return
	 */
	private WOMBatchProduceTask getBatchProduceTask(WOMBatchProduceTask batchProduceTask) {
		if (batchProduceTask.getId() == null && (batchProduceTask.getTableNo() == null || batchProduceTask.getTableNo().toString().trim() == ""))
			throw new RuntimeException("指令批量对象业务主键和id不能同时为空");
		if (batchProduceTask.getId() != null) {
			WOMBatchProduceTask result = batchProduceTaskService.getBatchProduceTask(batchProduceTask .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return batchProduceTaskService.loadBatchProduceTaskByBussinessKey(batchProduceTask.getTableNo());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个指令批量，则返回false，否则返回true
	 * @param batchProduceTask
	 */
	private boolean beforeUpdateBatchProduceTask(WOMBatchProduceTask batchProduceTask) {
		batchProduceTask.setStatus(99);
		if(batchProduceTask.getTableInfoId() == null){
			throw new RuntimeException("tableInfoId不能为空。");
		}
		WOMBatchProduceTask temp = getBatchProduceTask(batchProduceTask);
		if (temp == null) {
			return false;
		}
		if(batchProduceTask.getId() == null){
			batchProduceTask.setId(temp.getId());		
		}
		if(batchProduceTask.getTableNo() == null){
			batchProduceTask.setTableNo(temp.getTableNo());
		}
		
		batchProduceTask.setVersion(temp.getVersion());
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
	 * 清除指令批量对象下所有辅模型对象中的指令批量对象
	 * @param batchProduceTask
	 */
	private void clearCircle(WOMBatchProduceTask batchProduceTask) {
		if (batchProduceTask.getBatchProdTaskPartList() != null && batchProduceTask.getBatchProdTaskPartList().size() > 0) {
			for (WOMBatchProdTaskPart batchProdTaskPart : batchProduceTask.getBatchProdTaskPartList()) {
				batchProdTaskPart.setHeadId(null);
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
	private void checkBatchProduceTaskData(WOMBatchProduceTask batchProduceTask){
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}