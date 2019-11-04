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
import com.supcon.orchid.X6Basic.services.X6BasicRangePlanWSService;
import com.supcon.orchid.X6Basic.services.X6BasicRangePlanService;
import com.supcon.orchid.X6Basic.services.X6BasicPlanDailyService;
import com.supcon.orchid.X6Basic.services.X6BasicRangePlanPartService;
/* CUSTOM CODE START(wsserviceimpl,import,X6Basic_1.0_rangePlan_RangePlan,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="X6BasicRangePlan",targetNamespace = "http://ws.supcon.com")
public class X6BasicRangePlanWSServiceImpl implements X6BasicRangePlanWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private X6BasicRangePlanService rangePlanService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private X6BasicPlanDailyService planDailyService;
	@Resource
	private X6BasicRangePlanPartService rangePlanPartService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取排班计划数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getRangePlanByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			X6BasicRangePlan rangePlan = rangePlanService.loadRangePlanByBussinessKey(businessKey);
			if(rangePlan == null){
				return set404Error(result);
			}
			//添加辅模型
			
			setSuccessResult(result, rangePlan);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取排班计划数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getRangePlanByPk(
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
			
			X6BasicRangePlan rangePlan = rangePlanService.getRangePlan(id);
			if(rangePlan == null || !rangePlan.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			setSuccessResult(result, rangePlan);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改排班计划数据
	 * @param 排班计划对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateRangePlan(
		@WebParam(name="rangePlan")X6BasicRangePlan rangePlan,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(rangePlan == null){
				return set500Error(result, "排班计划不能为空。");
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
			
			if(!beforeUpdateRangePlan(rangePlan)){
				return set404Error(result);
			}
			rangePlanService.saveRangePlan(rangePlan, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addRangePlan(
		@WebParam(name="rangePlan")X6BasicRangePlan rangePlan,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(rangePlan == null){
				return set500Error(result, "排班计划不能为空。");
			}
		
			if(rangePlan.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(rangePlan.getId() == null){
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
				checkRangePlanData(rangePlan);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			rangePlanService.saveRangePlan(rangePlan, null);
			setSuccessResult(result, rangePlan.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteRangePlanByBusinessKey(
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
			X6BasicRangePlan rangePlan = null;
			try{
				rangePlan = rangePlanService.loadRangePlanByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(rangePlan == null){
				return set404Error(result);
			}
			rangePlanService.deleteRangePlan(rangePlan);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteRangePlanByPk(
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
			X6BasicRangePlan rangePlan = null;
			try{
				rangePlan = rangePlanService.getRangePlan(id);
			}catch(NullPointerException e){}
			if(rangePlan == null || !rangePlan.isValid()){
				return set404Error(result);
			}
			rangePlanService.deleteRangePlan(rangePlan);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddRangePlan(
		@WebParam(name="rangePlanList")List<X6BasicRangePlan> rangePlanList,
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
			for(X6BasicRangePlan rangePlan : rangePlanList){
				if(rangePlan.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(rangePlan.getId() == null || rangePlan.getId().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkRangePlanData(rangePlan);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			rangePlanService.batchImportBaseRangePlan(rangePlanList);
			for(X6BasicRangePlan rangePlan : rangePlanList){
				idList.add(rangePlan.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateRangePlan(
		@WebParam(name="rangePlanList")List<X6BasicRangePlan> rangePlanList,
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
			for(X6BasicRangePlan rangePlan : rangePlanList){
				try{
					if(!beforeUpdateRangePlan(rangePlan)){
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
			rangePlanService.batchImportBaseRangePlan(rangePlanList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteRangePlanByPk(
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
				X6BasicRangePlan temp = null;
				try{
					temp = rangePlanService.getRangePlan(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			rangePlanService.deleteRangePlan(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteRangePlanByBusinessKey(
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
				X6BasicRangePlan temp = null;
				try{
					temp = rangePlanService.loadRangePlanByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			rangePlanService.deleteRangePlan(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getRangePlanPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(X6BasicRangePlan.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),X6BasicRangePlan.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicRangePlan.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicRangePlan.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicRangePlan.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<X6BasicRangePlan> page = new Page<X6BasicRangePlan>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicRangePlan> datas = rangePlanService.getByPage(page, detachedCriteria);
			List<X6BasicRangePlan> rangePlanList = datas.getResult();
			if (rangePlanList == null || rangePlanList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(rangePlanList.toArray());
			PaginationDTO<X6BasicRangePlan> pagination = new PaginationDTO<X6BasicRangePlan>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据排班计划业务主键查询排班计划下所有辅模型
	 * @param 排班计划业务主键
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
			X6BasicRangePlan rangePlan = rangePlanService.loadRangePlanByBussinessKey(businessKey);
			if (rangePlan == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(rangePlan);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据排班计划id查询排班计划下所有辅模型
	 * 
	 * @param 排班计划id
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
			X6BasicRangePlan rangePlan = rangePlanService.getRangePlan(id);
			if (rangePlan == null || !rangePlan.isValid()) {
				result.setErrorMessage("找不到排班计划");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(rangePlan);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  排班结果-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据排班结果业务主键分页查询排班结果数据
	 * 
	 * @param 排班结果业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPlanDailyPageByRangePlanBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "排班结果跟排班计划没有设置关联！");
	}
	/**
	 * 根据排班结果id分页查询排班结果数据
	 * 
	 * @param 排班结果id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPlanDailyPageByRangePlanPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "排班结果跟排班计划没有设置关联！");
	}
	/**
	 * 根据排班结果id分获取排班结果数据
	 * 
	 * @param 排班结果id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPlanDaily(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			X6BasicPlanDaily planDaily = planDailyService.getPlanDaily(id);
			if(planDaily == null){
				return set404Error(result);
			}
			setSuccessResult(result, planDaily);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据排班结果业务id修改排班结果数据
	 * 
	 * @param 排班结果对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updatePlanDaily(
		@WebParam(name="planDaily")X6BasicPlanDaily planDaily,
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
			if(!beforeUpdatePlanDaily(planDaily)){
				return set404Error(result);
			}
			planDailyService.savePlanDaily(planDaily, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增排班结果
	 * 
	 * @param 排班结果对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addPlanDaily(
		@WebParam(name="planDaily")X6BasicPlanDaily planDaily,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(planDaily == null){
				return set500Error(result, "排班结果对象不能为空。");
			}
			if(planDaily.getId() != null){
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
				checkPlanDailyData(planDaily);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			planDailyService.savePlanDaily(planDaily, null);
			Long planDailyId = planDaily.getId();
			setSuccessResult(result, planDailyId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据排班结果id 删除排班结果
	 * 
	 * @param 排班结果id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deletePlanDaily(
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
			
			X6BasicPlanDaily planDaily = null;
			try{
				planDaily = planDailyService.getPlanDaily(id);
			}catch(NullPointerException e){}
			if(planDaily == null  || !planDaily.isValid()){
				return set404Error(result);
			}
			planDailyService.deletePlanDaily(planDaily);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改排班结果数据，排班结果id不能为空
	 *
	 * @param 排班结果列表，每个排班结果必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdatePlanDaily(
		@WebParam(name="planDailyList")List<X6BasicPlanDaily> planDailyList,
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
			for(X6BasicPlanDaily planDaily : planDailyList){
				try{
					if(!beforeUpdatePlanDaily(planDaily)){
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
			
			planDailyService.batchImportBasePlanDaily(planDailyList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增排班结果数据
	 * 
	 * @param 排班结果列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddPlanDaily(
		@WebParam(name="planDailyList")List<X6BasicPlanDaily> planDailyList,
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
			
			if(planDailyList == null){
				set500Error(result, "planDailyList不能为空。");
				return result;
			}
			
			int count = 1;
			for(X6BasicPlanDaily planDaily : planDailyList){
				if(planDaily.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkPlanDailyData(planDaily);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			planDailyService.batchImportBasePlanDaily(planDailyList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(X6BasicPlanDaily planDaily : planDailyList){
				idList.add(planDaily.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据排班结果id，批量删除排班结果数据
	 * 
	 * @param 排班结果id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelPlanDaily(
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
			
			List<X6BasicPlanDaily> planDailyList = new ArrayList<X6BasicPlanDaily>();
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
				
				X6BasicPlanDaily planDaily = planDailyService.getPlanDaily(id);
				if(planDaily == null || !planDaily.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				planDailyList.add(planDaily);
				
				count ++;
			}
			for(X6BasicPlanDaily planDaily : planDailyList){
				planDailyService.deletePlanDaily(planDaily);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有排班结果数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPlanDailyPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(X6BasicPlanDaily.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), X6BasicPlanDaily.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicPlanDaily.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicPlanDaily.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicPlanDaily.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<X6BasicPlanDaily> page = new Page<X6BasicPlanDaily>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicPlanDaily> datas = planDailyService.getByPage(page, detachedCriteria);
			List<X6BasicPlanDaily> planDailyList = datas.getResult();
			if (planDailyList == null || planDailyList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(planDailyList.toArray());
			PaginationDTO<X6BasicPlanDaily> pagination = new PaginationDTO<X6BasicPlanDaily>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到排班结果则返回空。
	 * @param planDaily
	 * @return
	 */
	private X6BasicPlanDaily getPlanDaily(X6BasicPlanDaily planDaily) {
		if (planDaily.getId() == null)
			throw new RuntimeException("id不能为空");
		X6BasicPlanDaily result = planDailyService.getPlanDaily(planDaily.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果排班结果不存在，返回false；如果原来没有排班计划对象，且修改的时候也没有配置排班计划对象，则报错；如果配置的排班计划对象不存在，则报错；
	 * @param planDaily
	 * @return 
	 */
	private boolean beforeUpdatePlanDaily(X6BasicPlanDaily planDaily){
		if(planDaily.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		if(planDaily.getRangeDate() == null){
			throw new RuntimeException("rangeDate不能为空。");
		}
		if(planDaily.getRangePlanId() == null){
			throw new RuntimeException("rangePlanId不能为空。");
		}
		if(planDaily.getRangePlanPart() == null){
			throw new RuntimeException("rangePlanPart不能为空。");
		}
		if(planDaily.getTeam() == null){
			throw new RuntimeException("team不能为空。");
		}
		X6BasicPlanDaily temp = getPlanDaily(planDaily);
		if(temp == null){
			return false;
		}
		planDaily.setVersion(temp.getVersion());
		return true;
	}
	
	private List<X6BasicPlanDaily> clearPlanDailyNonMainField(List<X6BasicPlanDaily> list){
		 List<X6BasicPlanDaily> planDailyList = new ArrayList<X6BasicPlanDaily>();
		 for(X6BasicPlanDaily planDaily:list){
			 X6BasicPlanDaily temp = new X6BasicPlanDaily();
			 temp.setId(planDaily.getId());
			 temp.setVersion(planDaily.getVersion());
		 	 planDailyList.add(temp);
		 }
		 return planDailyList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkPlanDailyData(X6BasicPlanDaily planDaily){
		 if(planDaily.getRangeDate() == null){
		 	throw new RuntimeException("rangeDate不能为空。");
		 }
		 if(planDaily.getRangePlanId() == null){
		 	throw new RuntimeException("rangePlanId不能为空。");
		 }
		 if(planDaily.getRangePlanPart() == null){
		 	throw new RuntimeException("rangePlanPart不能为空。");
		 }
		 if(planDaily.getTeam() == null){
		 	throw new RuntimeException("team不能为空。");
		 }
	}
	 
	//------------------------------------辅模型 WS  排班明细-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据排班明细业务主键分页查询排班明细数据
	 * 
	 * @param 排班明细业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getRangePlanPartPageByRangePlanBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "排班明细跟排班计划没有设置关联！");
	}
	/**
	 * 根据排班明细id分页查询排班明细数据
	 * 
	 * @param 排班明细id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getRangePlanPartPageByRangePlanPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "排班明细跟排班计划没有设置关联！");
	}
	/**
	 * 根据排班明细id分获取排班明细数据
	 * 
	 * @param 排班明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getRangePlanPart(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			X6BasicRangePlanPart rangePlanPart = rangePlanPartService.getRangePlanPart(id);
			if(rangePlanPart == null){
				return set404Error(result);
			}
			setSuccessResult(result, rangePlanPart);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据排班明细业务id修改排班明细数据
	 * 
	 * @param 排班明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateRangePlanPart(
		@WebParam(name="rangePlanPart")X6BasicRangePlanPart rangePlanPart,
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
			if(!beforeUpdateRangePlanPart(rangePlanPart)){
				return set404Error(result);
			}
			rangePlanPartService.saveRangePlanPart(rangePlanPart, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增排班明细
	 * 
	 * @param 排班明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addRangePlanPart(
		@WebParam(name="rangePlanPart")X6BasicRangePlanPart rangePlanPart,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(rangePlanPart == null){
				return set500Error(result, "排班明细对象不能为空。");
			}
			if(rangePlanPart.getId() != null){
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
				checkRangePlanPartData(rangePlanPart);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			rangePlanPartService.saveRangePlanPart(rangePlanPart, null);
			Long rangePlanPartId = rangePlanPart.getId();
			setSuccessResult(result, rangePlanPartId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据排班明细id 删除排班明细
	 * 
	 * @param 排班明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteRangePlanPart(
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
			
			X6BasicRangePlanPart rangePlanPart = null;
			try{
				rangePlanPart = rangePlanPartService.getRangePlanPart(id);
			}catch(NullPointerException e){}
			if(rangePlanPart == null  || !rangePlanPart.isValid()){
				return set404Error(result);
			}
			rangePlanPartService.deleteRangePlanPart(rangePlanPart);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改排班明细数据，排班明细id不能为空
	 *
	 * @param 排班明细列表，每个排班明细必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateRangePlanPart(
		@WebParam(name="rangePlanPartList")List<X6BasicRangePlanPart> rangePlanPartList,
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
			for(X6BasicRangePlanPart rangePlanPart : rangePlanPartList){
				try{
					if(!beforeUpdateRangePlanPart(rangePlanPart)){
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
			
			rangePlanPartService.batchImportBaseRangePlanPart(rangePlanPartList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增排班明细数据
	 * 
	 * @param 排班明细列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddRangePlanPart(
		@WebParam(name="rangePlanPartList")List<X6BasicRangePlanPart> rangePlanPartList,
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
			
			if(rangePlanPartList == null){
				set500Error(result, "rangePlanPartList不能为空。");
				return result;
			}
			
			int count = 1;
			for(X6BasicRangePlanPart rangePlanPart : rangePlanPartList){
				if(rangePlanPart.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkRangePlanPartData(rangePlanPart);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			rangePlanPartService.batchImportBaseRangePlanPart(rangePlanPartList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(X6BasicRangePlanPart rangePlanPart : rangePlanPartList){
				idList.add(rangePlanPart.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据排班明细id，批量删除排班明细数据
	 * 
	 * @param 排班明细id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelRangePlanPart(
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
			
			List<X6BasicRangePlanPart> rangePlanPartList = new ArrayList<X6BasicRangePlanPart>();
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
				
				X6BasicRangePlanPart rangePlanPart = rangePlanPartService.getRangePlanPart(id);
				if(rangePlanPart == null || !rangePlanPart.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				rangePlanPartList.add(rangePlanPart);
				
				count ++;
			}
			for(X6BasicRangePlanPart rangePlanPart : rangePlanPartList){
				rangePlanPartService.deleteRangePlanPart(rangePlanPart);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有排班明细数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getRangePlanPartPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(X6BasicRangePlanPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), X6BasicRangePlanPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicRangePlanPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicRangePlanPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicRangePlanPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<X6BasicRangePlanPart> page = new Page<X6BasicRangePlanPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicRangePlanPart> datas = rangePlanPartService.getByPage(page, detachedCriteria);
			List<X6BasicRangePlanPart> rangePlanPartList = datas.getResult();
			if (rangePlanPartList == null || rangePlanPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(rangePlanPartList.toArray());
			PaginationDTO<X6BasicRangePlanPart> pagination = new PaginationDTO<X6BasicRangePlanPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到排班明细则返回空。
	 * @param rangePlanPart
	 * @return
	 */
	private X6BasicRangePlanPart getRangePlanPart(X6BasicRangePlanPart rangePlanPart) {
		if (rangePlanPart.getId() == null)
			throw new RuntimeException("id不能为空");
		X6BasicRangePlanPart result = rangePlanPartService.getRangePlanPart(rangePlanPart.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果排班明细不存在，返回false；如果原来没有排班计划对象，且修改的时候也没有配置排班计划对象，则报错；如果配置的排班计划对象不存在，则报错；
	 * @param rangePlanPart
	 * @return 
	 */
	private boolean beforeUpdateRangePlanPart(X6BasicRangePlanPart rangePlanPart){
		if(rangePlanPart.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		if(rangePlanPart.getRangePlan() == null){
			throw new RuntimeException("rangePlan不能为空。");
		}
		X6BasicRangePlanPart temp = getRangePlanPart(rangePlanPart);
		if(temp == null){
			return false;
		}
		rangePlanPart.setVersion(temp.getVersion());
		return true;
	}
	
	private List<X6BasicRangePlanPart> clearRangePlanPartNonMainField(List<X6BasicRangePlanPart> list){
		 List<X6BasicRangePlanPart> rangePlanPartList = new ArrayList<X6BasicRangePlanPart>();
		 for(X6BasicRangePlanPart rangePlanPart:list){
			 X6BasicRangePlanPart temp = new X6BasicRangePlanPart();
			 temp.setId(rangePlanPart.getId());
			 temp.setVersion(rangePlanPart.getVersion());
		 	 rangePlanPartList.add(temp);
		 }
		 return rangePlanPartList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkRangePlanPartData(X6BasicRangePlanPart rangePlanPart){
		 if(rangePlanPart.getRangePlan() == null){
		 	throw new RuntimeException("rangePlan不能为空。");
		 }
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
	 * 获取排班计划对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param rangePlan
	 * @return
	 */
	private X6BasicRangePlan getRangePlan(X6BasicRangePlan rangePlan) {
		if (rangePlan.getId() == null && (rangePlan.getId() == null || rangePlan.getId().toString().trim() == ""))
			throw new RuntimeException("排班计划对象业务主键和id不能同时为空");
		if (rangePlan.getId() != null) {
			X6BasicRangePlan result = rangePlanService.getRangePlan(rangePlan .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return rangePlanService.loadRangePlanByBussinessKey(rangePlan.getId());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个排班计划，则返回false，否则返回true
	 * @param rangePlan
	 */
	private boolean beforeUpdateRangePlan(X6BasicRangePlan rangePlan) {
		if(rangePlan.getRangeDate() == null){
			throw new RuntimeException("rangeDate不能为空。");
		}
		if(rangePlan.getWorkLine() == null){
			throw new RuntimeException("workLine不能为空。");
		}
		X6BasicRangePlan temp = getRangePlan(rangePlan);
		if (temp == null) {
			return false;
		}
		if(rangePlan.getId() == null){
			rangePlan.setId(temp.getId());		
		}
		if(rangePlan.getId() == null){
			rangePlan.setId(temp.getId());
		}
		
		rangePlan.setVersion(temp.getVersion());
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
	 * 清除排班计划对象下所有辅模型对象中的排班计划对象
	 * @param rangePlan
	 */
	private void clearCircle(X6BasicRangePlan rangePlan) {
	
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
	private void checkRangePlanData(X6BasicRangePlan rangePlan){
		 if(rangePlan.getRangeDate() == null){
		 	throw new RuntimeException("rangeDate不能为空。");
		 }
		 if(rangePlan.getWorkLine() == null){
		 	throw new RuntimeException("workLine不能为空。");
		 }
	}
	/* CUSTOM CODE START(wsserviceimpl,functions,X6Basic_1.0_rangePlan_RangePlan,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}