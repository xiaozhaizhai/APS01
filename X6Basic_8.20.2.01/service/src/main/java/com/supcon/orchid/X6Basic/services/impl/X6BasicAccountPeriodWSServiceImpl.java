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
import com.supcon.orchid.X6Basic.services.X6BasicAccountPeriodWSService;
import com.supcon.orchid.X6Basic.services.X6BasicAccountPeriodService;
import com.supcon.orchid.X6Basic.services.X6BasicAccountPeriodPartService;
/* CUSTOM CODE START(wsserviceimpl,import,X6Basic_1.0_accountingPeriod_AccountPeriod,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="X6BasicAccountPeriod",targetNamespace = "http://ws.supcon.com")
public class X6BasicAccountPeriodWSServiceImpl implements X6BasicAccountPeriodWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private X6BasicAccountPeriodService accountPeriodService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private X6BasicAccountPeriodPartService accountPeriodPartService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取会计期数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getAccountPeriodByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			X6BasicAccountPeriod accountPeriod = accountPeriodService.loadAccountPeriodByBussinessKey(businessKey);
			if(accountPeriod == null){
				return set404Error(result);
			}
			//添加辅模型
			List<X6BasicAccountPeriodPart> accountPeriodPartList = clearAccountPeriodPartNonMainField(accountPeriodService.getAccountPeriodPartList(accountPeriod));
			accountPeriod.setAccountPeriodPartList(accountPeriodPartList);
			
			setSuccessResult(result, accountPeriod);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取会计期数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getAccountPeriodByPk(
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
			
			X6BasicAccountPeriod accountPeriod = accountPeriodService.getAccountPeriod(id);
			if(accountPeriod == null || !accountPeriod.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<X6BasicAccountPeriodPart> accountPeriodPartList = clearAccountPeriodPartNonMainField(accountPeriodService.getAccountPeriodPartList(accountPeriod));
			accountPeriod.setAccountPeriodPartList(accountPeriodPartList);
			setSuccessResult(result, accountPeriod);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改会计期数据
	 * @param 会计期对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateAccountPeriod(
		@WebParam(name="accountPeriod")X6BasicAccountPeriod accountPeriod,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(accountPeriod == null){
				return set500Error(result, "会计期不能为空。");
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
			
			if(!beforeUpdateAccountPeriod(accountPeriod)){
				return set404Error(result);
			}
			accountPeriodService.saveAccountPeriod(accountPeriod, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addAccountPeriod(
		@WebParam(name="accountPeriod")X6BasicAccountPeriod accountPeriod,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(accountPeriod == null){
				return set500Error(result, "会计期不能为空。");
			}
		
			if(accountPeriod.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(accountPeriod.getId() == null){
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
				checkAccountPeriodData(accountPeriod);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			accountPeriodService.saveAccountPeriod(accountPeriod, null);
			setSuccessResult(result, accountPeriod.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteAccountPeriodByBusinessKey(
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
			X6BasicAccountPeriod accountPeriod = null;
			try{
				accountPeriod = accountPeriodService.loadAccountPeriodByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(accountPeriod == null){
				return set404Error(result);
			}
			accountPeriodService.deleteAccountPeriod(accountPeriod);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteAccountPeriodByPk(
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
			X6BasicAccountPeriod accountPeriod = null;
			try{
				accountPeriod = accountPeriodService.getAccountPeriod(id);
			}catch(NullPointerException e){}
			if(accountPeriod == null || !accountPeriod.isValid()){
				return set404Error(result);
			}
			accountPeriodService.deleteAccountPeriod(accountPeriod);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddAccountPeriod(
		@WebParam(name="accountPeriodList")List<X6BasicAccountPeriod> accountPeriodList,
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
			for(X6BasicAccountPeriod accountPeriod : accountPeriodList){
				if(accountPeriod.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(accountPeriod.getId() == null || accountPeriod.getId().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkAccountPeriodData(accountPeriod);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			accountPeriodService.batchImportBaseAccountPeriod(accountPeriodList);
			for(X6BasicAccountPeriod accountPeriod : accountPeriodList){
				idList.add(accountPeriod.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateAccountPeriod(
		@WebParam(name="accountPeriodList")List<X6BasicAccountPeriod> accountPeriodList,
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
			for(X6BasicAccountPeriod accountPeriod : accountPeriodList){
				try{
					if(!beforeUpdateAccountPeriod(accountPeriod)){
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
			accountPeriodService.batchImportBaseAccountPeriod(accountPeriodList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteAccountPeriodByPk(
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
				X6BasicAccountPeriod temp = null;
				try{
					temp = accountPeriodService.getAccountPeriod(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			accountPeriodService.deleteAccountPeriod(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteAccountPeriodByBusinessKey(
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
				X6BasicAccountPeriod temp = null;
				try{
					temp = accountPeriodService.loadAccountPeriodByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			accountPeriodService.deleteAccountPeriod(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getAccountPeriodPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriod.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),X6BasicAccountPeriod.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriod.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicAccountPeriod.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriod.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<X6BasicAccountPeriod> page = new Page<X6BasicAccountPeriod>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicAccountPeriod> datas = accountPeriodService.getByPage(page, detachedCriteria);
			List<X6BasicAccountPeriod> accountPeriodList = datas.getResult();
			if (accountPeriodList == null || accountPeriodList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(accountPeriodList.toArray());
			PaginationDTO<X6BasicAccountPeriod> pagination = new PaginationDTO<X6BasicAccountPeriod>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据会计期业务主键查询会计期下所有辅模型
	 * @param 会计期业务主键
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
			X6BasicAccountPeriod accountPeriod = accountPeriodService.loadAccountPeriodByBussinessKey(businessKey);
			if (accountPeriod == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap accountPeriodPartMap = new SimulationMap();
			accountPeriodPartMap.setName(InternationalResource.get("AccountPeriodPart"));
			accountPeriodPartMap.setList(accountPeriodService.getAccountPeriodPartList(accountPeriod));
			resultList.add(accountPeriodPartMap);
			
			clearCircle(accountPeriod);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据会计期id查询会计期下所有辅模型
	 * 
	 * @param 会计期id
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
			X6BasicAccountPeriod accountPeriod = accountPeriodService.getAccountPeriod(id);
			if (accountPeriod == null || !accountPeriod.isValid()) {
				result.setErrorMessage("找不到会计期");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap accountPeriodPartMap = new SimulationMap();
			accountPeriodPartMap.setName(InternationalResource.get("AccountPeriodPart"));
			accountPeriodPartMap.setList(accountPeriodService.getAccountPeriodPartList(accountPeriod));
			resultList.add(accountPeriodPartMap);
			
			clearCircle(accountPeriod);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  月份期间-------------------------------------------------
	//--hasLink:true---link:AccountPeriod
	/**
	 * 根据月份期间业务主键分页查询月份期间数据
	 * 
	 * @param 月份期间业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getAccountPeriodPartPageByAccountPeriodBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriodPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), X6BasicAccountPeriodPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriodPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicAccountPeriodPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriodPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			X6BasicAccountPeriod accountPeriod = accountPeriodService.loadAccountPeriodByBussinessKey(businessKey);
			if (accountPeriod == null) {
				return set500Error(result, "该业务主键的会计期不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("accountPeriod",accountPeriod));
			Page<X6BasicAccountPeriodPart> page = new Page<X6BasicAccountPeriodPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicAccountPeriodPart> datas = accountPeriodPartService.getByPage(page, detachedCriteria);
			List<X6BasicAccountPeriodPart> accountPeriodPartList = datas.getResult();
			if (accountPeriodPartList == null || accountPeriodPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(accountPeriodPartList.toArray());
			PaginationDTO<X6BasicAccountPeriodPart> pagination = new PaginationDTO<X6BasicAccountPeriodPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据月份期间id分页查询月份期间数据
	 * 
	 * @param 月份期间id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getAccountPeriodPartPageByAccountPeriodPk(	
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriodPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), X6BasicAccountPeriodPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriodPart.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicAccountPeriodPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriodPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			X6BasicAccountPeriod accountPeriod = accountPeriodService.getAccountPeriod(id);
			if (accountPeriod == null) {
				return set500Error(result, "该主键的会计期不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("accountPeriod",accountPeriod));
			Page<X6BasicAccountPeriodPart> page = new Page<X6BasicAccountPeriodPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicAccountPeriodPart> datas = accountPeriodPartService.getByPage(page, detachedCriteria);
			List<X6BasicAccountPeriodPart> accountPeriodPartList = datas.getResult();
			if (accountPeriodPartList == null || accountPeriodPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(accountPeriodPartList.toArray());
			PaginationDTO<X6BasicAccountPeriodPart> pagination = new PaginationDTO<X6BasicAccountPeriodPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据月份期间id分获取月份期间数据
	 * 
	 * @param 月份期间id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getAccountPeriodPart(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			X6BasicAccountPeriodPart accountPeriodPart = accountPeriodPartService.getAccountPeriodPart(id);
			if(accountPeriodPart == null){
				return set404Error(result);
			}
			setSuccessResult(result, accountPeriodPart);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据月份期间业务id修改月份期间数据
	 * 
	 * @param 月份期间对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateAccountPeriodPart(
		@WebParam(name="accountPeriodPart")X6BasicAccountPeriodPart accountPeriodPart,
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
			if(!beforeUpdateAccountPeriodPart(accountPeriodPart)){
				return set404Error(result);
			}
			accountPeriodPartService.saveAccountPeriodPart(accountPeriodPart, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增月份期间
	 * 
	 * @param 月份期间对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addAccountPeriodPart(
		@WebParam(name="accountPeriodPart")X6BasicAccountPeriodPart accountPeriodPart,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(accountPeriodPart == null){
				return set500Error(result, "月份期间对象不能为空。");
			}
			if(accountPeriodPart.getId() != null){
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
				checkAccountPeriodPartData(accountPeriodPart);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			X6BasicAccountPeriod tempAccountPeriod = accountPeriodPart.getAccountPeriod();
			if (tempAccountPeriod == null) {
				return set500Error(result, "会计期对象不能为空");
			}
			
			X6BasicAccountPeriod accountPeriod = null;
			if(tempAccountPeriod.getId()!= null){
				accountPeriod = accountPeriodService.getAccountPeriod(tempAccountPeriod.getId());
			}else if(tempAccountPeriod.getId() != null){
				accountPeriod = accountPeriodService.loadAccountPeriodByBussinessKey(tempAccountPeriod.getId());
			}else{
				return set500Error(result, "会计期对象必须设置id或业务主键。");
			}
			
			if(accountPeriod == null){
				return set404Error(result);
			}
			accountPeriodPart.setAccountPeriod(accountPeriod);
			
			accountPeriodPartService.saveAccountPeriodPart(accountPeriodPart, null);
			Long accountPeriodPartId = accountPeriodPart.getId();
			setSuccessResult(result, accountPeriodPartId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据月份期间id 删除月份期间
	 * 
	 * @param 月份期间id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteAccountPeriodPart(
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
			
			X6BasicAccountPeriodPart accountPeriodPart = null;
			try{
				accountPeriodPart = accountPeriodPartService.getAccountPeriodPart(id);
			}catch(NullPointerException e){}
			if(accountPeriodPart == null  || !accountPeriodPart.isValid()){
				return set404Error(result);
			}
			accountPeriodPartService.deleteAccountPeriodPart(accountPeriodPart);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改月份期间数据，月份期间id不能为空
	 *
	 * @param 月份期间列表，每个月份期间必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateAccountPeriodPart(
		@WebParam(name="accountPeriodPartList")List<X6BasicAccountPeriodPart> accountPeriodPartList,
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
			for(X6BasicAccountPeriodPart accountPeriodPart : accountPeriodPartList){
				try{
					if(!beforeUpdateAccountPeriodPart(accountPeriodPart)){
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
			
			accountPeriodPartService.batchImportBaseAccountPeriodPart(accountPeriodPartList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增月份期间数据
	 * 
	 * @param 月份期间列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddAccountPeriodPart(
		@WebParam(name="accountPeriodPartList")List<X6BasicAccountPeriodPart> accountPeriodPartList,
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
			
			if(accountPeriodPartList == null){
				set500Error(result, "accountPeriodPartList不能为空。");
				return result;
			}
			
			int count = 1;
			for(X6BasicAccountPeriodPart accountPeriodPart : accountPeriodPartList){
				if(accountPeriodPart.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(accountPeriodPart.getAccountPeriod() == null){
						set500Error(result, "第"+count+"条数据出错：会计期对象不能为空。");
						return result;
					}
					X6BasicAccountPeriod accountPeriod = getAccountPeriod(accountPeriodPart.getAccountPeriod());
					if(accountPeriod == null){
						set500Error(result, "第"+count+"条数据出错：会计期对象不存在。");
						return result;
					}
					accountPeriodPart.setAccountPeriod(accountPeriod);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkAccountPeriodPartData(accountPeriodPart);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			accountPeriodPartService.batchImportBaseAccountPeriodPart(accountPeriodPartList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(X6BasicAccountPeriodPart accountPeriodPart : accountPeriodPartList){
				idList.add(accountPeriodPart.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据月份期间id，批量删除月份期间数据
	 * 
	 * @param 月份期间id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelAccountPeriodPart(
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
			
			List<X6BasicAccountPeriodPart> accountPeriodPartList = new ArrayList<X6BasicAccountPeriodPart>();
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
				
				X6BasicAccountPeriodPart accountPeriodPart = accountPeriodPartService.getAccountPeriodPart(id);
				if(accountPeriodPart == null || !accountPeriodPart.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				accountPeriodPartList.add(accountPeriodPart);
				
				count ++;
			}
			for(X6BasicAccountPeriodPart accountPeriodPart : accountPeriodPartList){
				accountPeriodPartService.deleteAccountPeriodPart(accountPeriodPart);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有月份期间数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getAccountPeriodPartPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriodPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), X6BasicAccountPeriodPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriodPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicAccountPeriodPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicAccountPeriodPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<X6BasicAccountPeriodPart> page = new Page<X6BasicAccountPeriodPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicAccountPeriodPart> datas = accountPeriodPartService.getByPage(page, detachedCriteria);
			List<X6BasicAccountPeriodPart> accountPeriodPartList = datas.getResult();
			if (accountPeriodPartList == null || accountPeriodPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(accountPeriodPartList.toArray());
			PaginationDTO<X6BasicAccountPeriodPart> pagination = new PaginationDTO<X6BasicAccountPeriodPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到月份期间则返回空。
	 * @param accountPeriodPart
	 * @return
	 */
	private X6BasicAccountPeriodPart getAccountPeriodPart(X6BasicAccountPeriodPart accountPeriodPart) {
		if (accountPeriodPart.getId() == null)
			throw new RuntimeException("id不能为空");
		X6BasicAccountPeriodPart result = accountPeriodPartService.getAccountPeriodPart(accountPeriodPart.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果月份期间不存在，返回false；如果原来没有会计期对象，且修改的时候也没有配置会计期对象，则报错；如果配置的会计期对象不存在，则报错；
	 * @param accountPeriodPart
	 * @return 
	 */
	private boolean beforeUpdateAccountPeriodPart(X6BasicAccountPeriodPart accountPeriodPart){
		if(accountPeriodPart.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		X6BasicAccountPeriodPart temp = getAccountPeriodPart(accountPeriodPart);
		if(temp == null){
			return false;
		}
		X6BasicAccountPeriod accountPeriod = null;
		if (temp.getAccountPeriod() == null) {
			if (accountPeriodPart.getAccountPeriod() == null || (accountPeriodPart.getAccountPeriod().getId() == null && accountPeriodPart.getAccountPeriod().getId() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				accountPeriod = getAccountPeriod(accountPeriodPart.getAccountPeriod());
				if(accountPeriod == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (accountPeriodPart.getAccountPeriod() == null || (accountPeriodPart.getAccountPeriod().getId() == null && accountPeriodPart.getAccountPeriod().getId() == null)) {
				accountPeriod = temp.getAccountPeriod();
			} else {
				accountPeriod = getAccountPeriod(accountPeriodPart.getAccountPeriod());
				if (accountPeriod == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		accountPeriodPart.setAccountPeriod(accountPeriod);
		accountPeriodPart.setVersion(temp.getVersion());
		return true;
	}
	
	private List<X6BasicAccountPeriodPart> clearAccountPeriodPartNonMainField(List<X6BasicAccountPeriodPart> list){
		 List<X6BasicAccountPeriodPart> accountPeriodPartList = new ArrayList<X6BasicAccountPeriodPart>();
		 for(X6BasicAccountPeriodPart accountPeriodPart:list){
			 X6BasicAccountPeriodPart temp = new X6BasicAccountPeriodPart();
			 temp.setId(accountPeriodPart.getId());
		 	 accountPeriodPartList.add(temp);
		 }
		 return accountPeriodPartList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkAccountPeriodPartData(X6BasicAccountPeriodPart accountPeriodPart){
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
	 * 获取会计期对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param accountPeriod
	 * @return
	 */
	private X6BasicAccountPeriod getAccountPeriod(X6BasicAccountPeriod accountPeriod) {
		if (accountPeriod.getId() == null && (accountPeriod.getId() == null || accountPeriod.getId().toString().trim() == ""))
			throw new RuntimeException("会计期对象业务主键和id不能同时为空");
		if (accountPeriod.getId() != null) {
			X6BasicAccountPeriod result = accountPeriodService.getAccountPeriod(accountPeriod .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return accountPeriodService.loadAccountPeriodByBussinessKey(accountPeriod.getId());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个会计期，则返回false，否则返回true
	 * @param accountPeriod
	 */
	private boolean beforeUpdateAccountPeriod(X6BasicAccountPeriod accountPeriod) {
		if(accountPeriod.getYear() == null){
			throw new RuntimeException("year不能为空。");
		}
		X6BasicAccountPeriod temp = getAccountPeriod(accountPeriod);
		if (temp == null) {
			return false;
		}
		if(accountPeriod.getId() == null){
			accountPeriod.setId(temp.getId());		
		}
		if(accountPeriod.getId() == null){
			accountPeriod.setId(temp.getId());
		}
		
		accountPeriod.setVersion(temp.getVersion());
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
	 * 清除会计期对象下所有辅模型对象中的会计期对象
	 * @param accountPeriod
	 */
	private void clearCircle(X6BasicAccountPeriod accountPeriod) {
		if (accountPeriod.getAccountPeriodPartList() != null && accountPeriod.getAccountPeriodPartList().size() > 0) {
			for (X6BasicAccountPeriodPart accountPeriodPart : accountPeriod.getAccountPeriodPartList()) {
				accountPeriodPart.setAccountPeriod(null);
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
	private void checkAccountPeriodData(X6BasicAccountPeriod accountPeriod){
		 if(accountPeriod.getYear() == null){
		 	throw new RuntimeException("year不能为空。");
		 }
	}
	/* CUSTOM CODE START(wsserviceimpl,functions,X6Basic_1.0_accountingPeriod_AccountPeriod,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}