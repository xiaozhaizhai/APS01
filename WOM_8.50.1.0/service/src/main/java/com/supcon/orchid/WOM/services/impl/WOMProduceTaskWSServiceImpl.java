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
import com.supcon.orchid.WOM.services.WOMProduceTaskWSService;
import com.supcon.orchid.WOM.services.WOMProduceTaskService;
import com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService;
import com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService;
import com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService;
import com.supcon.orchid.WOM.services.WOMProduceMaterialSumService;
import com.supcon.orchid.WOM.services.WOMProduceTaskActiveService;
import com.supcon.orchid.WOM.services.WOMProduceTaskProcessService;
import com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService;
	
/* CUSTOM CODE START(wsserviceimpl,import,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="WOMProduceTask",targetNamespace = "http://ws.supcon.com")
public class WOMProduceTaskWSServiceImpl implements WOMProduceTaskWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private WOMProduceTaskService produceTaskService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private WOMBatchPhaseExelogService batchPhaseExelogService;
	@Resource
	private WOMProdTaskActiExelogService prodTaskActiExelogService;
	@Resource
	private WOMProdTaskProcExelogService prodTaskProcExelogService;
	@Resource
	private WOMProduceMaterialSumService produceMaterialSumService;
	@Resource
	private WOMProduceTaskActiveService produceTaskActiveService;
	@Resource
	private WOMProduceTaskProcessService produceTaskProcessService;
	@Resource
	private WOMWaitPutinRecordsService waitPutinRecordsService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取生产指令单数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			WOMProduceTask produceTask = produceTaskService.loadProduceTaskByBussinessKey(businessKey);
			if(produceTask == null){
				return set404Error(result);
			}
			//添加辅模型
			List<WOMBatchPhaseExelog> batchPhaseExelogList = clearBatchPhaseExelogNonMainField(produceTaskService.getBatchPhaseExelogList(produceTask));
			produceTask.setBatchPhaseExelogList(batchPhaseExelogList);
			List<WOMProdTaskActiExelog> prodTaskActiExelogList = clearProdTaskActiExelogNonMainField(produceTaskService.getProdTaskActiExelogList(produceTask));
			produceTask.setProdTaskActiExelogList(prodTaskActiExelogList);
			List<WOMProdTaskProcExelog> prodTaskProcExelogList = clearProdTaskProcExelogNonMainField(produceTaskService.getProdTaskProcExelogList(produceTask));
			produceTask.setProdTaskProcExelogList(prodTaskProcExelogList);
			List<WOMProduceMaterialSum> produceMaterialSumList = clearProduceMaterialSumNonMainField(produceTaskService.getProduceMaterialSumList(produceTask));
			produceTask.setProduceMaterialSumList(produceMaterialSumList);
			List<WOMProduceTaskActive> produceTaskActiveList = clearProduceTaskActiveNonMainField(produceTaskService.getProduceTaskActiveList(produceTask));
			produceTask.setProduceTaskActiveList(produceTaskActiveList);
			List<WOMProduceTaskProcess> produceTaskProcessList = clearProduceTaskProcessNonMainField(produceTaskService.getProduceTaskProcessList(produceTask));
			produceTask.setProduceTaskProcessList(produceTaskProcessList);
			
			setSuccessResult(result, produceTask);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取生产指令单数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskByPk(
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
			
			WOMProduceTask produceTask = produceTaskService.getProduceTask(id);
			if(produceTask == null || !produceTask.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<WOMBatchPhaseExelog> batchPhaseExelogList = clearBatchPhaseExelogNonMainField(produceTaskService.getBatchPhaseExelogList(produceTask));
			produceTask.setBatchPhaseExelogList(batchPhaseExelogList);
			List<WOMProdTaskActiExelog> prodTaskActiExelogList = clearProdTaskActiExelogNonMainField(produceTaskService.getProdTaskActiExelogList(produceTask));
			produceTask.setProdTaskActiExelogList(prodTaskActiExelogList);
			List<WOMProdTaskProcExelog> prodTaskProcExelogList = clearProdTaskProcExelogNonMainField(produceTaskService.getProdTaskProcExelogList(produceTask));
			produceTask.setProdTaskProcExelogList(prodTaskProcExelogList);
			List<WOMProduceMaterialSum> produceMaterialSumList = clearProduceMaterialSumNonMainField(produceTaskService.getProduceMaterialSumList(produceTask));
			produceTask.setProduceMaterialSumList(produceMaterialSumList);
			List<WOMProduceTaskActive> produceTaskActiveList = clearProduceTaskActiveNonMainField(produceTaskService.getProduceTaskActiveList(produceTask));
			produceTask.setProduceTaskActiveList(produceTaskActiveList);
			List<WOMProduceTaskProcess> produceTaskProcessList = clearProduceTaskProcessNonMainField(produceTaskService.getProduceTaskProcessList(produceTask));
			produceTask.setProduceTaskProcessList(produceTaskProcessList);
			setSuccessResult(result, produceTask);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改生产指令单数据
	 * @param 生产指令单对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProduceTask(
		@WebParam(name="produceTask")WOMProduceTask produceTask,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(produceTask == null){
				return set500Error(result, "生产指令单不能为空。");
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
			
			if(!beforeUpdateProduceTask(produceTask)){
				return set404Error(result);
			}
			produceTaskService.saveSuperEditProduceTask(produceTask, null, null, null, null, null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProduceTask(
		@WebParam(name="produceTask")WOMProduceTask produceTask,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(produceTask == null){
				return set500Error(result, "生产指令单不能为空。");
			}
		
			if(produceTask.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(produceTask.getTableNo() == null){
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
				checkProduceTaskData(produceTask);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			produceTaskService.saveSuperEditProduceTask(produceTask, null, null, null);
			setSuccessResult(result, produceTask.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskByBusinessKey(
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
			WOMProduceTask produceTask = null;
			try{
				produceTask = produceTaskService.loadProduceTaskByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(produceTask == null){
				return set404Error(result);
			}
			produceTaskService.deleteProduceTask(produceTask);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskByPk(
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
			WOMProduceTask produceTask = null;
			try{
				produceTask = produceTaskService.getProduceTask(id);
			}catch(NullPointerException e){}
			if(produceTask == null || !produceTask.isValid()){
				return set404Error(result);
			}
			produceTaskService.deleteProduceTask(produceTask);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProduceTask(
		@WebParam(name="produceTaskList")List<WOMProduceTask> produceTaskList,
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
			for(WOMProduceTask produceTask : produceTaskList){
				if(produceTask.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(produceTask.getTableNo() == null || produceTask.getTableNo().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkProduceTaskData(produceTask);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			produceTaskService.batchSaveSuperEditProduceTask(produceTaskList, null, null, null);
			for(WOMProduceTask produceTask : produceTaskList){
				idList.add(produceTask.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProduceTask(
		@WebParam(name="produceTaskList")List<WOMProduceTask> produceTaskList,
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
			for(WOMProduceTask produceTask : produceTaskList){
				try{
					if(!beforeUpdateProduceTask(produceTask)){
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
			produceTaskService.batchSaveSuperEditProduceTask(produceTaskList, null, null, null,null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteProduceTaskByPk(
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
				WOMProduceTask temp = null;
				try{
					temp = produceTaskService.getProduceTask(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			produceTaskService.deleteProduceTask(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteProduceTaskByBusinessKey(
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
				WOMProduceTask temp = null;
				try{
					temp = produceTaskService.loadProduceTaskByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			produceTaskService.deleteProduceTask(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTask.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),WOMProduceTask.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProduceTask.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProduceTask.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTask.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMProduceTask> page = new Page<WOMProduceTask>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProduceTask> datas = produceTaskService.getByPage(page, detachedCriteria);
			List<WOMProduceTask> produceTaskList = datas.getResult();
			if (produceTaskList == null || produceTaskList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(produceTaskList.toArray());
			PaginationDTO<WOMProduceTask> pagination = new PaginationDTO<WOMProduceTask>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据生产指令单业务主键查询生产指令单下所有辅模型
	 * @param 生产指令单业务主键
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
			WOMProduceTask produceTask = produceTaskService.loadProduceTaskByBussinessKey(businessKey);
			if (produceTask == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap batchPhaseExelogMap = new SimulationMap();
			batchPhaseExelogMap.setName(InternationalResource.get("BatchPhaseExelog"));
			batchPhaseExelogMap.setList(produceTaskService.getBatchPhaseExelogList(produceTask));
			resultList.add(batchPhaseExelogMap);
			
			SimulationMap prodTaskActiExelogMap = new SimulationMap();
			prodTaskActiExelogMap.setName(InternationalResource.get("ProdTaskActiExelog"));
			prodTaskActiExelogMap.setList(produceTaskService.getProdTaskActiExelogList(produceTask));
			resultList.add(prodTaskActiExelogMap);
			
			SimulationMap prodTaskProcExelogMap = new SimulationMap();
			prodTaskProcExelogMap.setName(InternationalResource.get("ProdTaskProcExelog"));
			prodTaskProcExelogMap.setList(produceTaskService.getProdTaskProcExelogList(produceTask));
			resultList.add(prodTaskProcExelogMap);
			
			SimulationMap produceMaterialSumMap = new SimulationMap();
			produceMaterialSumMap.setName(InternationalResource.get("ProduceMaterialSum"));
			produceMaterialSumMap.setList(produceTaskService.getProduceMaterialSumList(produceTask));
			resultList.add(produceMaterialSumMap);
			
			SimulationMap produceTaskActiveMap = new SimulationMap();
			produceTaskActiveMap.setName(InternationalResource.get("ProduceTaskActive"));
			produceTaskActiveMap.setList(produceTaskService.getProduceTaskActiveList(produceTask));
			resultList.add(produceTaskActiveMap);
			
			SimulationMap produceTaskProcessMap = new SimulationMap();
			produceTaskProcessMap.setName(InternationalResource.get("ProduceTaskProcess"));
			produceTaskProcessMap.setList(produceTaskService.getProduceTaskProcessList(produceTask));
			resultList.add(produceTaskProcessMap);
			
			clearCircle(produceTask);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据生产指令单id查询生产指令单下所有辅模型
	 * 
	 * @param 生产指令单id
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
			WOMProduceTask produceTask = produceTaskService.getProduceTask(id);
			if (produceTask == null || !produceTask.isValid()) {
				result.setErrorMessage("找不到生产指令单");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap batchPhaseExelogMap = new SimulationMap();
			batchPhaseExelogMap.setName(InternationalResource.get("BatchPhaseExelog"));
			batchPhaseExelogMap.setList(produceTaskService.getBatchPhaseExelogList(produceTask));
			resultList.add(batchPhaseExelogMap);
			
			SimulationMap prodTaskActiExelogMap = new SimulationMap();
			prodTaskActiExelogMap.setName(InternationalResource.get("ProdTaskActiExelog"));
			prodTaskActiExelogMap.setList(produceTaskService.getProdTaskActiExelogList(produceTask));
			resultList.add(prodTaskActiExelogMap);
			
			SimulationMap prodTaskProcExelogMap = new SimulationMap();
			prodTaskProcExelogMap.setName(InternationalResource.get("ProdTaskProcExelog"));
			prodTaskProcExelogMap.setList(produceTaskService.getProdTaskProcExelogList(produceTask));
			resultList.add(prodTaskProcExelogMap);
			
			SimulationMap produceMaterialSumMap = new SimulationMap();
			produceMaterialSumMap.setName(InternationalResource.get("ProduceMaterialSum"));
			produceMaterialSumMap.setList(produceTaskService.getProduceMaterialSumList(produceTask));
			resultList.add(produceMaterialSumMap);
			
			SimulationMap produceTaskActiveMap = new SimulationMap();
			produceTaskActiveMap.setName(InternationalResource.get("ProduceTaskActive"));
			produceTaskActiveMap.setList(produceTaskService.getProduceTaskActiveList(produceTask));
			resultList.add(produceTaskActiveMap);
			
			SimulationMap produceTaskProcessMap = new SimulationMap();
			produceTaskProcessMap.setName(InternationalResource.get("ProduceTaskProcess"));
			produceTaskProcessMap.setList(produceTaskService.getProduceTaskProcessList(produceTask));
			resultList.add(produceTaskProcessMap);
			
			clearCircle(produceTask);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  phase执行记录-------------------------------------------------
	//--hasLink:true---link:TaskID
	/**
	 * 根据phase执行记录业务主键分页查询phase执行记录数据
	 * 
	 * @param phase执行记录业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchPhaseExelogPageByProduceTaskBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchPhaseExelog.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMBatchPhaseExelog.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchPhaseExelog.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchPhaseExelog.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchPhaseExelog.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			WOMProduceTask produceTask = produceTaskService.loadProduceTaskByBussinessKey(businessKey);
			if (produceTask == null) {
				return set500Error(result, "该业务主键的生产指令单不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("taskID",produceTask));
			Page<WOMBatchPhaseExelog> page = new Page<WOMBatchPhaseExelog>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchPhaseExelog> datas = batchPhaseExelogService.getByPage(page, detachedCriteria);
			List<WOMBatchPhaseExelog> batchPhaseExelogList = datas.getResult();
			if (batchPhaseExelogList == null || batchPhaseExelogList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchPhaseExelogList.toArray());
			PaginationDTO<WOMBatchPhaseExelog> pagination = new PaginationDTO<WOMBatchPhaseExelog>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据phase执行记录id分页查询phase执行记录数据
	 * 
	 * @param phase执行记录id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchPhaseExelogPageByProduceTaskPk(	
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchPhaseExelog.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), WOMBatchPhaseExelog.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchPhaseExelog.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchPhaseExelog.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchPhaseExelog.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			WOMProduceTask produceTask = produceTaskService.getProduceTask(id);
			if (produceTask == null) {
				return set500Error(result, "该主键的生产指令单不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("taskID",produceTask));
			Page<WOMBatchPhaseExelog> page = new Page<WOMBatchPhaseExelog>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchPhaseExelog> datas = batchPhaseExelogService.getByPage(page, detachedCriteria);
			List<WOMBatchPhaseExelog> batchPhaseExelogList = datas.getResult();
			if (batchPhaseExelogList == null || batchPhaseExelogList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchPhaseExelogList.toArray());
			PaginationDTO<WOMBatchPhaseExelog> pagination = new PaginationDTO<WOMBatchPhaseExelog>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据phase执行记录id分获取phase执行记录数据
	 * 
	 * @param phase执行记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchPhaseExelog(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogService.getBatchPhaseExelog(id);
			if(batchPhaseExelog == null){
				return set404Error(result);
			}
			setSuccessResult(result, batchPhaseExelog);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据phase执行记录业务id修改phase执行记录数据
	 * 
	 * @param phase执行记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateBatchPhaseExelog(
		@WebParam(name="batchPhaseExelog")WOMBatchPhaseExelog batchPhaseExelog,
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
			if(!beforeUpdateBatchPhaseExelog(batchPhaseExelog)){
				return set404Error(result);
			}
			batchPhaseExelogService.saveBatchPhaseExelog(batchPhaseExelog, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增phase执行记录
	 * 
	 * @param phase执行记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addBatchPhaseExelog(
		@WebParam(name="batchPhaseExelog")WOMBatchPhaseExelog batchPhaseExelog,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(batchPhaseExelog == null){
				return set500Error(result, "phase执行记录对象不能为空。");
			}
			if(batchPhaseExelog.getId() != null){
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
				checkBatchPhaseExelogData(batchPhaseExelog);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			WOMProduceTask tempProduceTask = batchPhaseExelog.getTaskID();
			if (tempProduceTask == null) {
				return set500Error(result, "生产指令单对象不能为空");
			}
			
			WOMProduceTask produceTask = null;
			if(tempProduceTask.getId()!= null){
				produceTask = produceTaskService.getProduceTask(tempProduceTask.getId());
			}else if(tempProduceTask.getTableNo() != null){
				produceTask = produceTaskService.loadProduceTaskByBussinessKey(tempProduceTask.getTableNo());
			}else{
				return set500Error(result, "生产指令单对象必须设置id或业务主键。");
			}
			
			if(produceTask == null){
				return set404Error(result);
			}
			batchPhaseExelog.setTableInfoId(produceTask.getTableInfoId());
			batchPhaseExelog.setTaskID(produceTask);
			
			batchPhaseExelogService.saveBatchPhaseExelog(batchPhaseExelog, null);
			Long batchPhaseExelogId = batchPhaseExelog.getId();
			setSuccessResult(result, batchPhaseExelogId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据phase执行记录id 删除phase执行记录
	 * 
	 * @param phase执行记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteBatchPhaseExelog(
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
			
			WOMBatchPhaseExelog batchPhaseExelog = null;
			try{
				batchPhaseExelog = batchPhaseExelogService.getBatchPhaseExelog(id);
			}catch(NullPointerException e){}
			if(batchPhaseExelog == null  || !batchPhaseExelog.isValid()){
				return set404Error(result);
			}
			batchPhaseExelogService.deleteBatchPhaseExelog(batchPhaseExelog);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改phase执行记录数据，phase执行记录id不能为空
	 *
	 * @param phase执行记录列表，每个phase执行记录必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateBatchPhaseExelog(
		@WebParam(name="batchPhaseExelogList")List<WOMBatchPhaseExelog> batchPhaseExelogList,
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
			for(WOMBatchPhaseExelog batchPhaseExelog : batchPhaseExelogList){
				try{
					if(!beforeUpdateBatchPhaseExelog(batchPhaseExelog)){
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
			
			batchPhaseExelogService.batchImportBaseBatchPhaseExelog(batchPhaseExelogList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增phase执行记录数据
	 * 
	 * @param phase执行记录列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddBatchPhaseExelog(
		@WebParam(name="batchPhaseExelogList")List<WOMBatchPhaseExelog> batchPhaseExelogList,
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
			
			if(batchPhaseExelogList == null){
				set500Error(result, "batchPhaseExelogList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMBatchPhaseExelog batchPhaseExelog : batchPhaseExelogList){
				if(batchPhaseExelog.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(batchPhaseExelog.getTaskID() == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不能为空。");
						return result;
					}
					WOMProduceTask produceTask = getProduceTask(batchPhaseExelog.getTaskID());
					if(produceTask == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不存在。");
						return result;
					}
					batchPhaseExelog.setTableInfoId(produceTask.getTableInfoId());
					batchPhaseExelog.setTaskID(produceTask);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkBatchPhaseExelogData(batchPhaseExelog);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			batchPhaseExelogService.batchImportBaseBatchPhaseExelog(batchPhaseExelogList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMBatchPhaseExelog batchPhaseExelog : batchPhaseExelogList){
				idList.add(batchPhaseExelog.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据phase执行记录id，批量删除phase执行记录数据
	 * 
	 * @param phase执行记录id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelBatchPhaseExelog(
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
			
			List<WOMBatchPhaseExelog> batchPhaseExelogList = new ArrayList<WOMBatchPhaseExelog>();
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
				
				WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogService.getBatchPhaseExelog(id);
				if(batchPhaseExelog == null || !batchPhaseExelog.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				batchPhaseExelogList.add(batchPhaseExelog);
				
				count ++;
			}
			for(WOMBatchPhaseExelog batchPhaseExelog : batchPhaseExelogList){
				batchPhaseExelogService.deleteBatchPhaseExelog(batchPhaseExelog);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有phase执行记录数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchPhaseExelogPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMBatchPhaseExelog.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMBatchPhaseExelog.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchPhaseExelog.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchPhaseExelog.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchPhaseExelog.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMBatchPhaseExelog> page = new Page<WOMBatchPhaseExelog>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchPhaseExelog> datas = batchPhaseExelogService.getByPage(page, detachedCriteria);
			List<WOMBatchPhaseExelog> batchPhaseExelogList = datas.getResult();
			if (batchPhaseExelogList == null || batchPhaseExelogList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchPhaseExelogList.toArray());
			PaginationDTO<WOMBatchPhaseExelog> pagination = new PaginationDTO<WOMBatchPhaseExelog>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到phase执行记录则返回空。
	 * @param batchPhaseExelog
	 * @return
	 */
	private WOMBatchPhaseExelog getBatchPhaseExelog(WOMBatchPhaseExelog batchPhaseExelog) {
		if (batchPhaseExelog.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMBatchPhaseExelog result = batchPhaseExelogService.getBatchPhaseExelog(batchPhaseExelog.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果phase执行记录不存在，返回false；如果原来没有生产指令单对象，且修改的时候也没有配置生产指令单对象，则报错；如果配置的生产指令单对象不存在，则报错；
	 * @param batchPhaseExelog
	 * @return 
	 */
	private boolean beforeUpdateBatchPhaseExelog(WOMBatchPhaseExelog batchPhaseExelog){
		if(batchPhaseExelog.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMBatchPhaseExelog temp = getBatchPhaseExelog(batchPhaseExelog);
		if(temp == null){
			return false;
		}
		WOMProduceTask produceTask = null;
		if (temp.getTaskID() == null) {
			if (batchPhaseExelog.getTaskID() == null || (batchPhaseExelog.getTaskID().getId() == null && batchPhaseExelog.getTaskID().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				produceTask = getProduceTask(batchPhaseExelog.getTaskID());
				if(produceTask == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (batchPhaseExelog.getTaskID() == null || (batchPhaseExelog.getTaskID().getId() == null && batchPhaseExelog.getTaskID().getTableNo() == null)) {
				produceTask = temp.getTaskID();
			} else {
				produceTask = getProduceTask(batchPhaseExelog.getTaskID());
				if (produceTask == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		batchPhaseExelog.setTableInfoId(produceTask.getTableInfoId());
		
		batchPhaseExelog.setTaskID(produceTask);
		batchPhaseExelog.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMBatchPhaseExelog> clearBatchPhaseExelogNonMainField(List<WOMBatchPhaseExelog> list){
		 List<WOMBatchPhaseExelog> batchPhaseExelogList = new ArrayList<WOMBatchPhaseExelog>();
		 for(WOMBatchPhaseExelog batchPhaseExelog:list){
			 WOMBatchPhaseExelog temp = new WOMBatchPhaseExelog();
			 temp.setId(batchPhaseExelog.getId());
		 	 batchPhaseExelogList.add(temp);
		 }
		 return batchPhaseExelogList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkBatchPhaseExelogData(WOMBatchPhaseExelog batchPhaseExelog){
	}
	 
	//------------------------------------辅模型 WS  活动执行记录-------------------------------------------------
	//--hasLink:true---link:TaskID
	/**
	 * 根据活动执行记录业务主键分页查询活动执行记录数据
	 * 
	 * @param 活动执行记录业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdTaskActiExelogPageByProduceTaskBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskActiExelog.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMProdTaskActiExelog.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProdTaskActiExelog.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProdTaskActiExelog.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskActiExelog.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			WOMProduceTask produceTask = produceTaskService.loadProduceTaskByBussinessKey(businessKey);
			if (produceTask == null) {
				return set500Error(result, "该业务主键的生产指令单不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("taskID",produceTask));
			Page<WOMProdTaskActiExelog> page = new Page<WOMProdTaskActiExelog>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProdTaskActiExelog> datas = prodTaskActiExelogService.getByPage(page, detachedCriteria);
			List<WOMProdTaskActiExelog> prodTaskActiExelogList = datas.getResult();
			if (prodTaskActiExelogList == null || prodTaskActiExelogList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodTaskActiExelogList.toArray());
			PaginationDTO<WOMProdTaskActiExelog> pagination = new PaginationDTO<WOMProdTaskActiExelog>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据活动执行记录id分页查询活动执行记录数据
	 * 
	 * @param 活动执行记录id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdTaskActiExelogPageByProduceTaskPk(	
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
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskActiExelog.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), WOMProdTaskActiExelog.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProdTaskActiExelog.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProdTaskActiExelog.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskActiExelog.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			WOMProduceTask produceTask = produceTaskService.getProduceTask(id);
			if (produceTask == null) {
				return set500Error(result, "该主键的生产指令单不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("taskID",produceTask));
			Page<WOMProdTaskActiExelog> page = new Page<WOMProdTaskActiExelog>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProdTaskActiExelog> datas = prodTaskActiExelogService.getByPage(page, detachedCriteria);
			List<WOMProdTaskActiExelog> prodTaskActiExelogList = datas.getResult();
			if (prodTaskActiExelogList == null || prodTaskActiExelogList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodTaskActiExelogList.toArray());
			PaginationDTO<WOMProdTaskActiExelog> pagination = new PaginationDTO<WOMProdTaskActiExelog>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据活动执行记录id分获取活动执行记录数据
	 * 
	 * @param 活动执行记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdTaskActiExelog(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogService.getProdTaskActiExelog(id);
			if(prodTaskActiExelog == null){
				return set404Error(result);
			}
			setSuccessResult(result, prodTaskActiExelog);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据活动执行记录业务id修改活动执行记录数据
	 * 
	 * @param 活动执行记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProdTaskActiExelog(
		@WebParam(name="prodTaskActiExelog")WOMProdTaskActiExelog prodTaskActiExelog,
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
			if(!beforeUpdateProdTaskActiExelog(prodTaskActiExelog)){
				return set404Error(result);
			}
			prodTaskActiExelogService.saveProdTaskActiExelog(prodTaskActiExelog, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增活动执行记录
	 * 
	 * @param 活动执行记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProdTaskActiExelog(
		@WebParam(name="prodTaskActiExelog")WOMProdTaskActiExelog prodTaskActiExelog,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(prodTaskActiExelog == null){
				return set500Error(result, "活动执行记录对象不能为空。");
			}
			if(prodTaskActiExelog.getId() != null){
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
				checkProdTaskActiExelogData(prodTaskActiExelog);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			WOMProduceTask tempProduceTask = prodTaskActiExelog.getTaskID();
			if (tempProduceTask == null) {
				return set500Error(result, "生产指令单对象不能为空");
			}
			
			WOMProduceTask produceTask = null;
			if(tempProduceTask.getId()!= null){
				produceTask = produceTaskService.getProduceTask(tempProduceTask.getId());
			}else if(tempProduceTask.getTableNo() != null){
				produceTask = produceTaskService.loadProduceTaskByBussinessKey(tempProduceTask.getTableNo());
			}else{
				return set500Error(result, "生产指令单对象必须设置id或业务主键。");
			}
			
			if(produceTask == null){
				return set404Error(result);
			}
			prodTaskActiExelog.setTableInfoId(produceTask.getTableInfoId());
			prodTaskActiExelog.setTaskID(produceTask);
			
			prodTaskActiExelogService.saveProdTaskActiExelog(prodTaskActiExelog, null);
			Long prodTaskActiExelogId = prodTaskActiExelog.getId();
			setSuccessResult(result, prodTaskActiExelogId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据活动执行记录id 删除活动执行记录
	 * 
	 * @param 活动执行记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProdTaskActiExelog(
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
			
			WOMProdTaskActiExelog prodTaskActiExelog = null;
			try{
				prodTaskActiExelog = prodTaskActiExelogService.getProdTaskActiExelog(id);
			}catch(NullPointerException e){}
			if(prodTaskActiExelog == null  || !prodTaskActiExelog.isValid()){
				return set404Error(result);
			}
			prodTaskActiExelogService.deleteProdTaskActiExelog(prodTaskActiExelog);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改活动执行记录数据，活动执行记录id不能为空
	 *
	 * @param 活动执行记录列表，每个活动执行记录必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProdTaskActiExelog(
		@WebParam(name="prodTaskActiExelogList")List<WOMProdTaskActiExelog> prodTaskActiExelogList,
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
			for(WOMProdTaskActiExelog prodTaskActiExelog : prodTaskActiExelogList){
				try{
					if(!beforeUpdateProdTaskActiExelog(prodTaskActiExelog)){
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
			
			prodTaskActiExelogService.batchImportBaseProdTaskActiExelog(prodTaskActiExelogList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增活动执行记录数据
	 * 
	 * @param 活动执行记录列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProdTaskActiExelog(
		@WebParam(name="prodTaskActiExelogList")List<WOMProdTaskActiExelog> prodTaskActiExelogList,
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
			
			if(prodTaskActiExelogList == null){
				set500Error(result, "prodTaskActiExelogList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMProdTaskActiExelog prodTaskActiExelog : prodTaskActiExelogList){
				if(prodTaskActiExelog.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(prodTaskActiExelog.getTaskID() == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不能为空。");
						return result;
					}
					WOMProduceTask produceTask = getProduceTask(prodTaskActiExelog.getTaskID());
					if(produceTask == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不存在。");
						return result;
					}
					prodTaskActiExelog.setTableInfoId(produceTask.getTableInfoId());
					prodTaskActiExelog.setTaskID(produceTask);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkProdTaskActiExelogData(prodTaskActiExelog);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			prodTaskActiExelogService.batchImportBaseProdTaskActiExelog(prodTaskActiExelogList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMProdTaskActiExelog prodTaskActiExelog : prodTaskActiExelogList){
				idList.add(prodTaskActiExelog.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据活动执行记录id，批量删除活动执行记录数据
	 * 
	 * @param 活动执行记录id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProdTaskActiExelog(
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
			
			List<WOMProdTaskActiExelog> prodTaskActiExelogList = new ArrayList<WOMProdTaskActiExelog>();
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
				
				WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogService.getProdTaskActiExelog(id);
				if(prodTaskActiExelog == null || !prodTaskActiExelog.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				prodTaskActiExelogList.add(prodTaskActiExelog);
				
				count ++;
			}
			for(WOMProdTaskActiExelog prodTaskActiExelog : prodTaskActiExelogList){
				prodTaskActiExelogService.deleteProdTaskActiExelog(prodTaskActiExelog);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有活动执行记录数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdTaskActiExelogPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskActiExelog.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMProdTaskActiExelog.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProdTaskActiExelog.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProdTaskActiExelog.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskActiExelog.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMProdTaskActiExelog> page = new Page<WOMProdTaskActiExelog>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProdTaskActiExelog> datas = prodTaskActiExelogService.getByPage(page, detachedCriteria);
			List<WOMProdTaskActiExelog> prodTaskActiExelogList = datas.getResult();
			if (prodTaskActiExelogList == null || prodTaskActiExelogList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodTaskActiExelogList.toArray());
			PaginationDTO<WOMProdTaskActiExelog> pagination = new PaginationDTO<WOMProdTaskActiExelog>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到活动执行记录则返回空。
	 * @param prodTaskActiExelog
	 * @return
	 */
	private WOMProdTaskActiExelog getProdTaskActiExelog(WOMProdTaskActiExelog prodTaskActiExelog) {
		if (prodTaskActiExelog.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMProdTaskActiExelog result = prodTaskActiExelogService.getProdTaskActiExelog(prodTaskActiExelog.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果活动执行记录不存在，返回false；如果原来没有生产指令单对象，且修改的时候也没有配置生产指令单对象，则报错；如果配置的生产指令单对象不存在，则报错；
	 * @param prodTaskActiExelog
	 * @return 
	 */
	private boolean beforeUpdateProdTaskActiExelog(WOMProdTaskActiExelog prodTaskActiExelog){
		if(prodTaskActiExelog.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMProdTaskActiExelog temp = getProdTaskActiExelog(prodTaskActiExelog);
		if(temp == null){
			return false;
		}
		WOMProduceTask produceTask = null;
		if (temp.getTaskID() == null) {
			if (prodTaskActiExelog.getTaskID() == null || (prodTaskActiExelog.getTaskID().getId() == null && prodTaskActiExelog.getTaskID().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				produceTask = getProduceTask(prodTaskActiExelog.getTaskID());
				if(produceTask == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (prodTaskActiExelog.getTaskID() == null || (prodTaskActiExelog.getTaskID().getId() == null && prodTaskActiExelog.getTaskID().getTableNo() == null)) {
				produceTask = temp.getTaskID();
			} else {
				produceTask = getProduceTask(prodTaskActiExelog.getTaskID());
				if (produceTask == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		prodTaskActiExelog.setTableInfoId(produceTask.getTableInfoId());
		
		prodTaskActiExelog.setTaskID(produceTask);
		prodTaskActiExelog.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMProdTaskActiExelog> clearProdTaskActiExelogNonMainField(List<WOMProdTaskActiExelog> list){
		 List<WOMProdTaskActiExelog> prodTaskActiExelogList = new ArrayList<WOMProdTaskActiExelog>();
		 for(WOMProdTaskActiExelog prodTaskActiExelog:list){
			 WOMProdTaskActiExelog temp = new WOMProdTaskActiExelog();
			 temp.setId(prodTaskActiExelog.getId());
		 	 prodTaskActiExelogList.add(temp);
		 }
		 return prodTaskActiExelogList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProdTaskActiExelogData(WOMProdTaskActiExelog prodTaskActiExelog){
	}
	 
	//------------------------------------辅模型 WS  工序执行记录-------------------------------------------------
	//--hasLink:true---link:TaskID
	/**
	 * 根据工序执行记录业务主键分页查询工序执行记录数据
	 * 
	 * @param 工序执行记录业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdTaskProcExelogPageByProduceTaskBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskProcExelog.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMProdTaskProcExelog.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProdTaskProcExelog.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProdTaskProcExelog.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskProcExelog.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			WOMProduceTask produceTask = produceTaskService.loadProduceTaskByBussinessKey(businessKey);
			if (produceTask == null) {
				return set500Error(result, "该业务主键的生产指令单不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("taskID",produceTask));
			Page<WOMProdTaskProcExelog> page = new Page<WOMProdTaskProcExelog>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProdTaskProcExelog> datas = prodTaskProcExelogService.getByPage(page, detachedCriteria);
			List<WOMProdTaskProcExelog> prodTaskProcExelogList = datas.getResult();
			if (prodTaskProcExelogList == null || prodTaskProcExelogList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodTaskProcExelogList.toArray());
			PaginationDTO<WOMProdTaskProcExelog> pagination = new PaginationDTO<WOMProdTaskProcExelog>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序执行记录id分页查询工序执行记录数据
	 * 
	 * @param 工序执行记录id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdTaskProcExelogPageByProduceTaskPk(	
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
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskProcExelog.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), WOMProdTaskProcExelog.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProdTaskProcExelog.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProdTaskProcExelog.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskProcExelog.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			WOMProduceTask produceTask = produceTaskService.getProduceTask(id);
			if (produceTask == null) {
				return set500Error(result, "该主键的生产指令单不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("taskID",produceTask));
			Page<WOMProdTaskProcExelog> page = new Page<WOMProdTaskProcExelog>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProdTaskProcExelog> datas = prodTaskProcExelogService.getByPage(page, detachedCriteria);
			List<WOMProdTaskProcExelog> prodTaskProcExelogList = datas.getResult();
			if (prodTaskProcExelogList == null || prodTaskProcExelogList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodTaskProcExelogList.toArray());
			PaginationDTO<WOMProdTaskProcExelog> pagination = new PaginationDTO<WOMProdTaskProcExelog>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序执行记录id分获取工序执行记录数据
	 * 
	 * @param 工序执行记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdTaskProcExelog(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMProdTaskProcExelog prodTaskProcExelog = prodTaskProcExelogService.getProdTaskProcExelog(id);
			if(prodTaskProcExelog == null){
				return set404Error(result);
			}
			setSuccessResult(result, prodTaskProcExelog);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序执行记录业务id修改工序执行记录数据
	 * 
	 * @param 工序执行记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProdTaskProcExelog(
		@WebParam(name="prodTaskProcExelog")WOMProdTaskProcExelog prodTaskProcExelog,
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
			if(!beforeUpdateProdTaskProcExelog(prodTaskProcExelog)){
				return set404Error(result);
			}
			prodTaskProcExelogService.saveProdTaskProcExelog(prodTaskProcExelog, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增工序执行记录
	 * 
	 * @param 工序执行记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProdTaskProcExelog(
		@WebParam(name="prodTaskProcExelog")WOMProdTaskProcExelog prodTaskProcExelog,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(prodTaskProcExelog == null){
				return set500Error(result, "工序执行记录对象不能为空。");
			}
			if(prodTaskProcExelog.getId() != null){
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
				checkProdTaskProcExelogData(prodTaskProcExelog);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			WOMProduceTask tempProduceTask = prodTaskProcExelog.getTaskID();
			if (tempProduceTask == null) {
				return set500Error(result, "生产指令单对象不能为空");
			}
			
			WOMProduceTask produceTask = null;
			if(tempProduceTask.getId()!= null){
				produceTask = produceTaskService.getProduceTask(tempProduceTask.getId());
			}else if(tempProduceTask.getTableNo() != null){
				produceTask = produceTaskService.loadProduceTaskByBussinessKey(tempProduceTask.getTableNo());
			}else{
				return set500Error(result, "生产指令单对象必须设置id或业务主键。");
			}
			
			if(produceTask == null){
				return set404Error(result);
			}
			prodTaskProcExelog.setTableInfoId(produceTask.getTableInfoId());
			prodTaskProcExelog.setTaskID(produceTask);
			
			prodTaskProcExelogService.saveProdTaskProcExelog(prodTaskProcExelog, null);
			Long prodTaskProcExelogId = prodTaskProcExelog.getId();
			setSuccessResult(result, prodTaskProcExelogId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序执行记录id 删除工序执行记录
	 * 
	 * @param 工序执行记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProdTaskProcExelog(
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
			
			WOMProdTaskProcExelog prodTaskProcExelog = null;
			try{
				prodTaskProcExelog = prodTaskProcExelogService.getProdTaskProcExelog(id);
			}catch(NullPointerException e){}
			if(prodTaskProcExelog == null  || !prodTaskProcExelog.isValid()){
				return set404Error(result);
			}
			prodTaskProcExelogService.deleteProdTaskProcExelog(prodTaskProcExelog);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改工序执行记录数据，工序执行记录id不能为空
	 *
	 * @param 工序执行记录列表，每个工序执行记录必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProdTaskProcExelog(
		@WebParam(name="prodTaskProcExelogList")List<WOMProdTaskProcExelog> prodTaskProcExelogList,
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
			for(WOMProdTaskProcExelog prodTaskProcExelog : prodTaskProcExelogList){
				try{
					if(!beforeUpdateProdTaskProcExelog(prodTaskProcExelog)){
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
			
			prodTaskProcExelogService.batchImportBaseProdTaskProcExelog(prodTaskProcExelogList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增工序执行记录数据
	 * 
	 * @param 工序执行记录列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProdTaskProcExelog(
		@WebParam(name="prodTaskProcExelogList")List<WOMProdTaskProcExelog> prodTaskProcExelogList,
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
			
			if(prodTaskProcExelogList == null){
				set500Error(result, "prodTaskProcExelogList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMProdTaskProcExelog prodTaskProcExelog : prodTaskProcExelogList){
				if(prodTaskProcExelog.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(prodTaskProcExelog.getTaskID() == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不能为空。");
						return result;
					}
					WOMProduceTask produceTask = getProduceTask(prodTaskProcExelog.getTaskID());
					if(produceTask == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不存在。");
						return result;
					}
					prodTaskProcExelog.setTableInfoId(produceTask.getTableInfoId());
					prodTaskProcExelog.setTaskID(produceTask);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkProdTaskProcExelogData(prodTaskProcExelog);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			prodTaskProcExelogService.batchImportBaseProdTaskProcExelog(prodTaskProcExelogList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMProdTaskProcExelog prodTaskProcExelog : prodTaskProcExelogList){
				idList.add(prodTaskProcExelog.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序执行记录id，批量删除工序执行记录数据
	 * 
	 * @param 工序执行记录id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProdTaskProcExelog(
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
			
			List<WOMProdTaskProcExelog> prodTaskProcExelogList = new ArrayList<WOMProdTaskProcExelog>();
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
				
				WOMProdTaskProcExelog prodTaskProcExelog = prodTaskProcExelogService.getProdTaskProcExelog(id);
				if(prodTaskProcExelog == null || !prodTaskProcExelog.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				prodTaskProcExelogList.add(prodTaskProcExelog);
				
				count ++;
			}
			for(WOMProdTaskProcExelog prodTaskProcExelog : prodTaskProcExelogList){
				prodTaskProcExelogService.deleteProdTaskProcExelog(prodTaskProcExelog);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有工序执行记录数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdTaskProcExelogPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskProcExelog.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMProdTaskProcExelog.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProdTaskProcExelog.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProdTaskProcExelog.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProdTaskProcExelog.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMProdTaskProcExelog> page = new Page<WOMProdTaskProcExelog>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProdTaskProcExelog> datas = prodTaskProcExelogService.getByPage(page, detachedCriteria);
			List<WOMProdTaskProcExelog> prodTaskProcExelogList = datas.getResult();
			if (prodTaskProcExelogList == null || prodTaskProcExelogList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodTaskProcExelogList.toArray());
			PaginationDTO<WOMProdTaskProcExelog> pagination = new PaginationDTO<WOMProdTaskProcExelog>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到工序执行记录则返回空。
	 * @param prodTaskProcExelog
	 * @return
	 */
	private WOMProdTaskProcExelog getProdTaskProcExelog(WOMProdTaskProcExelog prodTaskProcExelog) {
		if (prodTaskProcExelog.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMProdTaskProcExelog result = prodTaskProcExelogService.getProdTaskProcExelog(prodTaskProcExelog.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果工序执行记录不存在，返回false；如果原来没有生产指令单对象，且修改的时候也没有配置生产指令单对象，则报错；如果配置的生产指令单对象不存在，则报错；
	 * @param prodTaskProcExelog
	 * @return 
	 */
	private boolean beforeUpdateProdTaskProcExelog(WOMProdTaskProcExelog prodTaskProcExelog){
		if(prodTaskProcExelog.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMProdTaskProcExelog temp = getProdTaskProcExelog(prodTaskProcExelog);
		if(temp == null){
			return false;
		}
		WOMProduceTask produceTask = null;
		if (temp.getTaskID() == null) {
			if (prodTaskProcExelog.getTaskID() == null || (prodTaskProcExelog.getTaskID().getId() == null && prodTaskProcExelog.getTaskID().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				produceTask = getProduceTask(prodTaskProcExelog.getTaskID());
				if(produceTask == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (prodTaskProcExelog.getTaskID() == null || (prodTaskProcExelog.getTaskID().getId() == null && prodTaskProcExelog.getTaskID().getTableNo() == null)) {
				produceTask = temp.getTaskID();
			} else {
				produceTask = getProduceTask(prodTaskProcExelog.getTaskID());
				if (produceTask == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		prodTaskProcExelog.setTableInfoId(produceTask.getTableInfoId());
		
		prodTaskProcExelog.setTaskID(produceTask);
		prodTaskProcExelog.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMProdTaskProcExelog> clearProdTaskProcExelogNonMainField(List<WOMProdTaskProcExelog> list){
		 List<WOMProdTaskProcExelog> prodTaskProcExelogList = new ArrayList<WOMProdTaskProcExelog>();
		 for(WOMProdTaskProcExelog prodTaskProcExelog:list){
			 WOMProdTaskProcExelog temp = new WOMProdTaskProcExelog();
			 temp.setId(prodTaskProcExelog.getId());
		 	 prodTaskProcExelogList.add(temp);
		 }
		 return prodTaskProcExelogList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProdTaskProcExelogData(WOMProdTaskProcExelog prodTaskProcExelog){
	}
	 
	//------------------------------------辅模型 WS  用料汇总-------------------------------------------------
	//--hasLink:true---link:HeadId
	/**
	 * 根据用料汇总业务主键分页查询用料汇总数据
	 * 
	 * @param 用料汇总业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceMaterialSumPageByProduceTaskBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMProduceMaterialSum.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProduceMaterialSum.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			WOMProduceTask produceTask = produceTaskService.loadProduceTaskByBussinessKey(businessKey);
			if (produceTask == null) {
				return set500Error(result, "该业务主键的生产指令单不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("headId",produceTask));
			Page<WOMProduceMaterialSum> page = new Page<WOMProduceMaterialSum>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProduceMaterialSum> datas = produceMaterialSumService.getByPage(page, detachedCriteria);
			List<WOMProduceMaterialSum> produceMaterialSumList = datas.getResult();
			if (produceMaterialSumList == null || produceMaterialSumList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(produceMaterialSumList.toArray());
			PaginationDTO<WOMProduceMaterialSum> pagination = new PaginationDTO<WOMProduceMaterialSum>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据用料汇总id分页查询用料汇总数据
	 * 
	 * @param 用料汇总id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceMaterialSumPageByProduceTaskPk(	
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), WOMProduceMaterialSum.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProduceMaterialSum.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			WOMProduceTask produceTask = produceTaskService.getProduceTask(id);
			if (produceTask == null) {
				return set500Error(result, "该主键的生产指令单不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("headId",produceTask));
			Page<WOMProduceMaterialSum> page = new Page<WOMProduceMaterialSum>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProduceMaterialSum> datas = produceMaterialSumService.getByPage(page, detachedCriteria);
			List<WOMProduceMaterialSum> produceMaterialSumList = datas.getResult();
			if (produceMaterialSumList == null || produceMaterialSumList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(produceMaterialSumList.toArray());
			PaginationDTO<WOMProduceMaterialSum> pagination = new PaginationDTO<WOMProduceMaterialSum>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据用料汇总id分获取用料汇总数据
	 * 
	 * @param 用料汇总id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceMaterialSum(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMProduceMaterialSum produceMaterialSum = produceMaterialSumService.getProduceMaterialSum(id);
			if(produceMaterialSum == null){
				return set404Error(result);
			}
			setSuccessResult(result, produceMaterialSum);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据用料汇总业务id修改用料汇总数据
	 * 
	 * @param 用料汇总对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProduceMaterialSum(
		@WebParam(name="produceMaterialSum")WOMProduceMaterialSum produceMaterialSum,
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
			if(!beforeUpdateProduceMaterialSum(produceMaterialSum)){
				return set404Error(result);
			}
			produceMaterialSumService.saveProduceMaterialSum(produceMaterialSum, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增用料汇总
	 * 
	 * @param 用料汇总对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProduceMaterialSum(
		@WebParam(name="produceMaterialSum")WOMProduceMaterialSum produceMaterialSum,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(produceMaterialSum == null){
				return set500Error(result, "用料汇总对象不能为空。");
			}
			if(produceMaterialSum.getId() != null){
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
				checkProduceMaterialSumData(produceMaterialSum);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			WOMProduceTask tempProduceTask = produceMaterialSum.getHeadId();
			if (tempProduceTask == null) {
				return set500Error(result, "生产指令单对象不能为空");
			}
			
			WOMProduceTask produceTask = null;
			if(tempProduceTask.getId()!= null){
				produceTask = produceTaskService.getProduceTask(tempProduceTask.getId());
			}else if(tempProduceTask.getTableNo() != null){
				produceTask = produceTaskService.loadProduceTaskByBussinessKey(tempProduceTask.getTableNo());
			}else{
				return set500Error(result, "生产指令单对象必须设置id或业务主键。");
			}
			
			if(produceTask == null){
				return set404Error(result);
			}
			produceMaterialSum.setTableInfoId(produceTask.getTableInfoId());
			produceMaterialSum.setHeadId(produceTask);
			
			produceMaterialSumService.saveProduceMaterialSum(produceMaterialSum, null);
			Long produceMaterialSumId = produceMaterialSum.getId();
			setSuccessResult(result, produceMaterialSumId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据用料汇总id 删除用料汇总
	 * 
	 * @param 用料汇总id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProduceMaterialSum(
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
			
			WOMProduceMaterialSum produceMaterialSum = null;
			try{
				produceMaterialSum = produceMaterialSumService.getProduceMaterialSum(id);
			}catch(NullPointerException e){}
			if(produceMaterialSum == null  || !produceMaterialSum.isValid()){
				return set404Error(result);
			}
			produceMaterialSumService.deleteProduceMaterialSum(produceMaterialSum);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改用料汇总数据，用料汇总id不能为空
	 *
	 * @param 用料汇总列表，每个用料汇总必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProduceMaterialSum(
		@WebParam(name="produceMaterialSumList")List<WOMProduceMaterialSum> produceMaterialSumList,
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
			for(WOMProduceMaterialSum produceMaterialSum : produceMaterialSumList){
				try{
					if(!beforeUpdateProduceMaterialSum(produceMaterialSum)){
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
			
			produceMaterialSumService.batchImportBaseProduceMaterialSum(produceMaterialSumList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增用料汇总数据
	 * 
	 * @param 用料汇总列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProduceMaterialSum(
		@WebParam(name="produceMaterialSumList")List<WOMProduceMaterialSum> produceMaterialSumList,
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
			
			if(produceMaterialSumList == null){
				set500Error(result, "produceMaterialSumList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMProduceMaterialSum produceMaterialSum : produceMaterialSumList){
				if(produceMaterialSum.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(produceMaterialSum.getHeadId() == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不能为空。");
						return result;
					}
					WOMProduceTask produceTask = getProduceTask(produceMaterialSum.getHeadId());
					if(produceTask == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不存在。");
						return result;
					}
					produceMaterialSum.setTableInfoId(produceTask.getTableInfoId());
					produceMaterialSum.setHeadId(produceTask);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkProduceMaterialSumData(produceMaterialSum);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			produceMaterialSumService.batchImportBaseProduceMaterialSum(produceMaterialSumList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMProduceMaterialSum produceMaterialSum : produceMaterialSumList){
				idList.add(produceMaterialSum.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据用料汇总id，批量删除用料汇总数据
	 * 
	 * @param 用料汇总id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProduceMaterialSum(
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
			
			List<WOMProduceMaterialSum> produceMaterialSumList = new ArrayList<WOMProduceMaterialSum>();
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
				
				WOMProduceMaterialSum produceMaterialSum = produceMaterialSumService.getProduceMaterialSum(id);
				if(produceMaterialSum == null || !produceMaterialSum.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				produceMaterialSumList.add(produceMaterialSum);
				
				count ++;
			}
			for(WOMProduceMaterialSum produceMaterialSum : produceMaterialSumList){
				produceMaterialSumService.deleteProduceMaterialSum(produceMaterialSum);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有用料汇总数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceMaterialSumPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMProduceMaterialSum.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProduceMaterialSum.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceMaterialSum.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMProduceMaterialSum> page = new Page<WOMProduceMaterialSum>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProduceMaterialSum> datas = produceMaterialSumService.getByPage(page, detachedCriteria);
			List<WOMProduceMaterialSum> produceMaterialSumList = datas.getResult();
			if (produceMaterialSumList == null || produceMaterialSumList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(produceMaterialSumList.toArray());
			PaginationDTO<WOMProduceMaterialSum> pagination = new PaginationDTO<WOMProduceMaterialSum>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到用料汇总则返回空。
	 * @param produceMaterialSum
	 * @return
	 */
	private WOMProduceMaterialSum getProduceMaterialSum(WOMProduceMaterialSum produceMaterialSum) {
		if (produceMaterialSum.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMProduceMaterialSum result = produceMaterialSumService.getProduceMaterialSum(produceMaterialSum.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果用料汇总不存在，返回false；如果原来没有生产指令单对象，且修改的时候也没有配置生产指令单对象，则报错；如果配置的生产指令单对象不存在，则报错；
	 * @param produceMaterialSum
	 * @return 
	 */
	private boolean beforeUpdateProduceMaterialSum(WOMProduceMaterialSum produceMaterialSum){
		if(produceMaterialSum.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMProduceMaterialSum temp = getProduceMaterialSum(produceMaterialSum);
		if(temp == null){
			return false;
		}
		WOMProduceTask produceTask = null;
		if (temp.getHeadId() == null) {
			if (produceMaterialSum.getHeadId() == null || (produceMaterialSum.getHeadId().getId() == null && produceMaterialSum.getHeadId().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				produceTask = getProduceTask(produceMaterialSum.getHeadId());
				if(produceTask == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (produceMaterialSum.getHeadId() == null || (produceMaterialSum.getHeadId().getId() == null && produceMaterialSum.getHeadId().getTableNo() == null)) {
				produceTask = temp.getHeadId();
			} else {
				produceTask = getProduceTask(produceMaterialSum.getHeadId());
				if (produceTask == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		produceMaterialSum.setTableInfoId(produceTask.getTableInfoId());
		
		produceMaterialSum.setHeadId(produceTask);
		produceMaterialSum.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMProduceMaterialSum> clearProduceMaterialSumNonMainField(List<WOMProduceMaterialSum> list){
		 List<WOMProduceMaterialSum> produceMaterialSumList = new ArrayList<WOMProduceMaterialSum>();
		 for(WOMProduceMaterialSum produceMaterialSum:list){
			 WOMProduceMaterialSum temp = new WOMProduceMaterialSum();
			 temp.setId(produceMaterialSum.getId());
		 	 produceMaterialSumList.add(temp);
		 }
		 return produceMaterialSumList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProduceMaterialSumData(WOMProduceMaterialSum produceMaterialSum){
	}
	 
	//------------------------------------辅模型 WS  用料活动-------------------------------------------------
	//--hasLink:true---link:HeadID
	/**
	 * 根据用料活动业务主键分页查询用料活动数据
	 * 
	 * @param 用料活动业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskActivePageByProduceTaskBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMProduceTaskActive.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProduceTaskActive.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			WOMProduceTask produceTask = produceTaskService.loadProduceTaskByBussinessKey(businessKey);
			if (produceTask == null) {
				return set500Error(result, "该业务主键的生产指令单不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("headID",produceTask));
			Page<WOMProduceTaskActive> page = new Page<WOMProduceTaskActive>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProduceTaskActive> datas = produceTaskActiveService.getByPage(page, detachedCriteria);
			List<WOMProduceTaskActive> produceTaskActiveList = datas.getResult();
			if (produceTaskActiveList == null || produceTaskActiveList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(produceTaskActiveList.toArray());
			PaginationDTO<WOMProduceTaskActive> pagination = new PaginationDTO<WOMProduceTaskActive>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据用料活动id分页查询用料活动数据
	 * 
	 * @param 用料活动id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskActivePageByProduceTaskPk(	
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), WOMProduceTaskActive.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProduceTaskActive.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			WOMProduceTask produceTask = produceTaskService.getProduceTask(id);
			if (produceTask == null) {
				return set500Error(result, "该主键的生产指令单不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("headID",produceTask));
			Page<WOMProduceTaskActive> page = new Page<WOMProduceTaskActive>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProduceTaskActive> datas = produceTaskActiveService.getByPage(page, detachedCriteria);
			List<WOMProduceTaskActive> produceTaskActiveList = datas.getResult();
			if (produceTaskActiveList == null || produceTaskActiveList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(produceTaskActiveList.toArray());
			PaginationDTO<WOMProduceTaskActive> pagination = new PaginationDTO<WOMProduceTaskActive>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据用料活动id分获取用料活动数据
	 * 
	 * @param 用料活动id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskActive(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMProduceTaskActive produceTaskActive = produceTaskActiveService.getProduceTaskActive(id);
			if(produceTaskActive == null){
				return set404Error(result);
			}
			setSuccessResult(result, produceTaskActive);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据用料活动业务id修改用料活动数据
	 * 
	 * @param 用料活动对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProduceTaskActive(
		@WebParam(name="produceTaskActive")WOMProduceTaskActive produceTaskActive,
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
			if(!beforeUpdateProduceTaskActive(produceTaskActive)){
				return set404Error(result);
			}
			produceTaskActiveService.saveProduceTaskActive(produceTaskActive, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增用料活动
	 * 
	 * @param 用料活动对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProduceTaskActive(
		@WebParam(name="produceTaskActive")WOMProduceTaskActive produceTaskActive,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(produceTaskActive == null){
				return set500Error(result, "用料活动对象不能为空。");
			}
			if(produceTaskActive.getId() != null){
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
				checkProduceTaskActiveData(produceTaskActive);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			WOMProduceTask tempProduceTask = produceTaskActive.getHeadID();
			if (tempProduceTask == null) {
				return set500Error(result, "生产指令单对象不能为空");
			}
			
			WOMProduceTask produceTask = null;
			if(tempProduceTask.getId()!= null){
				produceTask = produceTaskService.getProduceTask(tempProduceTask.getId());
			}else if(tempProduceTask.getTableNo() != null){
				produceTask = produceTaskService.loadProduceTaskByBussinessKey(tempProduceTask.getTableNo());
			}else{
				return set500Error(result, "生产指令单对象必须设置id或业务主键。");
			}
			
			if(produceTask == null){
				return set404Error(result);
			}
			produceTaskActive.setTableInfoId(produceTask.getTableInfoId());
			produceTaskActive.setHeadID(produceTask);
			
			produceTaskActiveService.saveProduceTaskActive(produceTaskActive, null);
			Long produceTaskActiveId = produceTaskActive.getId();
			setSuccessResult(result, produceTaskActiveId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据用料活动id 删除用料活动
	 * 
	 * @param 用料活动id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskActive(
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
			
			WOMProduceTaskActive produceTaskActive = null;
			try{
				produceTaskActive = produceTaskActiveService.getProduceTaskActive(id);
			}catch(NullPointerException e){}
			if(produceTaskActive == null  || !produceTaskActive.isValid()){
				return set404Error(result);
			}
			produceTaskActiveService.deleteProduceTaskActive(produceTaskActive);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改用料活动数据，用料活动id不能为空
	 *
	 * @param 用料活动列表，每个用料活动必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProduceTaskActive(
		@WebParam(name="produceTaskActiveList")List<WOMProduceTaskActive> produceTaskActiveList,
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
			for(WOMProduceTaskActive produceTaskActive : produceTaskActiveList){
				try{
					if(!beforeUpdateProduceTaskActive(produceTaskActive)){
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
			
			produceTaskActiveService.batchImportBaseProduceTaskActive(produceTaskActiveList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增用料活动数据
	 * 
	 * @param 用料活动列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProduceTaskActive(
		@WebParam(name="produceTaskActiveList")List<WOMProduceTaskActive> produceTaskActiveList,
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
			
			if(produceTaskActiveList == null){
				set500Error(result, "produceTaskActiveList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMProduceTaskActive produceTaskActive : produceTaskActiveList){
				if(produceTaskActive.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(produceTaskActive.getHeadID() == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不能为空。");
						return result;
					}
					WOMProduceTask produceTask = getProduceTask(produceTaskActive.getHeadID());
					if(produceTask == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不存在。");
						return result;
					}
					produceTaskActive.setTableInfoId(produceTask.getTableInfoId());
					produceTaskActive.setHeadID(produceTask);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkProduceTaskActiveData(produceTaskActive);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			produceTaskActiveService.batchImportBaseProduceTaskActive(produceTaskActiveList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMProduceTaskActive produceTaskActive : produceTaskActiveList){
				idList.add(produceTaskActive.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据用料活动id，批量删除用料活动数据
	 * 
	 * @param 用料活动id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProduceTaskActive(
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
			
			List<WOMProduceTaskActive> produceTaskActiveList = new ArrayList<WOMProduceTaskActive>();
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
				
				WOMProduceTaskActive produceTaskActive = produceTaskActiveService.getProduceTaskActive(id);
				if(produceTaskActive == null || !produceTaskActive.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				produceTaskActiveList.add(produceTaskActive);
				
				count ++;
			}
			for(WOMProduceTaskActive produceTaskActive : produceTaskActiveList){
				produceTaskActiveService.deleteProduceTaskActive(produceTaskActive);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有用料活动数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskActivePage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMProduceTaskActive.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProduceTaskActive.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskActive.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMProduceTaskActive> page = new Page<WOMProduceTaskActive>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProduceTaskActive> datas = produceTaskActiveService.getByPage(page, detachedCriteria);
			List<WOMProduceTaskActive> produceTaskActiveList = datas.getResult();
			if (produceTaskActiveList == null || produceTaskActiveList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(produceTaskActiveList.toArray());
			PaginationDTO<WOMProduceTaskActive> pagination = new PaginationDTO<WOMProduceTaskActive>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到用料活动则返回空。
	 * @param produceTaskActive
	 * @return
	 */
	private WOMProduceTaskActive getProduceTaskActive(WOMProduceTaskActive produceTaskActive) {
		if (produceTaskActive.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMProduceTaskActive result = produceTaskActiveService.getProduceTaskActive(produceTaskActive.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果用料活动不存在，返回false；如果原来没有生产指令单对象，且修改的时候也没有配置生产指令单对象，则报错；如果配置的生产指令单对象不存在，则报错；
	 * @param produceTaskActive
	 * @return 
	 */
	private boolean beforeUpdateProduceTaskActive(WOMProduceTaskActive produceTaskActive){
		if(produceTaskActive.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMProduceTaskActive temp = getProduceTaskActive(produceTaskActive);
		if(temp == null){
			return false;
		}
		WOMProduceTask produceTask = null;
		if (temp.getHeadID() == null) {
			if (produceTaskActive.getHeadID() == null || (produceTaskActive.getHeadID().getId() == null && produceTaskActive.getHeadID().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				produceTask = getProduceTask(produceTaskActive.getHeadID());
				if(produceTask == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (produceTaskActive.getHeadID() == null || (produceTaskActive.getHeadID().getId() == null && produceTaskActive.getHeadID().getTableNo() == null)) {
				produceTask = temp.getHeadID();
			} else {
				produceTask = getProduceTask(produceTaskActive.getHeadID());
				if (produceTask == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		produceTaskActive.setTableInfoId(produceTask.getTableInfoId());
		
		produceTaskActive.setHeadID(produceTask);
		produceTaskActive.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMProduceTaskActive> clearProduceTaskActiveNonMainField(List<WOMProduceTaskActive> list){
		 List<WOMProduceTaskActive> produceTaskActiveList = new ArrayList<WOMProduceTaskActive>();
		 for(WOMProduceTaskActive produceTaskActive:list){
			 WOMProduceTaskActive temp = new WOMProduceTaskActive();
			 temp.setId(produceTaskActive.getId());
		 	 produceTaskActiveList.add(temp);
		 }
		 return produceTaskActiveList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProduceTaskActiveData(WOMProduceTaskActive produceTaskActive){
	}
	 
	//------------------------------------辅模型 WS  指令单工序-------------------------------------------------
	//--hasLink:true---link:HeadId
	/**
	 * 根据指令单工序业务主键分页查询指令单工序数据
	 * 
	 * @param 指令单工序业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskProcessPageByProduceTaskBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMProduceTaskProcess.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProduceTaskProcess.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			WOMProduceTask produceTask = produceTaskService.loadProduceTaskByBussinessKey(businessKey);
			if (produceTask == null) {
				return set500Error(result, "该业务主键的生产指令单不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("headId",produceTask));
			Page<WOMProduceTaskProcess> page = new Page<WOMProduceTaskProcess>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProduceTaskProcess> datas = produceTaskProcessService.getByPage(page, detachedCriteria);
			List<WOMProduceTaskProcess> produceTaskProcessList = datas.getResult();
			if (produceTaskProcessList == null || produceTaskProcessList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(produceTaskProcessList.toArray());
			PaginationDTO<WOMProduceTaskProcess> pagination = new PaginationDTO<WOMProduceTaskProcess>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据指令单工序id分页查询指令单工序数据
	 * 
	 * @param 指令单工序id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskProcessPageByProduceTaskPk(	
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), WOMProduceTaskProcess.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProduceTaskProcess.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			WOMProduceTask produceTask = produceTaskService.getProduceTask(id);
			if (produceTask == null) {
				return set500Error(result, "该主键的生产指令单不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("headId",produceTask));
			Page<WOMProduceTaskProcess> page = new Page<WOMProduceTaskProcess>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProduceTaskProcess> datas = produceTaskProcessService.getByPage(page, detachedCriteria);
			List<WOMProduceTaskProcess> produceTaskProcessList = datas.getResult();
			if (produceTaskProcessList == null || produceTaskProcessList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(produceTaskProcessList.toArray());
			PaginationDTO<WOMProduceTaskProcess> pagination = new PaginationDTO<WOMProduceTaskProcess>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据指令单工序id分获取指令单工序数据
	 * 
	 * @param 指令单工序id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskProcess(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMProduceTaskProcess produceTaskProcess = produceTaskProcessService.getProduceTaskProcess(id);
			if(produceTaskProcess == null){
				return set404Error(result);
			}
			setSuccessResult(result, produceTaskProcess);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据指令单工序业务id修改指令单工序数据
	 * 
	 * @param 指令单工序对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProduceTaskProcess(
		@WebParam(name="produceTaskProcess")WOMProduceTaskProcess produceTaskProcess,
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
			if(!beforeUpdateProduceTaskProcess(produceTaskProcess)){
				return set404Error(result);
			}
			produceTaskProcessService.saveProduceTaskProcess(produceTaskProcess, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增指令单工序
	 * 
	 * @param 指令单工序对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProduceTaskProcess(
		@WebParam(name="produceTaskProcess")WOMProduceTaskProcess produceTaskProcess,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(produceTaskProcess == null){
				return set500Error(result, "指令单工序对象不能为空。");
			}
			if(produceTaskProcess.getId() != null){
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
				checkProduceTaskProcessData(produceTaskProcess);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			WOMProduceTask tempProduceTask = produceTaskProcess.getHeadId();
			if (tempProduceTask == null) {
				return set500Error(result, "生产指令单对象不能为空");
			}
			
			WOMProduceTask produceTask = null;
			if(tempProduceTask.getId()!= null){
				produceTask = produceTaskService.getProduceTask(tempProduceTask.getId());
			}else if(tempProduceTask.getTableNo() != null){
				produceTask = produceTaskService.loadProduceTaskByBussinessKey(tempProduceTask.getTableNo());
			}else{
				return set500Error(result, "生产指令单对象必须设置id或业务主键。");
			}
			
			if(produceTask == null){
				return set404Error(result);
			}
			produceTaskProcess.setTableInfoId(produceTask.getTableInfoId());
			produceTaskProcess.setHeadId(produceTask);
			
			produceTaskProcessService.saveProduceTaskProcess(produceTaskProcess, null);
			Long produceTaskProcessId = produceTaskProcess.getId();
			setSuccessResult(result, produceTaskProcessId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据指令单工序id 删除指令单工序
	 * 
	 * @param 指令单工序id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskProcess(
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
			
			WOMProduceTaskProcess produceTaskProcess = null;
			try{
				produceTaskProcess = produceTaskProcessService.getProduceTaskProcess(id);
			}catch(NullPointerException e){}
			if(produceTaskProcess == null  || !produceTaskProcess.isValid()){
				return set404Error(result);
			}
			produceTaskProcessService.deleteProduceTaskProcess(produceTaskProcess);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改指令单工序数据，指令单工序id不能为空
	 *
	 * @param 指令单工序列表，每个指令单工序必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProduceTaskProcess(
		@WebParam(name="produceTaskProcessList")List<WOMProduceTaskProcess> produceTaskProcessList,
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
			for(WOMProduceTaskProcess produceTaskProcess : produceTaskProcessList){
				try{
					if(!beforeUpdateProduceTaskProcess(produceTaskProcess)){
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
			
			produceTaskProcessService.batchImportBaseProduceTaskProcess(produceTaskProcessList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增指令单工序数据
	 * 
	 * @param 指令单工序列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProduceTaskProcess(
		@WebParam(name="produceTaskProcessList")List<WOMProduceTaskProcess> produceTaskProcessList,
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
			
			if(produceTaskProcessList == null){
				set500Error(result, "produceTaskProcessList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMProduceTaskProcess produceTaskProcess : produceTaskProcessList){
				if(produceTaskProcess.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(produceTaskProcess.getHeadId() == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不能为空。");
						return result;
					}
					WOMProduceTask produceTask = getProduceTask(produceTaskProcess.getHeadId());
					if(produceTask == null){
						set500Error(result, "第"+count+"条数据出错：生产指令单对象不存在。");
						return result;
					}
					produceTaskProcess.setTableInfoId(produceTask.getTableInfoId());
					produceTaskProcess.setHeadId(produceTask);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkProduceTaskProcessData(produceTaskProcess);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			produceTaskProcessService.batchImportBaseProduceTaskProcess(produceTaskProcessList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMProduceTaskProcess produceTaskProcess : produceTaskProcessList){
				idList.add(produceTaskProcess.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据指令单工序id，批量删除指令单工序数据
	 * 
	 * @param 指令单工序id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProduceTaskProcess(
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
			
			List<WOMProduceTaskProcess> produceTaskProcessList = new ArrayList<WOMProduceTaskProcess>();
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
				
				WOMProduceTaskProcess produceTaskProcess = produceTaskProcessService.getProduceTaskProcess(id);
				if(produceTaskProcess == null || !produceTaskProcess.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				produceTaskProcessList.add(produceTaskProcess);
				
				count ++;
			}
			for(WOMProduceTaskProcess produceTaskProcess : produceTaskProcessList){
				produceTaskProcessService.deleteProduceTaskProcess(produceTaskProcess);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有指令单工序数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskProcessPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMProduceTaskProcess.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProduceTaskProcess.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskProcess.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMProduceTaskProcess> page = new Page<WOMProduceTaskProcess>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProduceTaskProcess> datas = produceTaskProcessService.getByPage(page, detachedCriteria);
			List<WOMProduceTaskProcess> produceTaskProcessList = datas.getResult();
			if (produceTaskProcessList == null || produceTaskProcessList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(produceTaskProcessList.toArray());
			PaginationDTO<WOMProduceTaskProcess> pagination = new PaginationDTO<WOMProduceTaskProcess>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到指令单工序则返回空。
	 * @param produceTaskProcess
	 * @return
	 */
	private WOMProduceTaskProcess getProduceTaskProcess(WOMProduceTaskProcess produceTaskProcess) {
		if (produceTaskProcess.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMProduceTaskProcess result = produceTaskProcessService.getProduceTaskProcess(produceTaskProcess.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果指令单工序不存在，返回false；如果原来没有生产指令单对象，且修改的时候也没有配置生产指令单对象，则报错；如果配置的生产指令单对象不存在，则报错；
	 * @param produceTaskProcess
	 * @return 
	 */
	private boolean beforeUpdateProduceTaskProcess(WOMProduceTaskProcess produceTaskProcess){
		if(produceTaskProcess.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMProduceTaskProcess temp = getProduceTaskProcess(produceTaskProcess);
		if(temp == null){
			return false;
		}
		WOMProduceTask produceTask = null;
		if (temp.getHeadId() == null) {
			if (produceTaskProcess.getHeadId() == null || (produceTaskProcess.getHeadId().getId() == null && produceTaskProcess.getHeadId().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				produceTask = getProduceTask(produceTaskProcess.getHeadId());
				if(produceTask == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (produceTaskProcess.getHeadId() == null || (produceTaskProcess.getHeadId().getId() == null && produceTaskProcess.getHeadId().getTableNo() == null)) {
				produceTask = temp.getHeadId();
			} else {
				produceTask = getProduceTask(produceTaskProcess.getHeadId());
				if (produceTask == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		produceTaskProcess.setTableInfoId(produceTask.getTableInfoId());
		
		produceTaskProcess.setHeadId(produceTask);
		produceTaskProcess.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMProduceTaskProcess> clearProduceTaskProcessNonMainField(List<WOMProduceTaskProcess> list){
		 List<WOMProduceTaskProcess> produceTaskProcessList = new ArrayList<WOMProduceTaskProcess>();
		 for(WOMProduceTaskProcess produceTaskProcess:list){
			 WOMProduceTaskProcess temp = new WOMProduceTaskProcess();
			 temp.setId(produceTaskProcess.getId());
		 	 produceTaskProcessList.add(temp);
		 }
		 return produceTaskProcessList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProduceTaskProcessData(WOMProduceTaskProcess produceTaskProcess){
	}
	 
	//------------------------------------辅模型 WS  待投料记录-------------------------------------------------
	//--hasLink:false---link:HeadId
	/**
	 * 根据待投料记录业务主键分页查询待投料记录数据
	 * 
	 * @param 待投料记录业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getWaitPutinRecordsPageByProduceTaskBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "待投料记录跟生产指令单没有设置关联！");
	}
	/**
	 * 根据待投料记录id分页查询待投料记录数据
	 * 
	 * @param 待投料记录id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getWaitPutinRecordsPageByProduceTaskPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "待投料记录跟生产指令单没有设置关联！");
	}
	/**
	 * 根据待投料记录id分获取待投料记录数据
	 * 
	 * @param 待投料记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getWaitPutinRecords(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMWaitPutinRecords waitPutinRecords = waitPutinRecordsService.getWaitPutinRecords(id);
			if(waitPutinRecords == null){
				return set404Error(result);
			}
			setSuccessResult(result, waitPutinRecords);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据待投料记录业务id修改待投料记录数据
	 * 
	 * @param 待投料记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateWaitPutinRecords(
		@WebParam(name="waitPutinRecords")WOMWaitPutinRecords waitPutinRecords,
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
			if(!beforeUpdateWaitPutinRecords(waitPutinRecords)){
				return set404Error(result);
			}
			waitPutinRecordsService.saveWaitPutinRecords(waitPutinRecords, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增待投料记录
	 * 
	 * @param 待投料记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addWaitPutinRecords(
		@WebParam(name="waitPutinRecords")WOMWaitPutinRecords waitPutinRecords,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(waitPutinRecords == null){
				return set500Error(result, "待投料记录对象不能为空。");
			}
			if(waitPutinRecords.getId() != null){
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
				checkWaitPutinRecordsData(waitPutinRecords);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			waitPutinRecordsService.saveWaitPutinRecords(waitPutinRecords, null);
			Long waitPutinRecordsId = waitPutinRecords.getId();
			setSuccessResult(result, waitPutinRecordsId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据待投料记录id 删除待投料记录
	 * 
	 * @param 待投料记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteWaitPutinRecords(
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
			
			WOMWaitPutinRecords waitPutinRecords = null;
			try{
				waitPutinRecords = waitPutinRecordsService.getWaitPutinRecords(id);
			}catch(NullPointerException e){}
			if(waitPutinRecords == null  || !waitPutinRecords.isValid()){
				return set404Error(result);
			}
			waitPutinRecordsService.deleteWaitPutinRecords(waitPutinRecords);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改待投料记录数据，待投料记录id不能为空
	 *
	 * @param 待投料记录列表，每个待投料记录必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateWaitPutinRecords(
		@WebParam(name="waitPutinRecordsList")List<WOMWaitPutinRecords> waitPutinRecordsList,
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
			for(WOMWaitPutinRecords waitPutinRecords : waitPutinRecordsList){
				try{
					if(!beforeUpdateWaitPutinRecords(waitPutinRecords)){
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
			
			waitPutinRecordsService.batchImportBaseWaitPutinRecords(waitPutinRecordsList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增待投料记录数据
	 * 
	 * @param 待投料记录列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddWaitPutinRecords(
		@WebParam(name="waitPutinRecordsList")List<WOMWaitPutinRecords> waitPutinRecordsList,
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
			
			if(waitPutinRecordsList == null){
				set500Error(result, "waitPutinRecordsList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMWaitPutinRecords waitPutinRecords : waitPutinRecordsList){
				if(waitPutinRecords.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkWaitPutinRecordsData(waitPutinRecords);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			waitPutinRecordsService.batchImportBaseWaitPutinRecords(waitPutinRecordsList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMWaitPutinRecords waitPutinRecords : waitPutinRecordsList){
				idList.add(waitPutinRecords.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据待投料记录id，批量删除待投料记录数据
	 * 
	 * @param 待投料记录id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelWaitPutinRecords(
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
			
			List<WOMWaitPutinRecords> waitPutinRecordsList = new ArrayList<WOMWaitPutinRecords>();
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
				
				WOMWaitPutinRecords waitPutinRecords = waitPutinRecordsService.getWaitPutinRecords(id);
				if(waitPutinRecords == null || !waitPutinRecords.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				waitPutinRecordsList.add(waitPutinRecords);
				
				count ++;
			}
			for(WOMWaitPutinRecords waitPutinRecords : waitPutinRecordsList){
				waitPutinRecordsService.deleteWaitPutinRecords(waitPutinRecords);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有待投料记录数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getWaitPutinRecordsPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMWaitPutinRecords.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMWaitPutinRecords.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMWaitPutinRecords.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMWaitPutinRecords.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMWaitPutinRecords.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMWaitPutinRecords> page = new Page<WOMWaitPutinRecords>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMWaitPutinRecords> datas = waitPutinRecordsService.getByPage(page, detachedCriteria);
			List<WOMWaitPutinRecords> waitPutinRecordsList = datas.getResult();
			if (waitPutinRecordsList == null || waitPutinRecordsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(waitPutinRecordsList.toArray());
			PaginationDTO<WOMWaitPutinRecords> pagination = new PaginationDTO<WOMWaitPutinRecords>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到待投料记录则返回空。
	 * @param waitPutinRecords
	 * @return
	 */
	private WOMWaitPutinRecords getWaitPutinRecords(WOMWaitPutinRecords waitPutinRecords) {
		if (waitPutinRecords.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMWaitPutinRecords result = waitPutinRecordsService.getWaitPutinRecords(waitPutinRecords.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果待投料记录不存在，返回false；如果原来没有生产指令单对象，且修改的时候也没有配置生产指令单对象，则报错；如果配置的生产指令单对象不存在，则报错；
	 * @param waitPutinRecords
	 * @return 
	 */
	private boolean beforeUpdateWaitPutinRecords(WOMWaitPutinRecords waitPutinRecords){
		if(waitPutinRecords.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMWaitPutinRecords temp = getWaitPutinRecords(waitPutinRecords);
		if(temp == null){
			return false;
		}
		waitPutinRecords.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMWaitPutinRecords> clearWaitPutinRecordsNonMainField(List<WOMWaitPutinRecords> list){
		 List<WOMWaitPutinRecords> waitPutinRecordsList = new ArrayList<WOMWaitPutinRecords>();
		 for(WOMWaitPutinRecords waitPutinRecords:list){
			 WOMWaitPutinRecords temp = new WOMWaitPutinRecords();
			 temp.setId(waitPutinRecords.getId());
		 	 waitPutinRecordsList.add(temp);
		 }
		 return waitPutinRecordsList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkWaitPutinRecordsData(WOMWaitPutinRecords waitPutinRecords){
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
	 * 获取生产指令单对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param produceTask
	 * @return
	 */
	private WOMProduceTask getProduceTask(WOMProduceTask produceTask) {
		if (produceTask.getId() == null && (produceTask.getTableNo() == null || produceTask.getTableNo().toString().trim() == ""))
			throw new RuntimeException("生产指令单对象业务主键和id不能同时为空");
		if (produceTask.getId() != null) {
			WOMProduceTask result = produceTaskService.getProduceTask(produceTask .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return produceTaskService.loadProduceTaskByBussinessKey(produceTask.getTableNo());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个生产指令单，则返回false，否则返回true
	 * @param produceTask
	 */
	private boolean beforeUpdateProduceTask(WOMProduceTask produceTask) {
		produceTask.setStatus(99);
		if(produceTask.getTableInfoId() == null){
			throw new RuntimeException("tableInfoId不能为空。");
		}
		WOMProduceTask temp = getProduceTask(produceTask);
		if (temp == null) {
			return false;
		}
		if(produceTask.getId() == null){
			produceTask.setId(temp.getId());		
		}
		if(produceTask.getTableNo() == null){
			produceTask.setTableNo(temp.getTableNo());
		}
		
		produceTask.setVersion(temp.getVersion());
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
	 * 清除生产指令单对象下所有辅模型对象中的生产指令单对象
	 * @param produceTask
	 */
	private void clearCircle(WOMProduceTask produceTask) {
		if (produceTask.getBatchPhaseExelogList() != null && produceTask.getBatchPhaseExelogList().size() > 0) {
			for (WOMBatchPhaseExelog batchPhaseExelog : produceTask.getBatchPhaseExelogList()) {
				batchPhaseExelog.setTaskID(null);
			}
		}
		if (produceTask.getProdTaskActiExelogList() != null && produceTask.getProdTaskActiExelogList().size() > 0) {
			for (WOMProdTaskActiExelog prodTaskActiExelog : produceTask.getProdTaskActiExelogList()) {
				prodTaskActiExelog.setTaskID(null);
			}
		}
		if (produceTask.getProdTaskProcExelogList() != null && produceTask.getProdTaskProcExelogList().size() > 0) {
			for (WOMProdTaskProcExelog prodTaskProcExelog : produceTask.getProdTaskProcExelogList()) {
				prodTaskProcExelog.setTaskID(null);
			}
		}
		if (produceTask.getProduceMaterialSumList() != null && produceTask.getProduceMaterialSumList().size() > 0) {
			for (WOMProduceMaterialSum produceMaterialSum : produceTask.getProduceMaterialSumList()) {
				produceMaterialSum.setHeadId(null);
			}
		}
		if (produceTask.getProduceTaskActiveList() != null && produceTask.getProduceTaskActiveList().size() > 0) {
			for (WOMProduceTaskActive produceTaskActive : produceTask.getProduceTaskActiveList()) {
				produceTaskActive.setHeadID(null);
			}
		}
		if (produceTask.getProduceTaskProcessList() != null && produceTask.getProduceTaskProcessList().size() > 0) {
			for (WOMProduceTaskProcess produceTaskProcess : produceTask.getProduceTaskProcessList()) {
				produceTaskProcess.setHeadId(null);
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
	private void checkProduceTaskData(WOMProduceTask produceTask){
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}