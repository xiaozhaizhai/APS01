package com.supcon.orchid.X6Basic.services.impl;
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
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriod;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriodPart;
import com.supcon.orchid.X6Basic.entities.X6BasicAbook;
import com.supcon.orchid.X6Basic.entities.AttMachine;
import com.supcon.orchid.X6Basic.entities.ProductManage;
import com.supcon.orchid.X6Basic.entities.X6BasicDocumentClasses;
import com.supcon.orchid.X6Basic.entities.X6BasicSignature;
import com.supcon.orchid.X6Basic.entities.X6BasicMailServer;
import com.supcon.orchid.X6Basic.entities.MeetingRoom;
import com.supcon.orchid.X6Basic.entities.UsedRecord;
import com.supcon.orchid.X6Basic.entities.MessageCenter;
import com.supcon.orchid.X6Basic.entities.X6BasicPlanDaily;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlan;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlanPart;
import com.supcon.orchid.X6Basic.entities.SignetSetting;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRule;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRulePart;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncConfigs;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncLog;
import com.supcon.orchid.X6Basic.entities.X6BasicTeamInfo;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegion;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegionPar;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
import com.supcon.orchid.X6Basic.entities.X6BasicUnitGroups;
import com.supcon.orchid.X6Basic.services.X6BasicTimeRegionWSService;
import com.supcon.orchid.X6Basic.services.X6BasicTimeRegionService;
import com.supcon.orchid.X6Basic.services.X6BasicTimeRegionParService;
/* CUSTOM CODE START(wsserviceimpl,import,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="X6BasicTimeRegion",targetNamespace = "http://ws.supcon.com")
public class X6BasicTimeRegionWSServiceImpl implements X6BasicTimeRegionWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private X6BasicTimeRegionService timeRegionService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private X6BasicTimeRegionParService timeRegionParService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取时间区间数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTimeRegionByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			X6BasicTimeRegion timeRegion = timeRegionService.loadTimeRegionByBussinessKey(businessKey);
			if(timeRegion == null){
				return set404Error(result);
			}
			//添加辅模型
			List<X6BasicTimeRegionPar> timeRegionParList = clearTimeRegionParNonMainField(timeRegionService.getTimeRegionParList(timeRegion));
			timeRegion.setTimeRegionParList(timeRegionParList);
			
			setSuccessResult(result, timeRegion);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取时间区间数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTimeRegionByPk(
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
			
			X6BasicTimeRegion timeRegion = timeRegionService.getTimeRegion(id);
			if(timeRegion == null || !timeRegion.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<X6BasicTimeRegionPar> timeRegionParList = clearTimeRegionParNonMainField(timeRegionService.getTimeRegionParList(timeRegion));
			timeRegion.setTimeRegionParList(timeRegionParList);
			setSuccessResult(result, timeRegion);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改时间区间数据
	 * @param 时间区间对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateTimeRegion(
		@WebParam(name="timeRegion")X6BasicTimeRegion timeRegion,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(timeRegion == null){
				return set500Error(result, "时间区间不能为空。");
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
			
			if(!beforeUpdateTimeRegion(timeRegion)){
				return set404Error(result);
			}
			timeRegionService.saveTimeRegion(timeRegion, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addTimeRegion(
		@WebParam(name="timeRegion")X6BasicTimeRegion timeRegion,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(timeRegion == null){
				return set500Error(result, "时间区间不能为空。");
			}
		
			if(timeRegion.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(timeRegion.getId() == null){
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
				checkTimeRegionData(timeRegion);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			timeRegionService.saveTimeRegion(timeRegion, null);
			setSuccessResult(result, timeRegion.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteTimeRegionByBusinessKey(
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
			X6BasicTimeRegion timeRegion = null;
			try{
				timeRegion = timeRegionService.loadTimeRegionByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(timeRegion == null){
				return set404Error(result);
			}
			timeRegionService.deleteTimeRegion(timeRegion);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteTimeRegionByPk(
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
			X6BasicTimeRegion timeRegion = null;
			try{
				timeRegion = timeRegionService.getTimeRegion(id);
			}catch(NullPointerException e){}
			if(timeRegion == null || !timeRegion.isValid()){
				return set404Error(result);
			}
			timeRegionService.deleteTimeRegion(timeRegion);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddTimeRegion(
		@WebParam(name="timeRegionList")List<X6BasicTimeRegion> timeRegionList,
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
			for(X6BasicTimeRegion timeRegion : timeRegionList){
				if(timeRegion.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(timeRegion.getId() == null || timeRegion.getId().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkTimeRegionData(timeRegion);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			timeRegionService.batchImportBaseTimeRegion(timeRegionList);
			for(X6BasicTimeRegion timeRegion : timeRegionList){
				idList.add(timeRegion.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateTimeRegion(
		@WebParam(name="timeRegionList")List<X6BasicTimeRegion> timeRegionList,
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
			for(X6BasicTimeRegion timeRegion : timeRegionList){
				try{
					if(!beforeUpdateTimeRegion(timeRegion)){
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
			timeRegionService.batchImportBaseTimeRegion(timeRegionList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteTimeRegionByPk(
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
				X6BasicTimeRegion temp = null;
				try{
					temp = timeRegionService.getTimeRegion(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			timeRegionService.deleteTimeRegion(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteTimeRegionByBusinessKey(
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
				X6BasicTimeRegion temp = null;
				try{
					temp = timeRegionService.loadTimeRegionByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			timeRegionService.deleteTimeRegion(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTimeRegionPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegion.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),X6BasicTimeRegion.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegion.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicTimeRegion.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegion.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<X6BasicTimeRegion> page = new Page<X6BasicTimeRegion>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicTimeRegion> datas = timeRegionService.getByPage(page, detachedCriteria);
			List<X6BasicTimeRegion> timeRegionList = datas.getResult();
			if (timeRegionList == null || timeRegionList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(timeRegionList.toArray());
			PaginationDTO<X6BasicTimeRegion> pagination = new PaginationDTO<X6BasicTimeRegion>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据时间区间业务主键查询时间区间下所有辅模型
	 * @param 时间区间业务主键
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
			X6BasicTimeRegion timeRegion = timeRegionService.loadTimeRegionByBussinessKey(businessKey);
			if (timeRegion == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap timeRegionParMap = new SimulationMap();
			timeRegionParMap.setName(InternationalResource.get("TimeRegionPar"));
			timeRegionParMap.setList(timeRegionService.getTimeRegionParList(timeRegion));
			resultList.add(timeRegionParMap);
			
			clearCircle(timeRegion);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据时间区间id查询时间区间下所有辅模型
	 * 
	 * @param 时间区间id
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
			X6BasicTimeRegion timeRegion = timeRegionService.getTimeRegion(id);
			if (timeRegion == null || !timeRegion.isValid()) {
				result.setErrorMessage("找不到时间区间");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap timeRegionParMap = new SimulationMap();
			timeRegionParMap.setName(InternationalResource.get("TimeRegionPar"));
			timeRegionParMap.setList(timeRegionService.getTimeRegionParList(timeRegion));
			resultList.add(timeRegionParMap);
			
			clearCircle(timeRegion);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  时间区间明细-------------------------------------------------
	//--hasLink:true---link:TimeRegionID
	/**
	 * 根据时间区间明细业务主键分页查询时间区间明细数据
	 * 
	 * @param 时间区间明细业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTimeRegionParPageByTimeRegionBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegionPar.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), X6BasicTimeRegionPar.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegionPar.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicTimeRegionPar.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegionPar.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			X6BasicTimeRegion timeRegion = timeRegionService.loadTimeRegionByBussinessKey(businessKey);
			if (timeRegion == null) {
				return set500Error(result, "该业务主键的时间区间不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("timeRegionID",timeRegion));
			Page<X6BasicTimeRegionPar> page = new Page<X6BasicTimeRegionPar>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicTimeRegionPar> datas = timeRegionParService.getByPage(page, detachedCriteria);
			List<X6BasicTimeRegionPar> timeRegionParList = datas.getResult();
			if (timeRegionParList == null || timeRegionParList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(timeRegionParList.toArray());
			PaginationDTO<X6BasicTimeRegionPar> pagination = new PaginationDTO<X6BasicTimeRegionPar>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据时间区间明细id分页查询时间区间明细数据
	 * 
	 * @param 时间区间明细id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTimeRegionParPageByTimeRegionPk(	
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegionPar.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), X6BasicTimeRegionPar.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegionPar.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicTimeRegionPar.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegionPar.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			X6BasicTimeRegion timeRegion = timeRegionService.getTimeRegion(id);
			if (timeRegion == null) {
				return set500Error(result, "该主键的时间区间不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("timeRegionID",timeRegion));
			Page<X6BasicTimeRegionPar> page = new Page<X6BasicTimeRegionPar>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicTimeRegionPar> datas = timeRegionParService.getByPage(page, detachedCriteria);
			List<X6BasicTimeRegionPar> timeRegionParList = datas.getResult();
			if (timeRegionParList == null || timeRegionParList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(timeRegionParList.toArray());
			PaginationDTO<X6BasicTimeRegionPar> pagination = new PaginationDTO<X6BasicTimeRegionPar>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据时间区间明细id分获取时间区间明细数据
	 * 
	 * @param 时间区间明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTimeRegionPar(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			X6BasicTimeRegionPar timeRegionPar = timeRegionParService.getTimeRegionPar(id);
			if(timeRegionPar == null){
				return set404Error(result);
			}
			setSuccessResult(result, timeRegionPar);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据时间区间明细业务id修改时间区间明细数据
	 * 
	 * @param 时间区间明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateTimeRegionPar(
		@WebParam(name="timeRegionPar")X6BasicTimeRegionPar timeRegionPar,
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
			if(!beforeUpdateTimeRegionPar(timeRegionPar)){
				return set404Error(result);
			}
			timeRegionParService.saveTimeRegionPar(timeRegionPar, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增时间区间明细
	 * 
	 * @param 时间区间明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addTimeRegionPar(
		@WebParam(name="timeRegionPar")X6BasicTimeRegionPar timeRegionPar,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(timeRegionPar == null){
				return set500Error(result, "时间区间明细对象不能为空。");
			}
			if(timeRegionPar.getId() != null){
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
				checkTimeRegionParData(timeRegionPar);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			X6BasicTimeRegion tempTimeRegion = timeRegionPar.getTimeRegionID();
			if (tempTimeRegion == null) {
				return set500Error(result, "时间区间对象不能为空");
			}
			
			X6BasicTimeRegion timeRegion = null;
			if(tempTimeRegion.getId()!= null){
				timeRegion = timeRegionService.getTimeRegion(tempTimeRegion.getId());
			}else if(tempTimeRegion.getId() != null){
				timeRegion = timeRegionService.loadTimeRegionByBussinessKey(tempTimeRegion.getId());
			}else{
				return set500Error(result, "时间区间对象必须设置id或业务主键。");
			}
			
			if(timeRegion == null){
				return set404Error(result);
			}
			timeRegionPar.setTimeRegionID(timeRegion);
			
			timeRegionParService.saveTimeRegionPar(timeRegionPar, null);
			Long timeRegionParId = timeRegionPar.getId();
			setSuccessResult(result, timeRegionParId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据时间区间明细id 删除时间区间明细
	 * 
	 * @param 时间区间明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteTimeRegionPar(
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
			
			X6BasicTimeRegionPar timeRegionPar = null;
			try{
				timeRegionPar = timeRegionParService.getTimeRegionPar(id);
			}catch(NullPointerException e){}
			if(timeRegionPar == null  || !timeRegionPar.isValid()){
				return set404Error(result);
			}
			timeRegionParService.deleteTimeRegionPar(timeRegionPar);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改时间区间明细数据，时间区间明细id不能为空
	 *
	 * @param 时间区间明细列表，每个时间区间明细必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateTimeRegionPar(
		@WebParam(name="timeRegionParList")List<X6BasicTimeRegionPar> timeRegionParList,
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
			for(X6BasicTimeRegionPar timeRegionPar : timeRegionParList){
				try{
					if(!beforeUpdateTimeRegionPar(timeRegionPar)){
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
			
			timeRegionParService.batchImportBaseTimeRegionPar(timeRegionParList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增时间区间明细数据
	 * 
	 * @param 时间区间明细列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddTimeRegionPar(
		@WebParam(name="timeRegionParList")List<X6BasicTimeRegionPar> timeRegionParList,
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
			
			if(timeRegionParList == null){
				set500Error(result, "timeRegionParList不能为空。");
				return result;
			}
			
			int count = 1;
			for(X6BasicTimeRegionPar timeRegionPar : timeRegionParList){
				if(timeRegionPar.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(timeRegionPar.getTimeRegionID() == null){
						set500Error(result, "第"+count+"条数据出错：时间区间对象不能为空。");
						return result;
					}
					X6BasicTimeRegion timeRegion = getTimeRegion(timeRegionPar.getTimeRegionID());
					if(timeRegion == null){
						set500Error(result, "第"+count+"条数据出错：时间区间对象不存在。");
						return result;
					}
					timeRegionPar.setTimeRegionID(timeRegion);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkTimeRegionParData(timeRegionPar);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			timeRegionParService.batchImportBaseTimeRegionPar(timeRegionParList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(X6BasicTimeRegionPar timeRegionPar : timeRegionParList){
				idList.add(timeRegionPar.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据时间区间明细id，批量删除时间区间明细数据
	 * 
	 * @param 时间区间明细id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelTimeRegionPar(
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
			
			List<X6BasicTimeRegionPar> timeRegionParList = new ArrayList<X6BasicTimeRegionPar>();
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
				
				X6BasicTimeRegionPar timeRegionPar = timeRegionParService.getTimeRegionPar(id);
				if(timeRegionPar == null || !timeRegionPar.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				timeRegionParList.add(timeRegionPar);
				
				count ++;
			}
			for(X6BasicTimeRegionPar timeRegionPar : timeRegionParList){
				timeRegionParService.deleteTimeRegionPar(timeRegionPar);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有时间区间明细数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTimeRegionParPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegionPar.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), X6BasicTimeRegionPar.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegionPar.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicTimeRegionPar.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicTimeRegionPar.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<X6BasicTimeRegionPar> page = new Page<X6BasicTimeRegionPar>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicTimeRegionPar> datas = timeRegionParService.getByPage(page, detachedCriteria);
			List<X6BasicTimeRegionPar> timeRegionParList = datas.getResult();
			if (timeRegionParList == null || timeRegionParList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(timeRegionParList.toArray());
			PaginationDTO<X6BasicTimeRegionPar> pagination = new PaginationDTO<X6BasicTimeRegionPar>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到时间区间明细则返回空。
	 * @param timeRegionPar
	 * @return
	 */
	private X6BasicTimeRegionPar getTimeRegionPar(X6BasicTimeRegionPar timeRegionPar) {
		if (timeRegionPar.getId() == null)
			throw new RuntimeException("id不能为空");
		X6BasicTimeRegionPar result = timeRegionParService.getTimeRegionPar(timeRegionPar.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果时间区间明细不存在，返回false；如果原来没有时间区间对象，且修改的时候也没有配置时间区间对象，则报错；如果配置的时间区间对象不存在，则报错；
	 * @param timeRegionPar
	 * @return 
	 */
	private boolean beforeUpdateTimeRegionPar(X6BasicTimeRegionPar timeRegionPar){
		if(timeRegionPar.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		X6BasicTimeRegionPar temp = getTimeRegionPar(timeRegionPar);
		if(temp == null){
			return false;
		}
		X6BasicTimeRegion timeRegion = null;
		if (temp.getTimeRegionID() == null) {
			if (timeRegionPar.getTimeRegionID() == null || (timeRegionPar.getTimeRegionID().getId() == null && timeRegionPar.getTimeRegionID().getId() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				timeRegion = getTimeRegion(timeRegionPar.getTimeRegionID());
				if(timeRegion == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (timeRegionPar.getTimeRegionID() == null || (timeRegionPar.getTimeRegionID().getId() == null && timeRegionPar.getTimeRegionID().getId() == null)) {
				timeRegion = temp.getTimeRegionID();
			} else {
				timeRegion = getTimeRegion(timeRegionPar.getTimeRegionID());
				if (timeRegion == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		timeRegionPar.setTimeRegionID(timeRegion);
		timeRegionPar.setVersion(temp.getVersion());
		return true;
	}
	
	private List<X6BasicTimeRegionPar> clearTimeRegionParNonMainField(List<X6BasicTimeRegionPar> list){
		 List<X6BasicTimeRegionPar> timeRegionParList = new ArrayList<X6BasicTimeRegionPar>();
		 for(X6BasicTimeRegionPar timeRegionPar:list){
			 X6BasicTimeRegionPar temp = new X6BasicTimeRegionPar();
			 temp.setId(timeRegionPar.getId());
			 temp.setName(timeRegionPar.getName());
		 	 timeRegionParList.add(temp);
		 }
		 return timeRegionParList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkTimeRegionParData(X6BasicTimeRegionPar timeRegionPar){
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
	 * 获取时间区间对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param timeRegion
	 * @return
	 */
	private X6BasicTimeRegion getTimeRegion(X6BasicTimeRegion timeRegion) {
		if (timeRegion.getId() == null && (timeRegion.getId() == null || timeRegion.getId().toString().trim() == ""))
			throw new RuntimeException("时间区间对象业务主键和id不能同时为空");
		if (timeRegion.getId() != null) {
			X6BasicTimeRegion result = timeRegionService.getTimeRegion(timeRegion .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return timeRegionService.loadTimeRegionByBussinessKey(timeRegion.getId());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个时间区间，则返回false，否则返回true
	 * @param timeRegion
	 */
	private boolean beforeUpdateTimeRegion(X6BasicTimeRegion timeRegion) {
		X6BasicTimeRegion temp = getTimeRegion(timeRegion);
		if (temp == null) {
			return false;
		}
		if(timeRegion.getId() == null){
			timeRegion.setId(temp.getId());		
		}
		if(timeRegion.getId() == null){
			timeRegion.setId(temp.getId());
		}
		
		timeRegion.setVersion(temp.getVersion());
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
	 * 清除时间区间对象下所有辅模型对象中的时间区间对象
	 * @param timeRegion
	 */
	private void clearCircle(X6BasicTimeRegion timeRegion) {
		if (timeRegion.getTimeRegionParList() != null && timeRegion.getTimeRegionParList().size() > 0) {
			for (X6BasicTimeRegionPar timeRegionPar : timeRegion.getTimeRegionParList()) {
				timeRegionPar.setTimeRegionID(null);
			}
		}
	
	}
	
	private void setOrchidAuthenticationToken(String ownerStaffUUID){
		Staff staff = staffService.getByUUid(ownerStaffUUID);
		if(staff == null)
			throw new RuntimeException("找不到staff。   ownerStaffUUID："+ownerStaffUUID);
		
		User user = staff.getUser();
		if(user == null){
			throw new RuntimeException("该staff下user为空。  ownerStaffUUID："+ownerStaffUUID);
		}
		
		List<CompanyStaff> companyStaffs = companyStaffService.getCompanyStaffs(staff);
		if(companyStaffs == null || companyStaffs.isEmpty()){
			throw new RuntimeException("该staff不在Company下。  ownerStaffUUID："+ownerStaffUUID);
		}
		
		OrchidAuthenticationToken orchidAuthenticationToken = null;
		try{
			orchidAuthenticationToken = new OrchidAuthenticationToken(user, null,null, companyStaffs.get(companyStaffs.size()-1).getCompany(), staff, Collections.EMPTY_LIST, Collections.EMPTY_LIST);
		}catch(NullPointerException e){
			throw new RuntimeException("ownerStaffUUID:"+ownerStaffUUID+"  不正确");
		}
		SecurityContextHolder.getContext().setAuthentication(orchidAuthenticationToken);
	}
	
	/**
	 * 如果有除主键和id以外的不可空字段为null，则抛出异常
	 */
	private void checkTimeRegionData(X6BasicTimeRegion timeRegion){
	}
	/* CUSTOM CODE START(wsserviceimpl,functions,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}