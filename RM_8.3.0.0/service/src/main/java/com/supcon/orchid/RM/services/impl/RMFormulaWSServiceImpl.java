package com.supcon.orchid.RM.services.impl;
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
import com.supcon.orchid.RM.entities.RMFormulaChange;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.RMFormulaBeforeProcess;
import com.supcon.orchid.RM.entities.RMFormulaBom;
import com.supcon.orchid.RM.entities.RMFormulaMixtureActive;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.entities.RMFormulaType;
import com.supcon.orchid.RM.entities.RMFactoryMapOther;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.entities.RMPickSite;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.RM.entities.RMLineFormula;
import com.supcon.orchid.RM.entities.RMProcessPoint;
import com.supcon.orchid.RM.entities.RMProcessUnit;
import com.supcon.orchid.RM.entities.RMProcessUnitChoice;
import com.supcon.orchid.RM.entities.RMTestProj;
import com.supcon.orchid.RM.services.RMFormulaWSService;
import com.supcon.orchid.RM.services.RMFormulaService;
import com.supcon.orchid.RM.services.RMFormulaBomService;
import com.supcon.orchid.RM.services.RMCheckDepartmentSetService;
import com.supcon.orchid.RM.services.RMFormulaMixtureActiveService;
import com.supcon.orchid.RM.services.RMPrecessStandardsService;
import com.supcon.orchid.RM.services.RMFormulaProcessService;
import com.supcon.orchid.RM.services.RMFormulaBeforeProcessService;
import com.supcon.orchid.RM.services.RMFormulaProcessActiveService;
	
/* CUSTOM CODE START(wsserviceimpl,import,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="RMFormula",targetNamespace = "http://ws.supcon.com")
public class RMFormulaWSServiceImpl implements RMFormulaWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private RMFormulaService formulaService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private RMFormulaBomService formulaBomService;
	@Resource
	private RMCheckDepartmentSetService checkDepartmentSetService;
	@Resource
	private RMFormulaMixtureActiveService formulaMixtureActiveService;
	@Resource
	private RMPrecessStandardsService precessStandardsService;
	@Resource
	private RMFormulaProcessService formulaProcessService;
	@Resource
	private RMFormulaBeforeProcessService formulaBeforeProcessService;
	@Resource
	private RMFormulaProcessActiveService formulaProcessActiveService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取配方表数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			RMFormula formula = formulaService.loadFormulaByBussinessKey(businessKey);
			if(formula == null){
				return set404Error(result);
			}
			//添加辅模型
			List<RMCheckDepartmentSet> checkDepartmentSetList = clearCheckDepartmentSetNonMainField(formulaService.getCheckDepartmentSetList(formula));
			formula.setCheckDepartmentSetList(checkDepartmentSetList);
			
			setSuccessResult(result, formula);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取配方表数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaByPk(
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
			
			RMFormula formula = formulaService.getFormula(id);
			if(formula == null || !formula.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<RMCheckDepartmentSet> checkDepartmentSetList = clearCheckDepartmentSetNonMainField(formulaService.getCheckDepartmentSetList(formula));
			formula.setCheckDepartmentSetList(checkDepartmentSetList);
			setSuccessResult(result, formula);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改配方表数据
	 * @param 配方表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateFormula(
		@WebParam(name="formula")RMFormula formula,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(formula == null){
				return set500Error(result, "配方表不能为空。");
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
			
			if(!beforeUpdateFormula(formula)){
				return set404Error(result);
			}
			formulaService.saveSuperEditFormula(formula, null, null, null, null, null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addFormula(
		@WebParam(name="formula")RMFormula formula,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(formula == null){
				return set500Error(result, "配方表不能为空。");
			}
		
			if(formula.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(formula.getTableNo() == null){
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
				checkFormulaData(formula);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			formulaService.saveSuperEditFormula(formula, null, null, null);
			setSuccessResult(result, formula.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaByBusinessKey(
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
			RMFormula formula = null;
			try{
				formula = formulaService.loadFormulaByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(formula == null){
				return set404Error(result);
			}
			formulaService.deleteFormula(formula);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaByPk(
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
			RMFormula formula = null;
			try{
				formula = formulaService.getFormula(id);
			}catch(NullPointerException e){}
			if(formula == null || !formula.isValid()){
				return set404Error(result);
			}
			formulaService.deleteFormula(formula);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddFormula(
		@WebParam(name="formulaList")List<RMFormula> formulaList,
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
			for(RMFormula formula : formulaList){
				if(formula.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(formula.getTableNo() == null || formula.getTableNo().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkFormulaData(formula);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			formulaService.batchSaveSuperEditFormula(formulaList, null, null, null);
			for(RMFormula formula : formulaList){
				idList.add(formula.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormula(
		@WebParam(name="formulaList")List<RMFormula> formulaList,
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
			for(RMFormula formula : formulaList){
				try{
					if(!beforeUpdateFormula(formula)){
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
			formulaService.batchSaveSuperEditFormula(formulaList, null, null, null,null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteFormulaByPk(
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
				RMFormula temp = null;
				try{
					temp = formulaService.getFormula(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			formulaService.deleteFormula(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteFormulaByBusinessKey(
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
				RMFormula temp = null;
				try{
					temp = formulaService.loadFormulaByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			formulaService.deleteFormula(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMFormula.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),RMFormula.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMFormula.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMFormula.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMFormula.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMFormula> page = new Page<RMFormula>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMFormula> datas = formulaService.getByPage(page, detachedCriteria);
			List<RMFormula> formulaList = datas.getResult();
			if (formulaList == null || formulaList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(formulaList.toArray());
			PaginationDTO<RMFormula> pagination = new PaginationDTO<RMFormula>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据配方表业务主键查询配方表下所有辅模型
	 * @param 配方表业务主键
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
			RMFormula formula = formulaService.loadFormulaByBussinessKey(businessKey);
			if (formula == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap checkDepartmentSetMap = new SimulationMap();
			checkDepartmentSetMap.setName(InternationalResource.get("CheckDepartmentSet"));
			checkDepartmentSetMap.setList(formulaService.getCheckDepartmentSetList(formula));
			resultList.add(checkDepartmentSetMap);
			
			clearCircle(formula);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配方表id查询配方表下所有辅模型
	 * 
	 * @param 配方表id
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
			RMFormula formula = formulaService.getFormula(id);
			if (formula == null || !formula.isValid()) {
				result.setErrorMessage("找不到配方表");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap checkDepartmentSetMap = new SimulationMap();
			checkDepartmentSetMap.setName(InternationalResource.get("CheckDepartmentSet"));
			checkDepartmentSetMap.setList(formulaService.getCheckDepartmentSetList(formula));
			resultList.add(checkDepartmentSetMap);
			
			clearCircle(formula);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  物品清单-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据物品清单业务主键分页查询物品清单数据
	 * 
	 * @param 物品清单业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaBomPageByFormulaBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "物品清单跟配方表没有设置关联！");
	}
	/**
	 * 根据物品清单id分页查询物品清单数据
	 * 
	 * @param 物品清单id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaBomPageByFormulaPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "物品清单跟配方表没有设置关联！");
	}
	/**
	 * 根据物品清单id分获取物品清单数据
	 * 
	 * @param 物品清单id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaBom(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMFormulaBom formulaBom = formulaBomService.getFormulaBom(id);
			if(formulaBom == null){
				return set404Error(result);
			}
			setSuccessResult(result, formulaBom);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品清单业务id修改物品清单数据
	 * 
	 * @param 物品清单对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateFormulaBom(
		@WebParam(name="formulaBom")RMFormulaBom formulaBom,
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
			if(!beforeUpdateFormulaBom(formulaBom)){
				return set404Error(result);
			}
			formulaBomService.saveFormulaBom(formulaBom, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增物品清单
	 * 
	 * @param 物品清单对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addFormulaBom(
		@WebParam(name="formulaBom")RMFormulaBom formulaBom,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(formulaBom == null){
				return set500Error(result, "物品清单对象不能为空。");
			}
			if(formulaBom.getId() != null){
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
				checkFormulaBomData(formulaBom);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			formulaBomService.saveFormulaBom(formulaBom, null);
			Long formulaBomId = formulaBom.getId();
			setSuccessResult(result, formulaBomId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品清单id 删除物品清单
	 * 
	 * @param 物品清单id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaBom(
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
			
			RMFormulaBom formulaBom = null;
			try{
				formulaBom = formulaBomService.getFormulaBom(id);
			}catch(NullPointerException e){}
			if(formulaBom == null  || !formulaBom.isValid()){
				return set404Error(result);
			}
			formulaBomService.deleteFormulaBom(formulaBom);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改物品清单数据，物品清单id不能为空
	 *
	 * @param 物品清单列表，每个物品清单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormulaBom(
		@WebParam(name="formulaBomList")List<RMFormulaBom> formulaBomList,
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
			for(RMFormulaBom formulaBom : formulaBomList){
				try{
					if(!beforeUpdateFormulaBom(formulaBom)){
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
			
			formulaBomService.batchImportBaseFormulaBom(formulaBomList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增物品清单数据
	 * 
	 * @param 物品清单列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddFormulaBom(
		@WebParam(name="formulaBomList")List<RMFormulaBom> formulaBomList,
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
			
			if(formulaBomList == null){
				set500Error(result, "formulaBomList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMFormulaBom formulaBom : formulaBomList){
				if(formulaBom.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkFormulaBomData(formulaBom);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			formulaBomService.batchImportBaseFormulaBom(formulaBomList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMFormulaBom formulaBom : formulaBomList){
				idList.add(formulaBom.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品清单id，批量删除物品清单数据
	 * 
	 * @param 物品清单id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelFormulaBom(
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
			
			List<RMFormulaBom> formulaBomList = new ArrayList<RMFormulaBom>();
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
				
				RMFormulaBom formulaBom = formulaBomService.getFormulaBom(id);
				if(formulaBom == null || !formulaBom.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				formulaBomList.add(formulaBom);
				
				count ++;
			}
			for(RMFormulaBom formulaBom : formulaBomList){
				formulaBomService.deleteFormulaBom(formulaBom);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有物品清单数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaBomPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMFormulaBom.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMFormulaBom.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMFormulaBom.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMFormulaBom.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMFormulaBom.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMFormulaBom> page = new Page<RMFormulaBom>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMFormulaBom> datas = formulaBomService.getByPage(page, detachedCriteria);
			List<RMFormulaBom> formulaBomList = datas.getResult();
			if (formulaBomList == null || formulaBomList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(formulaBomList.toArray());
			PaginationDTO<RMFormulaBom> pagination = new PaginationDTO<RMFormulaBom>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到物品清单则返回空。
	 * @param formulaBom
	 * @return
	 */
	private RMFormulaBom getFormulaBom(RMFormulaBom formulaBom) {
		if (formulaBom.getId() == null)
			throw new RuntimeException("id不能为空");
		RMFormulaBom result = formulaBomService.getFormulaBom(formulaBom.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果物品清单不存在，返回false；如果原来没有配方表对象，且修改的时候也没有配置配方表对象，则报错；如果配置的配方表对象不存在，则报错；
	 * @param formulaBom
	 * @return 
	 */
	private boolean beforeUpdateFormulaBom(RMFormulaBom formulaBom){
		if(formulaBom.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		RMFormulaBom temp = getFormulaBom(formulaBom);
		if(temp == null){
			return false;
		}
		formulaBom.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMFormulaBom> clearFormulaBomNonMainField(List<RMFormulaBom> list){
		 List<RMFormulaBom> formulaBomList = new ArrayList<RMFormulaBom>();
		 for(RMFormulaBom formulaBom:list){
			 RMFormulaBom temp = new RMFormulaBom();
			 temp.setId(formulaBom.getId());
		 	 formulaBomList.add(temp);
		 }
		 return formulaBomList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkFormulaBomData(RMFormulaBom formulaBom){
	}
	 
	//------------------------------------辅模型 WS  检验部门-------------------------------------------------
	//--hasLink:true---link:FormulaID
	/**
	 * 根据检验部门业务主键分页查询检验部门数据
	 * 
	 * @param 检验部门业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCheckDepartmentSetPageByFormulaBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(RMCheckDepartmentSet.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMCheckDepartmentSet.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMCheckDepartmentSet.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMCheckDepartmentSet.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMCheckDepartmentSet.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			RMFormula formula = formulaService.loadFormulaByBussinessKey(businessKey);
			if (formula == null) {
				return set500Error(result, "该业务主键的配方表不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("formulaID",formula));
			Page<RMCheckDepartmentSet> page = new Page<RMCheckDepartmentSet>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMCheckDepartmentSet> datas = checkDepartmentSetService.getByPage(page, detachedCriteria);
			List<RMCheckDepartmentSet> checkDepartmentSetList = datas.getResult();
			if (checkDepartmentSetList == null || checkDepartmentSetList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(checkDepartmentSetList.toArray());
			PaginationDTO<RMCheckDepartmentSet> pagination = new PaginationDTO<RMCheckDepartmentSet>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据检验部门id分页查询检验部门数据
	 * 
	 * @param 检验部门id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCheckDepartmentSetPageByFormulaPk(	
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
				detachedCriteria = DetachedCriteria.forClass(RMCheckDepartmentSet.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), RMCheckDepartmentSet.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMCheckDepartmentSet.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMCheckDepartmentSet.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMCheckDepartmentSet.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			RMFormula formula = formulaService.getFormula(id);
			if (formula == null) {
				return set500Error(result, "该主键的配方表不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("formulaID",formula));
			Page<RMCheckDepartmentSet> page = new Page<RMCheckDepartmentSet>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMCheckDepartmentSet> datas = checkDepartmentSetService.getByPage(page, detachedCriteria);
			List<RMCheckDepartmentSet> checkDepartmentSetList = datas.getResult();
			if (checkDepartmentSetList == null || checkDepartmentSetList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(checkDepartmentSetList.toArray());
			PaginationDTO<RMCheckDepartmentSet> pagination = new PaginationDTO<RMCheckDepartmentSet>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据检验部门id分获取检验部门数据
	 * 
	 * @param 检验部门id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCheckDepartmentSet(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMCheckDepartmentSet checkDepartmentSet = checkDepartmentSetService.getCheckDepartmentSet(id);
			if(checkDepartmentSet == null){
				return set404Error(result);
			}
			setSuccessResult(result, checkDepartmentSet);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据检验部门业务id修改检验部门数据
	 * 
	 * @param 检验部门对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateCheckDepartmentSet(
		@WebParam(name="checkDepartmentSet")RMCheckDepartmentSet checkDepartmentSet,
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
			if(!beforeUpdateCheckDepartmentSet(checkDepartmentSet)){
				return set404Error(result);
			}
			checkDepartmentSetService.saveCheckDepartmentSet(checkDepartmentSet, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增检验部门
	 * 
	 * @param 检验部门对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addCheckDepartmentSet(
		@WebParam(name="checkDepartmentSet")RMCheckDepartmentSet checkDepartmentSet,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(checkDepartmentSet == null){
				return set500Error(result, "检验部门对象不能为空。");
			}
			if(checkDepartmentSet.getId() != null){
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
				checkCheckDepartmentSetData(checkDepartmentSet);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			RMFormula tempFormula = checkDepartmentSet.getFormulaID();
			if (tempFormula == null) {
				return set500Error(result, "配方表对象不能为空");
			}
			
			RMFormula formula = null;
			if(tempFormula.getId()!= null){
				formula = formulaService.getFormula(tempFormula.getId());
			}else if(tempFormula.getTableNo() != null){
				formula = formulaService.loadFormulaByBussinessKey(tempFormula.getTableNo());
			}else{
				return set500Error(result, "配方表对象必须设置id或业务主键。");
			}
			
			if(formula == null){
				return set404Error(result);
			}
			checkDepartmentSet.setTableInfoId(formula.getTableInfoId());
			checkDepartmentSet.setFormulaID(formula);
			
			checkDepartmentSetService.saveCheckDepartmentSet(checkDepartmentSet, null);
			Long checkDepartmentSetId = checkDepartmentSet.getId();
			setSuccessResult(result, checkDepartmentSetId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据检验部门id 删除检验部门
	 * 
	 * @param 检验部门id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteCheckDepartmentSet(
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
			
			RMCheckDepartmentSet checkDepartmentSet = null;
			try{
				checkDepartmentSet = checkDepartmentSetService.getCheckDepartmentSet(id);
			}catch(NullPointerException e){}
			if(checkDepartmentSet == null  || !checkDepartmentSet.isValid()){
				return set404Error(result);
			}
			checkDepartmentSetService.deleteCheckDepartmentSet(checkDepartmentSet);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改检验部门数据，检验部门id不能为空
	 *
	 * @param 检验部门列表，每个检验部门必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateCheckDepartmentSet(
		@WebParam(name="checkDepartmentSetList")List<RMCheckDepartmentSet> checkDepartmentSetList,
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
			for(RMCheckDepartmentSet checkDepartmentSet : checkDepartmentSetList){
				try{
					if(!beforeUpdateCheckDepartmentSet(checkDepartmentSet)){
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
			
			checkDepartmentSetService.batchImportBaseCheckDepartmentSet(checkDepartmentSetList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增检验部门数据
	 * 
	 * @param 检验部门列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddCheckDepartmentSet(
		@WebParam(name="checkDepartmentSetList")List<RMCheckDepartmentSet> checkDepartmentSetList,
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
			
			if(checkDepartmentSetList == null){
				set500Error(result, "checkDepartmentSetList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMCheckDepartmentSet checkDepartmentSet : checkDepartmentSetList){
				if(checkDepartmentSet.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(checkDepartmentSet.getFormulaID() == null){
						set500Error(result, "第"+count+"条数据出错：配方表对象不能为空。");
						return result;
					}
					RMFormula formula = getFormula(checkDepartmentSet.getFormulaID());
					if(formula == null){
						set500Error(result, "第"+count+"条数据出错：配方表对象不存在。");
						return result;
					}
					checkDepartmentSet.setTableInfoId(formula.getTableInfoId());
					checkDepartmentSet.setFormulaID(formula);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkCheckDepartmentSetData(checkDepartmentSet);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			checkDepartmentSetService.batchImportBaseCheckDepartmentSet(checkDepartmentSetList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMCheckDepartmentSet checkDepartmentSet : checkDepartmentSetList){
				idList.add(checkDepartmentSet.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据检验部门id，批量删除检验部门数据
	 * 
	 * @param 检验部门id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelCheckDepartmentSet(
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
			
			List<RMCheckDepartmentSet> checkDepartmentSetList = new ArrayList<RMCheckDepartmentSet>();
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
				
				RMCheckDepartmentSet checkDepartmentSet = checkDepartmentSetService.getCheckDepartmentSet(id);
				if(checkDepartmentSet == null || !checkDepartmentSet.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				checkDepartmentSetList.add(checkDepartmentSet);
				
				count ++;
			}
			for(RMCheckDepartmentSet checkDepartmentSet : checkDepartmentSetList){
				checkDepartmentSetService.deleteCheckDepartmentSet(checkDepartmentSet);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有检验部门数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCheckDepartmentSetPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMCheckDepartmentSet.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMCheckDepartmentSet.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMCheckDepartmentSet.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMCheckDepartmentSet.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMCheckDepartmentSet.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMCheckDepartmentSet> page = new Page<RMCheckDepartmentSet>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMCheckDepartmentSet> datas = checkDepartmentSetService.getByPage(page, detachedCriteria);
			List<RMCheckDepartmentSet> checkDepartmentSetList = datas.getResult();
			if (checkDepartmentSetList == null || checkDepartmentSetList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(checkDepartmentSetList.toArray());
			PaginationDTO<RMCheckDepartmentSet> pagination = new PaginationDTO<RMCheckDepartmentSet>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到检验部门则返回空。
	 * @param checkDepartmentSet
	 * @return
	 */
	private RMCheckDepartmentSet getCheckDepartmentSet(RMCheckDepartmentSet checkDepartmentSet) {
		if (checkDepartmentSet.getId() == null)
			throw new RuntimeException("id不能为空");
		RMCheckDepartmentSet result = checkDepartmentSetService.getCheckDepartmentSet(checkDepartmentSet.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果检验部门不存在，返回false；如果原来没有配方表对象，且修改的时候也没有配置配方表对象，则报错；如果配置的配方表对象不存在，则报错；
	 * @param checkDepartmentSet
	 * @return 
	 */
	private boolean beforeUpdateCheckDepartmentSet(RMCheckDepartmentSet checkDepartmentSet){
		if(checkDepartmentSet.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		RMCheckDepartmentSet temp = getCheckDepartmentSet(checkDepartmentSet);
		if(temp == null){
			return false;
		}
		RMFormula formula = null;
		if (temp.getFormulaID() == null) {
			if (checkDepartmentSet.getFormulaID() == null || (checkDepartmentSet.getFormulaID().getId() == null && checkDepartmentSet.getFormulaID().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				formula = getFormula(checkDepartmentSet.getFormulaID());
				if(formula == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (checkDepartmentSet.getFormulaID() == null || (checkDepartmentSet.getFormulaID().getId() == null && checkDepartmentSet.getFormulaID().getTableNo() == null)) {
				formula = temp.getFormulaID();
			} else {
				formula = getFormula(checkDepartmentSet.getFormulaID());
				if (formula == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		checkDepartmentSet.setTableInfoId(formula.getTableInfoId());
		
		checkDepartmentSet.setFormulaID(formula);
		checkDepartmentSet.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMCheckDepartmentSet> clearCheckDepartmentSetNonMainField(List<RMCheckDepartmentSet> list){
		 List<RMCheckDepartmentSet> checkDepartmentSetList = new ArrayList<RMCheckDepartmentSet>();
		 for(RMCheckDepartmentSet checkDepartmentSet:list){
			 RMCheckDepartmentSet temp = new RMCheckDepartmentSet();
			 temp.setId(checkDepartmentSet.getId());
		 	 checkDepartmentSetList.add(temp);
		 }
		 return checkDepartmentSetList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkCheckDepartmentSetData(RMCheckDepartmentSet checkDepartmentSet){
	}
	 
	//------------------------------------辅模型 WS  配料-------------------------------------------------
	//--hasLink:false---link:FormulaID
	/**
	 * 根据配料业务主键分页查询配料数据
	 * 
	 * @param 配料业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaMixtureActivePageByFormulaBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "配料跟配方表没有设置关联！");
	}
	/**
	 * 根据配料id分页查询配料数据
	 * 
	 * @param 配料id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaMixtureActivePageByFormulaPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "配料跟配方表没有设置关联！");
	}
	/**
	 * 根据配料id分获取配料数据
	 * 
	 * @param 配料id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaMixtureActive(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMFormulaMixtureActive formulaMixtureActive = formulaMixtureActiveService.getFormulaMixtureActive(id);
			if(formulaMixtureActive == null){
				return set404Error(result);
			}
			setSuccessResult(result, formulaMixtureActive);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料业务id修改配料数据
	 * 
	 * @param 配料对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateFormulaMixtureActive(
		@WebParam(name="formulaMixtureActive")RMFormulaMixtureActive formulaMixtureActive,
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
			if(!beforeUpdateFormulaMixtureActive(formulaMixtureActive)){
				return set404Error(result);
			}
			formulaMixtureActiveService.saveFormulaMixtureActive(formulaMixtureActive, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增配料
	 * 
	 * @param 配料对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addFormulaMixtureActive(
		@WebParam(name="formulaMixtureActive")RMFormulaMixtureActive formulaMixtureActive,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(formulaMixtureActive == null){
				return set500Error(result, "配料对象不能为空。");
			}
			if(formulaMixtureActive.getId() != null){
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
				checkFormulaMixtureActiveData(formulaMixtureActive);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			formulaMixtureActiveService.saveFormulaMixtureActive(formulaMixtureActive, null);
			Long formulaMixtureActiveId = formulaMixtureActive.getId();
			setSuccessResult(result, formulaMixtureActiveId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料id 删除配料
	 * 
	 * @param 配料id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaMixtureActive(
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
			
			RMFormulaMixtureActive formulaMixtureActive = null;
			try{
				formulaMixtureActive = formulaMixtureActiveService.getFormulaMixtureActive(id);
			}catch(NullPointerException e){}
			if(formulaMixtureActive == null  || !formulaMixtureActive.isValid()){
				return set404Error(result);
			}
			formulaMixtureActiveService.deleteFormulaMixtureActive(formulaMixtureActive);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改配料数据，配料id不能为空
	 *
	 * @param 配料列表，每个配料必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormulaMixtureActive(
		@WebParam(name="formulaMixtureActiveList")List<RMFormulaMixtureActive> formulaMixtureActiveList,
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
			for(RMFormulaMixtureActive formulaMixtureActive : formulaMixtureActiveList){
				try{
					if(!beforeUpdateFormulaMixtureActive(formulaMixtureActive)){
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
			
			formulaMixtureActiveService.batchImportBaseFormulaMixtureActive(formulaMixtureActiveList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增配料数据
	 * 
	 * @param 配料列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddFormulaMixtureActive(
		@WebParam(name="formulaMixtureActiveList")List<RMFormulaMixtureActive> formulaMixtureActiveList,
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
			
			if(formulaMixtureActiveList == null){
				set500Error(result, "formulaMixtureActiveList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMFormulaMixtureActive formulaMixtureActive : formulaMixtureActiveList){
				if(formulaMixtureActive.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkFormulaMixtureActiveData(formulaMixtureActive);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			formulaMixtureActiveService.batchImportBaseFormulaMixtureActive(formulaMixtureActiveList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMFormulaMixtureActive formulaMixtureActive : formulaMixtureActiveList){
				idList.add(formulaMixtureActive.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料id，批量删除配料数据
	 * 
	 * @param 配料id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelFormulaMixtureActive(
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
			
			List<RMFormulaMixtureActive> formulaMixtureActiveList = new ArrayList<RMFormulaMixtureActive>();
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
				
				RMFormulaMixtureActive formulaMixtureActive = formulaMixtureActiveService.getFormulaMixtureActive(id);
				if(formulaMixtureActive == null || !formulaMixtureActive.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				formulaMixtureActiveList.add(formulaMixtureActive);
				
				count ++;
			}
			for(RMFormulaMixtureActive formulaMixtureActive : formulaMixtureActiveList){
				formulaMixtureActiveService.deleteFormulaMixtureActive(formulaMixtureActive);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有配料数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaMixtureActivePage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMFormulaMixtureActive.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMFormulaMixtureActive.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMFormulaMixtureActive.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMFormulaMixtureActive.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMFormulaMixtureActive.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMFormulaMixtureActive> page = new Page<RMFormulaMixtureActive>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMFormulaMixtureActive> datas = formulaMixtureActiveService.getByPage(page, detachedCriteria);
			List<RMFormulaMixtureActive> formulaMixtureActiveList = datas.getResult();
			if (formulaMixtureActiveList == null || formulaMixtureActiveList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(formulaMixtureActiveList.toArray());
			PaginationDTO<RMFormulaMixtureActive> pagination = new PaginationDTO<RMFormulaMixtureActive>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到配料则返回空。
	 * @param formulaMixtureActive
	 * @return
	 */
	private RMFormulaMixtureActive getFormulaMixtureActive(RMFormulaMixtureActive formulaMixtureActive) {
		if (formulaMixtureActive.getId() == null)
			throw new RuntimeException("id不能为空");
		RMFormulaMixtureActive result = formulaMixtureActiveService.getFormulaMixtureActive(formulaMixtureActive.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果配料不存在，返回false；如果原来没有配方表对象，且修改的时候也没有配置配方表对象，则报错；如果配置的配方表对象不存在，则报错；
	 * @param formulaMixtureActive
	 * @return 
	 */
	private boolean beforeUpdateFormulaMixtureActive(RMFormulaMixtureActive formulaMixtureActive){
		if(formulaMixtureActive.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		RMFormulaMixtureActive temp = getFormulaMixtureActive(formulaMixtureActive);
		if(temp == null){
			return false;
		}
		formulaMixtureActive.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMFormulaMixtureActive> clearFormulaMixtureActiveNonMainField(List<RMFormulaMixtureActive> list){
		 List<RMFormulaMixtureActive> formulaMixtureActiveList = new ArrayList<RMFormulaMixtureActive>();
		 for(RMFormulaMixtureActive formulaMixtureActive:list){
			 RMFormulaMixtureActive temp = new RMFormulaMixtureActive();
			 temp.setId(formulaMixtureActive.getId());
		 	 formulaMixtureActiveList.add(temp);
		 }
		 return formulaMixtureActiveList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkFormulaMixtureActiveData(RMFormulaMixtureActive formulaMixtureActive){
	}
	 
	//------------------------------------辅模型 WS  工艺标准-------------------------------------------------
	//--hasLink:false---link:FormulaID
	/**
	 * 根据工艺标准业务主键分页查询工艺标准数据
	 * 
	 * @param 工艺标准业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPrecessStandardsPageByFormulaBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工艺标准跟配方表没有设置关联！");
	}
	/**
	 * 根据工艺标准id分页查询工艺标准数据
	 * 
	 * @param 工艺标准id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPrecessStandardsPageByFormulaPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工艺标准跟配方表没有设置关联！");
	}
	/**
	 * 根据工艺标准id分获取工艺标准数据
	 * 
	 * @param 工艺标准id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPrecessStandards(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMPrecessStandards precessStandards = precessStandardsService.getPrecessStandards(id);
			if(precessStandards == null){
				return set404Error(result);
			}
			setSuccessResult(result, precessStandards);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工艺标准业务id修改工艺标准数据
	 * 
	 * @param 工艺标准对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updatePrecessStandards(
		@WebParam(name="precessStandards")RMPrecessStandards precessStandards,
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
			if(!beforeUpdatePrecessStandards(precessStandards)){
				return set404Error(result);
			}
			precessStandardsService.savePrecessStandards(precessStandards, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增工艺标准
	 * 
	 * @param 工艺标准对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addPrecessStandards(
		@WebParam(name="precessStandards")RMPrecessStandards precessStandards,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(precessStandards == null){
				return set500Error(result, "工艺标准对象不能为空。");
			}
			if(precessStandards.getId() != null){
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
				checkPrecessStandardsData(precessStandards);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			precessStandardsService.savePrecessStandards(precessStandards, null);
			Long precessStandardsId = precessStandards.getId();
			setSuccessResult(result, precessStandardsId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工艺标准id 删除工艺标准
	 * 
	 * @param 工艺标准id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deletePrecessStandards(
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
			
			RMPrecessStandards precessStandards = null;
			try{
				precessStandards = precessStandardsService.getPrecessStandards(id);
			}catch(NullPointerException e){}
			if(precessStandards == null  || !precessStandards.isValid()){
				return set404Error(result);
			}
			precessStandardsService.deletePrecessStandards(precessStandards);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改工艺标准数据，工艺标准id不能为空
	 *
	 * @param 工艺标准列表，每个工艺标准必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdatePrecessStandards(
		@WebParam(name="precessStandardsList")List<RMPrecessStandards> precessStandardsList,
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
			for(RMPrecessStandards precessStandards : precessStandardsList){
				try{
					if(!beforeUpdatePrecessStandards(precessStandards)){
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
			
			precessStandardsService.batchImportBasePrecessStandards(precessStandardsList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增工艺标准数据
	 * 
	 * @param 工艺标准列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddPrecessStandards(
		@WebParam(name="precessStandardsList")List<RMPrecessStandards> precessStandardsList,
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
			
			if(precessStandardsList == null){
				set500Error(result, "precessStandardsList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMPrecessStandards precessStandards : precessStandardsList){
				if(precessStandards.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkPrecessStandardsData(precessStandards);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			precessStandardsService.batchImportBasePrecessStandards(precessStandardsList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMPrecessStandards precessStandards : precessStandardsList){
				idList.add(precessStandards.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工艺标准id，批量删除工艺标准数据
	 * 
	 * @param 工艺标准id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelPrecessStandards(
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
			
			List<RMPrecessStandards> precessStandardsList = new ArrayList<RMPrecessStandards>();
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
				
				RMPrecessStandards precessStandards = precessStandardsService.getPrecessStandards(id);
				if(precessStandards == null || !precessStandards.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				precessStandardsList.add(precessStandards);
				
				count ++;
			}
			for(RMPrecessStandards precessStandards : precessStandardsList){
				precessStandardsService.deletePrecessStandards(precessStandards);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有工艺标准数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPrecessStandardsPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMPrecessStandards.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMPrecessStandards.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMPrecessStandards.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMPrecessStandards.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMPrecessStandards.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMPrecessStandards> page = new Page<RMPrecessStandards>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMPrecessStandards> datas = precessStandardsService.getByPage(page, detachedCriteria);
			List<RMPrecessStandards> precessStandardsList = datas.getResult();
			if (precessStandardsList == null || precessStandardsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(precessStandardsList.toArray());
			PaginationDTO<RMPrecessStandards> pagination = new PaginationDTO<RMPrecessStandards>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到工艺标准则返回空。
	 * @param precessStandards
	 * @return
	 */
	private RMPrecessStandards getPrecessStandards(RMPrecessStandards precessStandards) {
		if (precessStandards.getId() == null)
			throw new RuntimeException("id不能为空");
		RMPrecessStandards result = precessStandardsService.getPrecessStandards(precessStandards.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果工艺标准不存在，返回false；如果原来没有配方表对象，且修改的时候也没有配置配方表对象，则报错；如果配置的配方表对象不存在，则报错；
	 * @param precessStandards
	 * @return 
	 */
	private boolean beforeUpdatePrecessStandards(RMPrecessStandards precessStandards){
		if(precessStandards.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		RMPrecessStandards temp = getPrecessStandards(precessStandards);
		if(temp == null){
			return false;
		}
		precessStandards.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMPrecessStandards> clearPrecessStandardsNonMainField(List<RMPrecessStandards> list){
		 List<RMPrecessStandards> precessStandardsList = new ArrayList<RMPrecessStandards>();
		 for(RMPrecessStandards precessStandards:list){
			 RMPrecessStandards temp = new RMPrecessStandards();
			 temp.setId(precessStandards.getId());
			 temp.setQuota(precessStandards.getQuota());
		 	 precessStandardsList.add(temp);
		 }
		 return precessStandardsList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkPrecessStandardsData(RMPrecessStandards precessStandards){
	}
	 
	//------------------------------------辅模型 WS  工序-------------------------------------------------
	//--hasLink:false---link:FormulaID
	/**
	 * 根据工序业务主键分页查询工序数据
	 * 
	 * @param 工序业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessPageByFormulaBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工序跟配方表没有设置关联！");
	}
	/**
	 * 根据工序id分页查询工序数据
	 * 
	 * @param 工序id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessPageByFormulaPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工序跟配方表没有设置关联！");
	}
	/**
	 * 根据工序id分获取工序数据
	 * 
	 * @param 工序id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcess(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMFormulaProcess formulaProcess = formulaProcessService.getFormulaProcess(id);
			if(formulaProcess == null){
				return set404Error(result);
			}
			setSuccessResult(result, formulaProcess);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序业务id修改工序数据
	 * 
	 * @param 工序对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateFormulaProcess(
		@WebParam(name="formulaProcess")RMFormulaProcess formulaProcess,
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
			if(!beforeUpdateFormulaProcess(formulaProcess)){
				return set404Error(result);
			}
			formulaProcessService.saveFormulaProcess(formulaProcess, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增工序
	 * 
	 * @param 工序对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addFormulaProcess(
		@WebParam(name="formulaProcess")RMFormulaProcess formulaProcess,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(formulaProcess == null){
				return set500Error(result, "工序对象不能为空。");
			}
			if(formulaProcess.getId() != null){
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
				checkFormulaProcessData(formulaProcess);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			formulaProcessService.saveFormulaProcess(formulaProcess, null);
			Long formulaProcessId = formulaProcess.getId();
			setSuccessResult(result, formulaProcessId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序id 删除工序
	 * 
	 * @param 工序id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaProcess(
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
			
			RMFormulaProcess formulaProcess = null;
			try{
				formulaProcess = formulaProcessService.getFormulaProcess(id);
			}catch(NullPointerException e){}
			if(formulaProcess == null  || !formulaProcess.isValid()){
				return set404Error(result);
			}
			formulaProcessService.deleteFormulaProcess(formulaProcess);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改工序数据，工序id不能为空
	 *
	 * @param 工序列表，每个工序必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormulaProcess(
		@WebParam(name="formulaProcessList")List<RMFormulaProcess> formulaProcessList,
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
			for(RMFormulaProcess formulaProcess : formulaProcessList){
				try{
					if(!beforeUpdateFormulaProcess(formulaProcess)){
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
			
			formulaProcessService.batchImportBaseFormulaProcess(formulaProcessList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增工序数据
	 * 
	 * @param 工序列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddFormulaProcess(
		@WebParam(name="formulaProcessList")List<RMFormulaProcess> formulaProcessList,
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
			
			if(formulaProcessList == null){
				set500Error(result, "formulaProcessList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMFormulaProcess formulaProcess : formulaProcessList){
				if(formulaProcess.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkFormulaProcessData(formulaProcess);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			formulaProcessService.batchImportBaseFormulaProcess(formulaProcessList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMFormulaProcess formulaProcess : formulaProcessList){
				idList.add(formulaProcess.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序id，批量删除工序数据
	 * 
	 * @param 工序id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelFormulaProcess(
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
			
			List<RMFormulaProcess> formulaProcessList = new ArrayList<RMFormulaProcess>();
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
				
				RMFormulaProcess formulaProcess = formulaProcessService.getFormulaProcess(id);
				if(formulaProcess == null || !formulaProcess.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				formulaProcessList.add(formulaProcess);
				
				count ++;
			}
			for(RMFormulaProcess formulaProcess : formulaProcessList){
				formulaProcessService.deleteFormulaProcess(formulaProcess);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有工序数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMFormulaProcess.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMFormulaProcess.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMFormulaProcess.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMFormulaProcess.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMFormulaProcess.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMFormulaProcess> page = new Page<RMFormulaProcess>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMFormulaProcess> datas = formulaProcessService.getByPage(page, detachedCriteria);
			List<RMFormulaProcess> formulaProcessList = datas.getResult();
			if (formulaProcessList == null || formulaProcessList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(formulaProcessList.toArray());
			PaginationDTO<RMFormulaProcess> pagination = new PaginationDTO<RMFormulaProcess>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到工序则返回空。
	 * @param formulaProcess
	 * @return
	 */
	private RMFormulaProcess getFormulaProcess(RMFormulaProcess formulaProcess) {
		if (formulaProcess.getId() == null)
			throw new RuntimeException("id不能为空");
		RMFormulaProcess result = formulaProcessService.getFormulaProcess(formulaProcess.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果工序不存在，返回false；如果原来没有配方表对象，且修改的时候也没有配置配方表对象，则报错；如果配置的配方表对象不存在，则报错；
	 * @param formulaProcess
	 * @return 
	 */
	private boolean beforeUpdateFormulaProcess(RMFormulaProcess formulaProcess){
		if(formulaProcess.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		if(formulaProcess.getName() == null){
			throw new RuntimeException("name不能为空。");
		}
		RMFormulaProcess temp = getFormulaProcess(formulaProcess);
		if(temp == null){
			return false;
		}
		formulaProcess.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMFormulaProcess> clearFormulaProcessNonMainField(List<RMFormulaProcess> list){
		 List<RMFormulaProcess> formulaProcessList = new ArrayList<RMFormulaProcess>();
		 for(RMFormulaProcess formulaProcess:list){
			 RMFormulaProcess temp = new RMFormulaProcess();
			 temp.setId(formulaProcess.getId());
			 temp.setName(formulaProcess.getName());
		 	 formulaProcessList.add(temp);
		 }
		 return formulaProcessList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkFormulaProcessData(RMFormulaProcess formulaProcess){
		 if(formulaProcess.getName() == null){
		 	throw new RuntimeException("name不能为空。");
		 }
	}
	 
	//------------------------------------辅模型 WS  前置工序-------------------------------------------------
	//--hasLink:false---link:FormulaID
	/**
	 * 根据前置工序业务主键分页查询前置工序数据
	 * 
	 * @param 前置工序业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaBeforeProcessPageByFormulaBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "前置工序跟配方表没有设置关联！");
	}
	/**
	 * 根据前置工序id分页查询前置工序数据
	 * 
	 * @param 前置工序id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaBeforeProcessPageByFormulaPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "前置工序跟配方表没有设置关联！");
	}
	/**
	 * 根据前置工序id分获取前置工序数据
	 * 
	 * @param 前置工序id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaBeforeProcess(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMFormulaBeforeProcess formulaBeforeProcess = formulaBeforeProcessService.getFormulaBeforeProcess(id);
			if(formulaBeforeProcess == null){
				return set404Error(result);
			}
			setSuccessResult(result, formulaBeforeProcess);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据前置工序业务id修改前置工序数据
	 * 
	 * @param 前置工序对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateFormulaBeforeProcess(
		@WebParam(name="formulaBeforeProcess")RMFormulaBeforeProcess formulaBeforeProcess,
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
			if(!beforeUpdateFormulaBeforeProcess(formulaBeforeProcess)){
				return set404Error(result);
			}
			formulaBeforeProcessService.saveFormulaBeforeProcess(formulaBeforeProcess, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增前置工序
	 * 
	 * @param 前置工序对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addFormulaBeforeProcess(
		@WebParam(name="formulaBeforeProcess")RMFormulaBeforeProcess formulaBeforeProcess,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(formulaBeforeProcess == null){
				return set500Error(result, "前置工序对象不能为空。");
			}
			if(formulaBeforeProcess.getId() != null){
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
				checkFormulaBeforeProcessData(formulaBeforeProcess);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			formulaBeforeProcessService.saveFormulaBeforeProcess(formulaBeforeProcess, null);
			Long formulaBeforeProcessId = formulaBeforeProcess.getId();
			setSuccessResult(result, formulaBeforeProcessId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据前置工序id 删除前置工序
	 * 
	 * @param 前置工序id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaBeforeProcess(
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
			
			RMFormulaBeforeProcess formulaBeforeProcess = null;
			try{
				formulaBeforeProcess = formulaBeforeProcessService.getFormulaBeforeProcess(id);
			}catch(NullPointerException e){}
			if(formulaBeforeProcess == null  || !formulaBeforeProcess.isValid()){
				return set404Error(result);
			}
			formulaBeforeProcessService.deleteFormulaBeforeProcess(formulaBeforeProcess);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改前置工序数据，前置工序id不能为空
	 *
	 * @param 前置工序列表，每个前置工序必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormulaBeforeProcess(
		@WebParam(name="formulaBeforeProcessList")List<RMFormulaBeforeProcess> formulaBeforeProcessList,
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
			for(RMFormulaBeforeProcess formulaBeforeProcess : formulaBeforeProcessList){
				try{
					if(!beforeUpdateFormulaBeforeProcess(formulaBeforeProcess)){
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
			
			formulaBeforeProcessService.batchImportBaseFormulaBeforeProcess(formulaBeforeProcessList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增前置工序数据
	 * 
	 * @param 前置工序列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddFormulaBeforeProcess(
		@WebParam(name="formulaBeforeProcessList")List<RMFormulaBeforeProcess> formulaBeforeProcessList,
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
			
			if(formulaBeforeProcessList == null){
				set500Error(result, "formulaBeforeProcessList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMFormulaBeforeProcess formulaBeforeProcess : formulaBeforeProcessList){
				if(formulaBeforeProcess.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkFormulaBeforeProcessData(formulaBeforeProcess);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			formulaBeforeProcessService.batchImportBaseFormulaBeforeProcess(formulaBeforeProcessList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMFormulaBeforeProcess formulaBeforeProcess : formulaBeforeProcessList){
				idList.add(formulaBeforeProcess.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据前置工序id，批量删除前置工序数据
	 * 
	 * @param 前置工序id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelFormulaBeforeProcess(
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
			
			List<RMFormulaBeforeProcess> formulaBeforeProcessList = new ArrayList<RMFormulaBeforeProcess>();
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
				
				RMFormulaBeforeProcess formulaBeforeProcess = formulaBeforeProcessService.getFormulaBeforeProcess(id);
				if(formulaBeforeProcess == null || !formulaBeforeProcess.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				formulaBeforeProcessList.add(formulaBeforeProcess);
				
				count ++;
			}
			for(RMFormulaBeforeProcess formulaBeforeProcess : formulaBeforeProcessList){
				formulaBeforeProcessService.deleteFormulaBeforeProcess(formulaBeforeProcess);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有前置工序数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaBeforeProcessPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMFormulaBeforeProcess.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMFormulaBeforeProcess.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMFormulaBeforeProcess.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMFormulaBeforeProcess.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMFormulaBeforeProcess.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMFormulaBeforeProcess> page = new Page<RMFormulaBeforeProcess>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMFormulaBeforeProcess> datas = formulaBeforeProcessService.getByPage(page, detachedCriteria);
			List<RMFormulaBeforeProcess> formulaBeforeProcessList = datas.getResult();
			if (formulaBeforeProcessList == null || formulaBeforeProcessList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(formulaBeforeProcessList.toArray());
			PaginationDTO<RMFormulaBeforeProcess> pagination = new PaginationDTO<RMFormulaBeforeProcess>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到前置工序则返回空。
	 * @param formulaBeforeProcess
	 * @return
	 */
	private RMFormulaBeforeProcess getFormulaBeforeProcess(RMFormulaBeforeProcess formulaBeforeProcess) {
		if (formulaBeforeProcess.getId() == null)
			throw new RuntimeException("id不能为空");
		RMFormulaBeforeProcess result = formulaBeforeProcessService.getFormulaBeforeProcess(formulaBeforeProcess.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果前置工序不存在，返回false；如果原来没有配方表对象，且修改的时候也没有配置配方表对象，则报错；如果配置的配方表对象不存在，则报错；
	 * @param formulaBeforeProcess
	 * @return 
	 */
	private boolean beforeUpdateFormulaBeforeProcess(RMFormulaBeforeProcess formulaBeforeProcess){
		if(formulaBeforeProcess.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		RMFormulaBeforeProcess temp = getFormulaBeforeProcess(formulaBeforeProcess);
		if(temp == null){
			return false;
		}
		formulaBeforeProcess.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMFormulaBeforeProcess> clearFormulaBeforeProcessNonMainField(List<RMFormulaBeforeProcess> list){
		 List<RMFormulaBeforeProcess> formulaBeforeProcessList = new ArrayList<RMFormulaBeforeProcess>();
		 for(RMFormulaBeforeProcess formulaBeforeProcess:list){
			 RMFormulaBeforeProcess temp = new RMFormulaBeforeProcess();
			 temp.setId(formulaBeforeProcess.getId());
		 	 formulaBeforeProcessList.add(temp);
		 }
		 return formulaBeforeProcessList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkFormulaBeforeProcessData(RMFormulaBeforeProcess formulaBeforeProcess){
	}
	 
	//------------------------------------辅模型 WS  工序活动-------------------------------------------------
	//--hasLink:false---link:FormulaID
	/**
	 * 根据工序活动业务主键分页查询工序活动数据
	 * 
	 * @param 工序活动业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessActivePageByFormulaBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工序活动跟配方表没有设置关联！");
	}
	/**
	 * 根据工序活动id分页查询工序活动数据
	 * 
	 * @param 工序活动id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessActivePageByFormulaPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工序活动跟配方表没有设置关联！");
	}
	/**
	 * 根据工序活动id分获取工序活动数据
	 * 
	 * @param 工序活动id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessActive(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMFormulaProcessActive formulaProcessActive = formulaProcessActiveService.getFormulaProcessActive(id);
			if(formulaProcessActive == null){
				return set404Error(result);
			}
			setSuccessResult(result, formulaProcessActive);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序活动业务id修改工序活动数据
	 * 
	 * @param 工序活动对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateFormulaProcessActive(
		@WebParam(name="formulaProcessActive")RMFormulaProcessActive formulaProcessActive,
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
			if(!beforeUpdateFormulaProcessActive(formulaProcessActive)){
				return set404Error(result);
			}
			formulaProcessActiveService.saveFormulaProcessActive(formulaProcessActive, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增工序活动
	 * 
	 * @param 工序活动对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addFormulaProcessActive(
		@WebParam(name="formulaProcessActive")RMFormulaProcessActive formulaProcessActive,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(formulaProcessActive == null){
				return set500Error(result, "工序活动对象不能为空。");
			}
			if(formulaProcessActive.getId() != null){
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
				checkFormulaProcessActiveData(formulaProcessActive);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			formulaProcessActiveService.saveFormulaProcessActive(formulaProcessActive, null);
			Long formulaProcessActiveId = formulaProcessActive.getId();
			setSuccessResult(result, formulaProcessActiveId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序活动id 删除工序活动
	 * 
	 * @param 工序活动id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteFormulaProcessActive(
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
			
			RMFormulaProcessActive formulaProcessActive = null;
			try{
				formulaProcessActive = formulaProcessActiveService.getFormulaProcessActive(id);
			}catch(NullPointerException e){}
			if(formulaProcessActive == null  || !formulaProcessActive.isValid()){
				return set404Error(result);
			}
			formulaProcessActiveService.deleteFormulaProcessActive(formulaProcessActive);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改工序活动数据，工序活动id不能为空
	 *
	 * @param 工序活动列表，每个工序活动必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFormulaProcessActive(
		@WebParam(name="formulaProcessActiveList")List<RMFormulaProcessActive> formulaProcessActiveList,
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
			for(RMFormulaProcessActive formulaProcessActive : formulaProcessActiveList){
				try{
					if(!beforeUpdateFormulaProcessActive(formulaProcessActive)){
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
			
			formulaProcessActiveService.batchImportBaseFormulaProcessActive(formulaProcessActiveList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增工序活动数据
	 * 
	 * @param 工序活动列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddFormulaProcessActive(
		@WebParam(name="formulaProcessActiveList")List<RMFormulaProcessActive> formulaProcessActiveList,
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
			
			if(formulaProcessActiveList == null){
				set500Error(result, "formulaProcessActiveList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMFormulaProcessActive formulaProcessActive : formulaProcessActiveList){
				if(formulaProcessActive.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkFormulaProcessActiveData(formulaProcessActive);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			formulaProcessActiveService.batchImportBaseFormulaProcessActive(formulaProcessActiveList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMFormulaProcessActive formulaProcessActive : formulaProcessActiveList){
				idList.add(formulaProcessActive.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序活动id，批量删除工序活动数据
	 * 
	 * @param 工序活动id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelFormulaProcessActive(
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
			
			List<RMFormulaProcessActive> formulaProcessActiveList = new ArrayList<RMFormulaProcessActive>();
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
				
				RMFormulaProcessActive formulaProcessActive = formulaProcessActiveService.getFormulaProcessActive(id);
				if(formulaProcessActive == null || !formulaProcessActive.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				formulaProcessActiveList.add(formulaProcessActive);
				
				count ++;
			}
			for(RMFormulaProcessActive formulaProcessActive : formulaProcessActiveList){
				formulaProcessActiveService.deleteFormulaProcessActive(formulaProcessActive);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有工序活动数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFormulaProcessActivePage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMFormulaProcessActive.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMFormulaProcessActive.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMFormulaProcessActive.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMFormulaProcessActive.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMFormulaProcessActive.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMFormulaProcessActive> page = new Page<RMFormulaProcessActive>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMFormulaProcessActive> datas = formulaProcessActiveService.getByPage(page, detachedCriteria);
			List<RMFormulaProcessActive> formulaProcessActiveList = datas.getResult();
			if (formulaProcessActiveList == null || formulaProcessActiveList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(formulaProcessActiveList.toArray());
			PaginationDTO<RMFormulaProcessActive> pagination = new PaginationDTO<RMFormulaProcessActive>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到工序活动则返回空。
	 * @param formulaProcessActive
	 * @return
	 */
	private RMFormulaProcessActive getFormulaProcessActive(RMFormulaProcessActive formulaProcessActive) {
		if (formulaProcessActive.getId() == null)
			throw new RuntimeException("id不能为空");
		RMFormulaProcessActive result = formulaProcessActiveService.getFormulaProcessActive(formulaProcessActive.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果工序活动不存在，返回false；如果原来没有配方表对象，且修改的时候也没有配置配方表对象，则报错；如果配置的配方表对象不存在，则报错；
	 * @param formulaProcessActive
	 * @return 
	 */
	private boolean beforeUpdateFormulaProcessActive(RMFormulaProcessActive formulaProcessActive){
		if(formulaProcessActive.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		RMFormulaProcessActive temp = getFormulaProcessActive(formulaProcessActive);
		if(temp == null){
			return false;
		}
		formulaProcessActive.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMFormulaProcessActive> clearFormulaProcessActiveNonMainField(List<RMFormulaProcessActive> list){
		 List<RMFormulaProcessActive> formulaProcessActiveList = new ArrayList<RMFormulaProcessActive>();
		 for(RMFormulaProcessActive formulaProcessActive:list){
			 RMFormulaProcessActive temp = new RMFormulaProcessActive();
			 temp.setId(formulaProcessActive.getId());
		 	 formulaProcessActiveList.add(temp);
		 }
		 return formulaProcessActiveList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkFormulaProcessActiveData(RMFormulaProcessActive formulaProcessActive){
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
	 * 获取配方表对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param formula
	 * @return
	 */
	private RMFormula getFormula(RMFormula formula) {
		if (formula.getId() == null && (formula.getTableNo() == null || formula.getTableNo().toString().trim() == ""))
			throw new RuntimeException("配方表对象业务主键和id不能同时为空");
		if (formula.getId() != null) {
			RMFormula result = formulaService.getFormula(formula .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return formulaService.loadFormulaByBussinessKey(formula.getTableNo());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个配方表，则返回false，否则返回true
	 * @param formula
	 */
	private boolean beforeUpdateFormula(RMFormula formula) {
		formula.setStatus(99);
		if(formula.getTableInfoId() == null){
			throw new RuntimeException("tableInfoId不能为空。");
		}
		RMFormula temp = getFormula(formula);
		if (temp == null) {
			return false;
		}
		if(formula.getId() == null){
			formula.setId(temp.getId());		
		}
		if(formula.getTableNo() == null){
			formula.setTableNo(temp.getTableNo());
		}
		
		formula.setVersion(temp.getVersion());
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
	 * 清除配方表对象下所有辅模型对象中的配方表对象
	 * @param formula
	 */
	private void clearCircle(RMFormula formula) {
		if (formula.getCheckDepartmentSetList() != null && formula.getCheckDepartmentSetList().size() > 0) {
			for (RMCheckDepartmentSet checkDepartmentSet : formula.getCheckDepartmentSetList()) {
				checkDepartmentSet.setFormulaID(null);
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
	private void checkFormulaData(RMFormula formula){
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}