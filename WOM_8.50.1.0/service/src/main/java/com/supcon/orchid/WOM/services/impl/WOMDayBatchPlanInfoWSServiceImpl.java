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
import com.supcon.orchid.WOM.services.WOMDayBatchPlanInfoWSService;
import com.supcon.orchid.WOM.services.WOMDayBatchPlanInfoService;
import com.supcon.orchid.WOM.services.WOMDayBatchPlanPartsService;
	
/* CUSTOM CODE START(wsserviceimpl,import,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="WOMDayBatchPlanInfo",targetNamespace = "http://ws.supcon.com")
public class WOMDayBatchPlanInfoWSServiceImpl implements WOMDayBatchPlanInfoWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private WOMDayBatchPlanInfoService dayBatchPlanInfoService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private WOMDayBatchPlanPartsService dayBatchPlanPartsService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取生产计划数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getDayBatchPlanInfoByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			WOMDayBatchPlanInfo dayBatchPlanInfo = dayBatchPlanInfoService.loadDayBatchPlanInfoByBussinessKey(businessKey);
			if(dayBatchPlanInfo == null){
				return set404Error(result);
			}
			//添加辅模型
			List<WOMDayBatchPlanParts> dayBatchPlanPartsList = clearDayBatchPlanPartsNonMainField(dayBatchPlanInfoService.getDayBatchPlanPartsList(dayBatchPlanInfo));
			dayBatchPlanInfo.setDayBatchPlanPartsList(dayBatchPlanPartsList);
			
			setSuccessResult(result, dayBatchPlanInfo);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取生产计划数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getDayBatchPlanInfoByPk(
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
			
			WOMDayBatchPlanInfo dayBatchPlanInfo = dayBatchPlanInfoService.getDayBatchPlanInfo(id);
			if(dayBatchPlanInfo == null || !dayBatchPlanInfo.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<WOMDayBatchPlanParts> dayBatchPlanPartsList = clearDayBatchPlanPartsNonMainField(dayBatchPlanInfoService.getDayBatchPlanPartsList(dayBatchPlanInfo));
			dayBatchPlanInfo.setDayBatchPlanPartsList(dayBatchPlanPartsList);
			setSuccessResult(result, dayBatchPlanInfo);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改生产计划数据
	 * @param 生产计划对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateDayBatchPlanInfo(
		@WebParam(name="dayBatchPlanInfo")WOMDayBatchPlanInfo dayBatchPlanInfo,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(dayBatchPlanInfo == null){
				return set500Error(result, "生产计划不能为空。");
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
			
			if(!beforeUpdateDayBatchPlanInfo(dayBatchPlanInfo)){
				return set404Error(result);
			}
			dayBatchPlanInfoService.saveSuperEditDayBatchPlanInfo(dayBatchPlanInfo, null, null, null, null, null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addDayBatchPlanInfo(
		@WebParam(name="dayBatchPlanInfo")WOMDayBatchPlanInfo dayBatchPlanInfo,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(dayBatchPlanInfo == null){
				return set500Error(result, "生产计划不能为空。");
			}
		
			if(dayBatchPlanInfo.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(dayBatchPlanInfo.getTableNo() == null){
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
				checkDayBatchPlanInfoData(dayBatchPlanInfo);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			dayBatchPlanInfoService.saveSuperEditDayBatchPlanInfo(dayBatchPlanInfo, null, null, null);
			setSuccessResult(result, dayBatchPlanInfo.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteDayBatchPlanInfoByBusinessKey(
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
			WOMDayBatchPlanInfo dayBatchPlanInfo = null;
			try{
				dayBatchPlanInfo = dayBatchPlanInfoService.loadDayBatchPlanInfoByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(dayBatchPlanInfo == null){
				return set404Error(result);
			}
			dayBatchPlanInfoService.deleteDayBatchPlanInfo(dayBatchPlanInfo);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteDayBatchPlanInfoByPk(
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
			WOMDayBatchPlanInfo dayBatchPlanInfo = null;
			try{
				dayBatchPlanInfo = dayBatchPlanInfoService.getDayBatchPlanInfo(id);
			}catch(NullPointerException e){}
			if(dayBatchPlanInfo == null || !dayBatchPlanInfo.isValid()){
				return set404Error(result);
			}
			dayBatchPlanInfoService.deleteDayBatchPlanInfo(dayBatchPlanInfo);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddDayBatchPlanInfo(
		@WebParam(name="dayBatchPlanInfoList")List<WOMDayBatchPlanInfo> dayBatchPlanInfoList,
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
			for(WOMDayBatchPlanInfo dayBatchPlanInfo : dayBatchPlanInfoList){
				if(dayBatchPlanInfo.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(dayBatchPlanInfo.getTableNo() == null || dayBatchPlanInfo.getTableNo().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkDayBatchPlanInfoData(dayBatchPlanInfo);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			dayBatchPlanInfoService.batchSaveSuperEditDayBatchPlanInfo(dayBatchPlanInfoList, null, null, null);
			for(WOMDayBatchPlanInfo dayBatchPlanInfo : dayBatchPlanInfoList){
				idList.add(dayBatchPlanInfo.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateDayBatchPlanInfo(
		@WebParam(name="dayBatchPlanInfoList")List<WOMDayBatchPlanInfo> dayBatchPlanInfoList,
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
			for(WOMDayBatchPlanInfo dayBatchPlanInfo : dayBatchPlanInfoList){
				try{
					if(!beforeUpdateDayBatchPlanInfo(dayBatchPlanInfo)){
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
			dayBatchPlanInfoService.batchSaveSuperEditDayBatchPlanInfo(dayBatchPlanInfoList, null, null, null,null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteDayBatchPlanInfoByPk(
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
				WOMDayBatchPlanInfo temp = null;
				try{
					temp = dayBatchPlanInfoService.getDayBatchPlanInfo(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			dayBatchPlanInfoService.deleteDayBatchPlanInfo(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteDayBatchPlanInfoByBusinessKey(
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
				WOMDayBatchPlanInfo temp = null;
				try{
					temp = dayBatchPlanInfoService.loadDayBatchPlanInfoByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			dayBatchPlanInfoService.deleteDayBatchPlanInfo(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getDayBatchPlanInfoPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanInfo.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),WOMDayBatchPlanInfo.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanInfo.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMDayBatchPlanInfo.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanInfo.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMDayBatchPlanInfo> page = new Page<WOMDayBatchPlanInfo>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMDayBatchPlanInfo> datas = dayBatchPlanInfoService.getByPage(page, detachedCriteria);
			List<WOMDayBatchPlanInfo> dayBatchPlanInfoList = datas.getResult();
			if (dayBatchPlanInfoList == null || dayBatchPlanInfoList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(dayBatchPlanInfoList.toArray());
			PaginationDTO<WOMDayBatchPlanInfo> pagination = new PaginationDTO<WOMDayBatchPlanInfo>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据生产计划业务主键查询生产计划下所有辅模型
	 * @param 生产计划业务主键
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
			WOMDayBatchPlanInfo dayBatchPlanInfo = dayBatchPlanInfoService.loadDayBatchPlanInfoByBussinessKey(businessKey);
			if (dayBatchPlanInfo == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap dayBatchPlanPartsMap = new SimulationMap();
			dayBatchPlanPartsMap.setName(InternationalResource.get("DayBatchPlanParts"));
			dayBatchPlanPartsMap.setList(dayBatchPlanInfoService.getDayBatchPlanPartsList(dayBatchPlanInfo));
			resultList.add(dayBatchPlanPartsMap);
			
			clearCircle(dayBatchPlanInfo);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据生产计划id查询生产计划下所有辅模型
	 * 
	 * @param 生产计划id
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
			WOMDayBatchPlanInfo dayBatchPlanInfo = dayBatchPlanInfoService.getDayBatchPlanInfo(id);
			if (dayBatchPlanInfo == null || !dayBatchPlanInfo.isValid()) {
				result.setErrorMessage("找不到生产计划");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap dayBatchPlanPartsMap = new SimulationMap();
			dayBatchPlanPartsMap.setName(InternationalResource.get("DayBatchPlanParts"));
			dayBatchPlanPartsMap.setList(dayBatchPlanInfoService.getDayBatchPlanPartsList(dayBatchPlanInfo));
			resultList.add(dayBatchPlanPartsMap);
			
			clearCircle(dayBatchPlanInfo);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  计划明细-------------------------------------------------
	//--hasLink:true---link:DayPlanInfo
	/**
	 * 根据计划明细业务主键分页查询计划明细数据
	 * 
	 * @param 计划明细业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getDayBatchPlanPartsPageByDayBatchPlanInfoBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanParts.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMDayBatchPlanParts.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanParts.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMDayBatchPlanParts.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanParts.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			WOMDayBatchPlanInfo dayBatchPlanInfo = dayBatchPlanInfoService.loadDayBatchPlanInfoByBussinessKey(businessKey);
			if (dayBatchPlanInfo == null) {
				return set500Error(result, "该业务主键的生产计划不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("dayPlanInfo",dayBatchPlanInfo));
			Page<WOMDayBatchPlanParts> page = new Page<WOMDayBatchPlanParts>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMDayBatchPlanParts> datas = dayBatchPlanPartsService.getByPage(page, detachedCriteria);
			List<WOMDayBatchPlanParts> dayBatchPlanPartsList = datas.getResult();
			if (dayBatchPlanPartsList == null || dayBatchPlanPartsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(dayBatchPlanPartsList.toArray());
			PaginationDTO<WOMDayBatchPlanParts> pagination = new PaginationDTO<WOMDayBatchPlanParts>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据计划明细id分页查询计划明细数据
	 * 
	 * @param 计划明细id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getDayBatchPlanPartsPageByDayBatchPlanInfoPk(	
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
				detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanParts.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), WOMDayBatchPlanParts.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanParts.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMDayBatchPlanParts.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanParts.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			WOMDayBatchPlanInfo dayBatchPlanInfo = dayBatchPlanInfoService.getDayBatchPlanInfo(id);
			if (dayBatchPlanInfo == null) {
				return set500Error(result, "该主键的生产计划不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("dayPlanInfo",dayBatchPlanInfo));
			Page<WOMDayBatchPlanParts> page = new Page<WOMDayBatchPlanParts>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMDayBatchPlanParts> datas = dayBatchPlanPartsService.getByPage(page, detachedCriteria);
			List<WOMDayBatchPlanParts> dayBatchPlanPartsList = datas.getResult();
			if (dayBatchPlanPartsList == null || dayBatchPlanPartsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(dayBatchPlanPartsList.toArray());
			PaginationDTO<WOMDayBatchPlanParts> pagination = new PaginationDTO<WOMDayBatchPlanParts>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据计划明细id分获取计划明细数据
	 * 
	 * @param 计划明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getDayBatchPlanParts(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMDayBatchPlanParts dayBatchPlanParts = dayBatchPlanPartsService.getDayBatchPlanParts(id);
			if(dayBatchPlanParts == null){
				return set404Error(result);
			}
			setSuccessResult(result, dayBatchPlanParts);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据计划明细业务id修改计划明细数据
	 * 
	 * @param 计划明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateDayBatchPlanParts(
		@WebParam(name="dayBatchPlanParts")WOMDayBatchPlanParts dayBatchPlanParts,
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
			if(!beforeUpdateDayBatchPlanParts(dayBatchPlanParts)){
				return set404Error(result);
			}
			dayBatchPlanPartsService.saveDayBatchPlanParts(dayBatchPlanParts, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增计划明细
	 * 
	 * @param 计划明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addDayBatchPlanParts(
		@WebParam(name="dayBatchPlanParts")WOMDayBatchPlanParts dayBatchPlanParts,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(dayBatchPlanParts == null){
				return set500Error(result, "计划明细对象不能为空。");
			}
			if(dayBatchPlanParts.getId() != null){
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
				checkDayBatchPlanPartsData(dayBatchPlanParts);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			WOMDayBatchPlanInfo tempDayBatchPlanInfo = dayBatchPlanParts.getDayPlanInfo();
			if (tempDayBatchPlanInfo == null) {
				return set500Error(result, "生产计划对象不能为空");
			}
			
			WOMDayBatchPlanInfo dayBatchPlanInfo = null;
			if(tempDayBatchPlanInfo.getId()!= null){
				dayBatchPlanInfo = dayBatchPlanInfoService.getDayBatchPlanInfo(tempDayBatchPlanInfo.getId());
			}else if(tempDayBatchPlanInfo.getTableNo() != null){
				dayBatchPlanInfo = dayBatchPlanInfoService.loadDayBatchPlanInfoByBussinessKey(tempDayBatchPlanInfo.getTableNo());
			}else{
				return set500Error(result, "生产计划对象必须设置id或业务主键。");
			}
			
			if(dayBatchPlanInfo == null){
				return set404Error(result);
			}
			dayBatchPlanParts.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
			dayBatchPlanParts.setDayPlanInfo(dayBatchPlanInfo);
			
			dayBatchPlanPartsService.saveDayBatchPlanParts(dayBatchPlanParts, null);
			Long dayBatchPlanPartsId = dayBatchPlanParts.getId();
			setSuccessResult(result, dayBatchPlanPartsId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据计划明细id 删除计划明细
	 * 
	 * @param 计划明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteDayBatchPlanParts(
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
			
			WOMDayBatchPlanParts dayBatchPlanParts = null;
			try{
				dayBatchPlanParts = dayBatchPlanPartsService.getDayBatchPlanParts(id);
			}catch(NullPointerException e){}
			if(dayBatchPlanParts == null  || !dayBatchPlanParts.isValid()){
				return set404Error(result);
			}
			dayBatchPlanPartsService.deleteDayBatchPlanParts(dayBatchPlanParts);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改计划明细数据，计划明细id不能为空
	 *
	 * @param 计划明细列表，每个计划明细必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateDayBatchPlanParts(
		@WebParam(name="dayBatchPlanPartsList")List<WOMDayBatchPlanParts> dayBatchPlanPartsList,
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
			for(WOMDayBatchPlanParts dayBatchPlanParts : dayBatchPlanPartsList){
				try{
					if(!beforeUpdateDayBatchPlanParts(dayBatchPlanParts)){
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
			
			dayBatchPlanPartsService.batchImportBaseDayBatchPlanParts(dayBatchPlanPartsList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增计划明细数据
	 * 
	 * @param 计划明细列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddDayBatchPlanParts(
		@WebParam(name="dayBatchPlanPartsList")List<WOMDayBatchPlanParts> dayBatchPlanPartsList,
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
			
			if(dayBatchPlanPartsList == null){
				set500Error(result, "dayBatchPlanPartsList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMDayBatchPlanParts dayBatchPlanParts : dayBatchPlanPartsList){
				if(dayBatchPlanParts.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(dayBatchPlanParts.getDayPlanInfo() == null){
						set500Error(result, "第"+count+"条数据出错：生产计划对象不能为空。");
						return result;
					}
					WOMDayBatchPlanInfo dayBatchPlanInfo = getDayBatchPlanInfo(dayBatchPlanParts.getDayPlanInfo());
					if(dayBatchPlanInfo == null){
						set500Error(result, "第"+count+"条数据出错：生产计划对象不存在。");
						return result;
					}
					dayBatchPlanParts.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
					dayBatchPlanParts.setDayPlanInfo(dayBatchPlanInfo);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkDayBatchPlanPartsData(dayBatchPlanParts);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			dayBatchPlanPartsService.batchImportBaseDayBatchPlanParts(dayBatchPlanPartsList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMDayBatchPlanParts dayBatchPlanParts : dayBatchPlanPartsList){
				idList.add(dayBatchPlanParts.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据计划明细id，批量删除计划明细数据
	 * 
	 * @param 计划明细id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelDayBatchPlanParts(
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
			
			List<WOMDayBatchPlanParts> dayBatchPlanPartsList = new ArrayList<WOMDayBatchPlanParts>();
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
				
				WOMDayBatchPlanParts dayBatchPlanParts = dayBatchPlanPartsService.getDayBatchPlanParts(id);
				if(dayBatchPlanParts == null || !dayBatchPlanParts.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				dayBatchPlanPartsList.add(dayBatchPlanParts);
				
				count ++;
			}
			for(WOMDayBatchPlanParts dayBatchPlanParts : dayBatchPlanPartsList){
				dayBatchPlanPartsService.deleteDayBatchPlanParts(dayBatchPlanParts);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有计划明细数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getDayBatchPlanPartsPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanParts.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMDayBatchPlanParts.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanParts.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMDayBatchPlanParts.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMDayBatchPlanParts.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMDayBatchPlanParts> page = new Page<WOMDayBatchPlanParts>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMDayBatchPlanParts> datas = dayBatchPlanPartsService.getByPage(page, detachedCriteria);
			List<WOMDayBatchPlanParts> dayBatchPlanPartsList = datas.getResult();
			if (dayBatchPlanPartsList == null || dayBatchPlanPartsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(dayBatchPlanPartsList.toArray());
			PaginationDTO<WOMDayBatchPlanParts> pagination = new PaginationDTO<WOMDayBatchPlanParts>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到计划明细则返回空。
	 * @param dayBatchPlanParts
	 * @return
	 */
	private WOMDayBatchPlanParts getDayBatchPlanParts(WOMDayBatchPlanParts dayBatchPlanParts) {
		if (dayBatchPlanParts.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMDayBatchPlanParts result = dayBatchPlanPartsService.getDayBatchPlanParts(dayBatchPlanParts.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果计划明细不存在，返回false；如果原来没有生产计划对象，且修改的时候也没有配置生产计划对象，则报错；如果配置的生产计划对象不存在，则报错；
	 * @param dayBatchPlanParts
	 * @return 
	 */
	private boolean beforeUpdateDayBatchPlanParts(WOMDayBatchPlanParts dayBatchPlanParts){
		if(dayBatchPlanParts.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMDayBatchPlanParts temp = getDayBatchPlanParts(dayBatchPlanParts);
		if(temp == null){
			return false;
		}
		WOMDayBatchPlanInfo dayBatchPlanInfo = null;
		if (temp.getDayPlanInfo() == null) {
			if (dayBatchPlanParts.getDayPlanInfo() == null || (dayBatchPlanParts.getDayPlanInfo().getId() == null && dayBatchPlanParts.getDayPlanInfo().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				dayBatchPlanInfo = getDayBatchPlanInfo(dayBatchPlanParts.getDayPlanInfo());
				if(dayBatchPlanInfo == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (dayBatchPlanParts.getDayPlanInfo() == null || (dayBatchPlanParts.getDayPlanInfo().getId() == null && dayBatchPlanParts.getDayPlanInfo().getTableNo() == null)) {
				dayBatchPlanInfo = temp.getDayPlanInfo();
			} else {
				dayBatchPlanInfo = getDayBatchPlanInfo(dayBatchPlanParts.getDayPlanInfo());
				if (dayBatchPlanInfo == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		dayBatchPlanParts.setTableInfoId(dayBatchPlanInfo.getTableInfoId());
		
		dayBatchPlanParts.setDayPlanInfo(dayBatchPlanInfo);
		dayBatchPlanParts.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMDayBatchPlanParts> clearDayBatchPlanPartsNonMainField(List<WOMDayBatchPlanParts> list){
		 List<WOMDayBatchPlanParts> dayBatchPlanPartsList = new ArrayList<WOMDayBatchPlanParts>();
		 for(WOMDayBatchPlanParts dayBatchPlanParts:list){
			 WOMDayBatchPlanParts temp = new WOMDayBatchPlanParts();
			 temp.setId(dayBatchPlanParts.getId());
		 	 dayBatchPlanPartsList.add(temp);
		 }
		 return dayBatchPlanPartsList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkDayBatchPlanPartsData(WOMDayBatchPlanParts dayBatchPlanParts){
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
	 * 获取生产计划对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param dayBatchPlanInfo
	 * @return
	 */
	private WOMDayBatchPlanInfo getDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		if (dayBatchPlanInfo.getId() == null && (dayBatchPlanInfo.getTableNo() == null || dayBatchPlanInfo.getTableNo().toString().trim() == ""))
			throw new RuntimeException("生产计划对象业务主键和id不能同时为空");
		if (dayBatchPlanInfo.getId() != null) {
			WOMDayBatchPlanInfo result = dayBatchPlanInfoService.getDayBatchPlanInfo(dayBatchPlanInfo .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return dayBatchPlanInfoService.loadDayBatchPlanInfoByBussinessKey(dayBatchPlanInfo.getTableNo());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个生产计划，则返回false，否则返回true
	 * @param dayBatchPlanInfo
	 */
	private boolean beforeUpdateDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		dayBatchPlanInfo.setStatus(99);
		if(dayBatchPlanInfo.getTableInfoId() == null){
			throw new RuntimeException("tableInfoId不能为空。");
		}
		WOMDayBatchPlanInfo temp = getDayBatchPlanInfo(dayBatchPlanInfo);
		if (temp == null) {
			return false;
		}
		if(dayBatchPlanInfo.getId() == null){
			dayBatchPlanInfo.setId(temp.getId());		
		}
		if(dayBatchPlanInfo.getTableNo() == null){
			dayBatchPlanInfo.setTableNo(temp.getTableNo());
		}
		
		dayBatchPlanInfo.setVersion(temp.getVersion());
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
	 * 清除生产计划对象下所有辅模型对象中的生产计划对象
	 * @param dayBatchPlanInfo
	 */
	private void clearCircle(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		if (dayBatchPlanInfo.getDayBatchPlanPartsList() != null && dayBatchPlanInfo.getDayBatchPlanPartsList().size() > 0) {
			for (WOMDayBatchPlanParts dayBatchPlanParts : dayBatchPlanInfo.getDayBatchPlanPartsList()) {
				dayBatchPlanParts.setDayPlanInfo(null);
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
	private void checkDayBatchPlanInfoData(WOMDayBatchPlanInfo dayBatchPlanInfo){
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}