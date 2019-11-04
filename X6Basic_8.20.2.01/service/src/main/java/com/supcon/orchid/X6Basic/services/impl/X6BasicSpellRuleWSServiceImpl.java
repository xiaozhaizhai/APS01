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
import com.supcon.orchid.X6Basic.services.X6BasicSpellRuleWSService;
import com.supcon.orchid.X6Basic.services.X6BasicSpellRuleService;
import com.supcon.orchid.X6Basic.services.X6BasicSpellRulePartService;
/* CUSTOM CODE START(wsserviceimpl,import,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="X6BasicSpellRule",targetNamespace = "http://ws.supcon.com")
public class X6BasicSpellRuleWSServiceImpl implements X6BasicSpellRuleWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private X6BasicSpellRuleService spellRuleService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private X6BasicSpellRulePartService spellRulePartService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取轮班规则数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getSpellRuleByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			X6BasicSpellRule spellRule = spellRuleService.loadSpellRuleByBussinessKey(businessKey);
			if(spellRule == null){
				return set404Error(result);
			}
			//添加辅模型
			List<X6BasicSpellRulePart> spellRulePartList = clearSpellRulePartNonMainField(spellRuleService.getSpellRulePartList(spellRule));
			spellRule.setSpellRulePartList(spellRulePartList);
			
			setSuccessResult(result, spellRule);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取轮班规则数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getSpellRuleByPk(
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
			
			X6BasicSpellRule spellRule = spellRuleService.getSpellRule(id);
			if(spellRule == null || !spellRule.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<X6BasicSpellRulePart> spellRulePartList = clearSpellRulePartNonMainField(spellRuleService.getSpellRulePartList(spellRule));
			spellRule.setSpellRulePartList(spellRulePartList);
			setSuccessResult(result, spellRule);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改轮班规则数据
	 * @param 轮班规则对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateSpellRule(
		@WebParam(name="spellRule")X6BasicSpellRule spellRule,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(spellRule == null){
				return set500Error(result, "轮班规则不能为空。");
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
			
			if(!beforeUpdateSpellRule(spellRule)){
				return set404Error(result);
			}
			spellRuleService.saveSpellRule(spellRule, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addSpellRule(
		@WebParam(name="spellRule")X6BasicSpellRule spellRule,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(spellRule == null){
				return set500Error(result, "轮班规则不能为空。");
			}
		
			if(spellRule.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(spellRule.getId() == null){
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
				checkSpellRuleData(spellRule);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			spellRuleService.saveSpellRule(spellRule, null);
			setSuccessResult(result, spellRule.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteSpellRuleByBusinessKey(
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
			X6BasicSpellRule spellRule = null;
			try{
				spellRule = spellRuleService.loadSpellRuleByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(spellRule == null){
				return set404Error(result);
			}
			spellRuleService.deleteSpellRule(spellRule);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteSpellRuleByPk(
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
			X6BasicSpellRule spellRule = null;
			try{
				spellRule = spellRuleService.getSpellRule(id);
			}catch(NullPointerException e){}
			if(spellRule == null || !spellRule.isValid()){
				return set404Error(result);
			}
			spellRuleService.deleteSpellRule(spellRule);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddSpellRule(
		@WebParam(name="spellRuleList")List<X6BasicSpellRule> spellRuleList,
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
			for(X6BasicSpellRule spellRule : spellRuleList){
				if(spellRule.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(spellRule.getId() == null || spellRule.getId().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkSpellRuleData(spellRule);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			spellRuleService.batchImportBaseSpellRule(spellRuleList);
			for(X6BasicSpellRule spellRule : spellRuleList){
				idList.add(spellRule.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateSpellRule(
		@WebParam(name="spellRuleList")List<X6BasicSpellRule> spellRuleList,
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
			for(X6BasicSpellRule spellRule : spellRuleList){
				try{
					if(!beforeUpdateSpellRule(spellRule)){
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
			spellRuleService.batchImportBaseSpellRule(spellRuleList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteSpellRuleByPk(
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
				X6BasicSpellRule temp = null;
				try{
					temp = spellRuleService.getSpellRule(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			spellRuleService.deleteSpellRule(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteSpellRuleByBusinessKey(
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
				X6BasicSpellRule temp = null;
				try{
					temp = spellRuleService.loadSpellRuleByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			spellRuleService.deleteSpellRule(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getSpellRulePage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRule.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),X6BasicSpellRule.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRule.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicSpellRule.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRule.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<X6BasicSpellRule> page = new Page<X6BasicSpellRule>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicSpellRule> datas = spellRuleService.getByPage(page, detachedCriteria);
			List<X6BasicSpellRule> spellRuleList = datas.getResult();
			if (spellRuleList == null || spellRuleList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(spellRuleList.toArray());
			PaginationDTO<X6BasicSpellRule> pagination = new PaginationDTO<X6BasicSpellRule>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据轮班规则业务主键查询轮班规则下所有辅模型
	 * @param 轮班规则业务主键
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
			X6BasicSpellRule spellRule = spellRuleService.loadSpellRuleByBussinessKey(businessKey);
			if (spellRule == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap spellRulePartMap = new SimulationMap();
			spellRulePartMap.setName(InternationalResource.get("SpellRulePart"));
			spellRulePartMap.setList(spellRuleService.getSpellRulePartList(spellRule));
			resultList.add(spellRulePartMap);
			
			clearCircle(spellRule);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据轮班规则id查询轮班规则下所有辅模型
	 * 
	 * @param 轮班规则id
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
			X6BasicSpellRule spellRule = spellRuleService.getSpellRule(id);
			if (spellRule == null || !spellRule.isValid()) {
				result.setErrorMessage("找不到轮班规则");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap spellRulePartMap = new SimulationMap();
			spellRulePartMap.setName(InternationalResource.get("SpellRulePart"));
			spellRulePartMap.setList(spellRuleService.getSpellRulePartList(spellRule));
			resultList.add(spellRulePartMap);
			
			clearCircle(spellRule);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  班次明细-------------------------------------------------
	//--hasLink:true---link:SpellRule
	/**
	 * 根据班次明细业务主键分页查询班次明细数据
	 * 
	 * @param 班次明细业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getSpellRulePartPageBySpellRuleBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRulePart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), X6BasicSpellRulePart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRulePart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicSpellRulePart.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRulePart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			X6BasicSpellRule spellRule = spellRuleService.loadSpellRuleByBussinessKey(businessKey);
			if (spellRule == null) {
				return set500Error(result, "该业务主键的轮班规则不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("spellRule",spellRule));
			Page<X6BasicSpellRulePart> page = new Page<X6BasicSpellRulePart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicSpellRulePart> datas = spellRulePartService.getByPage(page, detachedCriteria);
			List<X6BasicSpellRulePart> spellRulePartList = datas.getResult();
			if (spellRulePartList == null || spellRulePartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(spellRulePartList.toArray());
			PaginationDTO<X6BasicSpellRulePart> pagination = new PaginationDTO<X6BasicSpellRulePart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据班次明细id分页查询班次明细数据
	 * 
	 * @param 班次明细id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getSpellRulePartPageBySpellRulePk(	
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRulePart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), X6BasicSpellRulePart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRulePart.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicSpellRulePart.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRulePart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			X6BasicSpellRule spellRule = spellRuleService.getSpellRule(id);
			if (spellRule == null) {
				return set500Error(result, "该主键的轮班规则不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("spellRule",spellRule));
			Page<X6BasicSpellRulePart> page = new Page<X6BasicSpellRulePart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicSpellRulePart> datas = spellRulePartService.getByPage(page, detachedCriteria);
			List<X6BasicSpellRulePart> spellRulePartList = datas.getResult();
			if (spellRulePartList == null || spellRulePartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(spellRulePartList.toArray());
			PaginationDTO<X6BasicSpellRulePart> pagination = new PaginationDTO<X6BasicSpellRulePart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据班次明细id分获取班次明细数据
	 * 
	 * @param 班次明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getSpellRulePart(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			X6BasicSpellRulePart spellRulePart = spellRulePartService.getSpellRulePart(id);
			if(spellRulePart == null){
				return set404Error(result);
			}
			setSuccessResult(result, spellRulePart);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据班次明细业务id修改班次明细数据
	 * 
	 * @param 班次明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateSpellRulePart(
		@WebParam(name="spellRulePart")X6BasicSpellRulePart spellRulePart,
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
			if(!beforeUpdateSpellRulePart(spellRulePart)){
				return set404Error(result);
			}
			spellRulePartService.saveSpellRulePart(spellRulePart, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增班次明细
	 * 
	 * @param 班次明细对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addSpellRulePart(
		@WebParam(name="spellRulePart")X6BasicSpellRulePart spellRulePart,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(spellRulePart == null){
				return set500Error(result, "班次明细对象不能为空。");
			}
			if(spellRulePart.getId() != null){
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
				checkSpellRulePartData(spellRulePart);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			X6BasicSpellRule tempSpellRule = spellRulePart.getSpellRule();
			if (tempSpellRule == null) {
				return set500Error(result, "轮班规则对象不能为空");
			}
			
			X6BasicSpellRule spellRule = null;
			if(tempSpellRule.getId()!= null){
				spellRule = spellRuleService.getSpellRule(tempSpellRule.getId());
			}else if(tempSpellRule.getId() != null){
				spellRule = spellRuleService.loadSpellRuleByBussinessKey(tempSpellRule.getId());
			}else{
				return set500Error(result, "轮班规则对象必须设置id或业务主键。");
			}
			
			if(spellRule == null){
				return set404Error(result);
			}
			spellRulePart.setSpellRule(spellRule);
			
			spellRulePartService.saveSpellRulePart(spellRulePart, null);
			Long spellRulePartId = spellRulePart.getId();
			setSuccessResult(result, spellRulePartId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据班次明细id 删除班次明细
	 * 
	 * @param 班次明细id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteSpellRulePart(
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
			
			X6BasicSpellRulePart spellRulePart = null;
			try{
				spellRulePart = spellRulePartService.getSpellRulePart(id);
			}catch(NullPointerException e){}
			if(spellRulePart == null  || !spellRulePart.isValid()){
				return set404Error(result);
			}
			spellRulePartService.deleteSpellRulePart(spellRulePart);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改班次明细数据，班次明细id不能为空
	 *
	 * @param 班次明细列表，每个班次明细必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateSpellRulePart(
		@WebParam(name="spellRulePartList")List<X6BasicSpellRulePart> spellRulePartList,
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
			for(X6BasicSpellRulePart spellRulePart : spellRulePartList){
				try{
					if(!beforeUpdateSpellRulePart(spellRulePart)){
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
			
			spellRulePartService.batchImportBaseSpellRulePart(spellRulePartList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增班次明细数据
	 * 
	 * @param 班次明细列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddSpellRulePart(
		@WebParam(name="spellRulePartList")List<X6BasicSpellRulePart> spellRulePartList,
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
			
			if(spellRulePartList == null){
				set500Error(result, "spellRulePartList不能为空。");
				return result;
			}
			
			int count = 1;
			for(X6BasicSpellRulePart spellRulePart : spellRulePartList){
				if(spellRulePart.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(spellRulePart.getSpellRule() == null){
						set500Error(result, "第"+count+"条数据出错：轮班规则对象不能为空。");
						return result;
					}
					X6BasicSpellRule spellRule = getSpellRule(spellRulePart.getSpellRule());
					if(spellRule == null){
						set500Error(result, "第"+count+"条数据出错：轮班规则对象不存在。");
						return result;
					}
					spellRulePart.setSpellRule(spellRule);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkSpellRulePartData(spellRulePart);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			spellRulePartService.batchImportBaseSpellRulePart(spellRulePartList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(X6BasicSpellRulePart spellRulePart : spellRulePartList){
				idList.add(spellRulePart.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据班次明细id，批量删除班次明细数据
	 * 
	 * @param 班次明细id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelSpellRulePart(
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
			
			List<X6BasicSpellRulePart> spellRulePartList = new ArrayList<X6BasicSpellRulePart>();
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
				
				X6BasicSpellRulePart spellRulePart = spellRulePartService.getSpellRulePart(id);
				if(spellRulePart == null || !spellRulePart.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				spellRulePartList.add(spellRulePart);
				
				count ++;
			}
			for(X6BasicSpellRulePart spellRulePart : spellRulePartList){
				spellRulePartService.deleteSpellRulePart(spellRulePart);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有班次明细数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getSpellRulePartPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRulePart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), X6BasicSpellRulePart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRulePart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicSpellRulePart.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicSpellRulePart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<X6BasicSpellRulePart> page = new Page<X6BasicSpellRulePart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicSpellRulePart> datas = spellRulePartService.getByPage(page, detachedCriteria);
			List<X6BasicSpellRulePart> spellRulePartList = datas.getResult();
			if (spellRulePartList == null || spellRulePartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(spellRulePartList.toArray());
			PaginationDTO<X6BasicSpellRulePart> pagination = new PaginationDTO<X6BasicSpellRulePart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到班次明细则返回空。
	 * @param spellRulePart
	 * @return
	 */
	private X6BasicSpellRulePart getSpellRulePart(X6BasicSpellRulePart spellRulePart) {
		if (spellRulePart.getId() == null)
			throw new RuntimeException("id不能为空");
		X6BasicSpellRulePart result = spellRulePartService.getSpellRulePart(spellRulePart.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果班次明细不存在，返回false；如果原来没有轮班规则对象，且修改的时候也没有配置轮班规则对象，则报错；如果配置的轮班规则对象不存在，则报错；
	 * @param spellRulePart
	 * @return 
	 */
	private boolean beforeUpdateSpellRulePart(X6BasicSpellRulePart spellRulePart){
		if(spellRulePart.getEndTime() == null){
			throw new RuntimeException("endTime不能为空。");
		}
		if(spellRulePart.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		if(spellRulePart.getStartTime() == null){
			throw new RuntimeException("startTime不能为空。");
		}
		if(spellRulePart.getTeamOrder() == null){
			throw new RuntimeException("teamOrder不能为空。");
		}
		X6BasicSpellRulePart temp = getSpellRulePart(spellRulePart);
		if(temp == null){
			return false;
		}
		X6BasicSpellRule spellRule = null;
		if (temp.getSpellRule() == null) {
			if (spellRulePart.getSpellRule() == null || (spellRulePart.getSpellRule().getId() == null && spellRulePart.getSpellRule().getId() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				spellRule = getSpellRule(spellRulePart.getSpellRule());
				if(spellRule == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (spellRulePart.getSpellRule() == null || (spellRulePart.getSpellRule().getId() == null && spellRulePart.getSpellRule().getId() == null)) {
				spellRule = temp.getSpellRule();
			} else {
				spellRule = getSpellRule(spellRulePart.getSpellRule());
				if (spellRule == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		spellRulePart.setSpellRule(spellRule);
		spellRulePart.setVersion(temp.getVersion());
		return true;
	}
	
	private List<X6BasicSpellRulePart> clearSpellRulePartNonMainField(List<X6BasicSpellRulePart> list){
		 List<X6BasicSpellRulePart> spellRulePartList = new ArrayList<X6BasicSpellRulePart>();
		 for(X6BasicSpellRulePart spellRulePart:list){
			 X6BasicSpellRulePart temp = new X6BasicSpellRulePart();
			 temp.setId(spellRulePart.getId());
			 temp.setVersion(spellRulePart.getVersion());
		 	 spellRulePartList.add(temp);
		 }
		 return spellRulePartList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkSpellRulePartData(X6BasicSpellRulePart spellRulePart){
		 if(spellRulePart.getEndTime() == null){
		 	throw new RuntimeException("endTime不能为空。");
		 }
		 if(spellRulePart.getStartTime() == null){
		 	throw new RuntimeException("startTime不能为空。");
		 }
		 if(spellRulePart.getTeamOrder() == null){
		 	throw new RuntimeException("teamOrder不能为空。");
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
	 * 获取轮班规则对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param spellRule
	 * @return
	 */
	private X6BasicSpellRule getSpellRule(X6BasicSpellRule spellRule) {
		if (spellRule.getId() == null && (spellRule.getId() == null || spellRule.getId().toString().trim() == ""))
			throw new RuntimeException("轮班规则对象业务主键和id不能同时为空");
		if (spellRule.getId() != null) {
			X6BasicSpellRule result = spellRuleService.getSpellRule(spellRule .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return spellRuleService.loadSpellRuleByBussinessKey(spellRule.getId());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个轮班规则，则返回false，否则返回true
	 * @param spellRule
	 */
	private boolean beforeUpdateSpellRule(X6BasicSpellRule spellRule) {
		if(spellRule.getCode() == null){
			throw new RuntimeException("code不能为空。");
		}
		if(spellRule.getName() == null){
			throw new RuntimeException("name不能为空。");
		}
		X6BasicSpellRule temp = getSpellRule(spellRule);
		if (temp == null) {
			return false;
		}
		if(spellRule.getId() == null){
			spellRule.setId(temp.getId());		
		}
		if(spellRule.getId() == null){
			spellRule.setId(temp.getId());
		}
		
		spellRule.setVersion(temp.getVersion());
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
	 * 清除轮班规则对象下所有辅模型对象中的轮班规则对象
	 * @param spellRule
	 */
	private void clearCircle(X6BasicSpellRule spellRule) {
		if (spellRule.getSpellRulePartList() != null && spellRule.getSpellRulePartList().size() > 0) {
			for (X6BasicSpellRulePart spellRulePart : spellRule.getSpellRulePartList()) {
				spellRulePart.setSpellRule(null);
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
	private void checkSpellRuleData(X6BasicSpellRule spellRule){
		 if(spellRule.getCode() == null){
		 	throw new RuntimeException("code不能为空。");
		 }
		 if(spellRule.getName() == null){
		 	throw new RuntimeException("name不能为空。");
		 }
	}
	/* CUSTOM CODE START(wsserviceimpl,functions,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}