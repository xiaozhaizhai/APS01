package com.supcon.orchid.MESBasic.services.impl;
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
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchData;
import com.supcon.orchid.MESBasic.entities.MESBasicQACheckIndex;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEamType;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicObjEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicObjPostion;
import com.supcon.orchid.MESBasic.entities.MESBasicObjProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicObjTeam;
import com.supcon.orchid.MESBasic.entities.MESBasicObjWareStore;
import com.supcon.orchid.MESBasic.entities.MESBasicPositionDeal;
import com.supcon.orchid.MESBasic.entities.MESBasicDepartmentWare;
import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicNodeType;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicPotData;
import com.supcon.orchid.MESBasic.entities.MESBasicProdAttribute;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.MESBasic.entities.MESBasicProdattrel;
import com.supcon.orchid.MESBasic.entities.MESBasicCommDealInfo;
import com.supcon.orchid.MESBasic.entities.MESBasicCprodAtt;
import com.supcon.orchid.MESBasic.entities.MESBasicProdDealInfo;
import com.supcon.orchid.MESBasic.entities.MESBasicProdLevel;
import com.supcon.orchid.MESBasic.entities.MESBasicProdResetDaily;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicProductCost;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroup;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroupMember;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
import com.supcon.orchid.MESBasic.entities.MESBasicWareClass;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;
import com.supcon.orchid.MESBasic.services.MESBasicRoutineWSService;
import com.supcon.orchid.MESBasic.services.MESBasicRoutineService;
import com.supcon.orchid.MESBasic.services.MESBasicInvolveItemsetupsService;
import com.supcon.orchid.MESBasic.services.MESBasicConfigService;
import com.supcon.orchid.MESBasic.services.MESBasicSwitcherModelService;
	
/* CUSTOM CODE START(wsserviceimpl,import,MESBasic_1_routine_Routine,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="MESBasicRoutine",targetNamespace = "http://ws.supcon.com")
public class MESBasicRoutineWSServiceImpl implements MESBasicRoutineWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private MESBasicRoutineService routineService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private MESBasicInvolveItemsetupsService involveItemsetupsService;
	@Resource
	private MESBasicConfigService configService;
	@Resource
	private MESBasicSwitcherModelService switcherModelService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取路径数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getRoutineByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			MESBasicRoutine routine = routineService.loadRoutineByBussinessKey(businessKey);
			if(routine == null){
				return set404Error(result);
			}
			//添加辅模型
			List<MESBasicInvolveItemsetups> involveItemsetupsList = clearInvolveItemsetupsNonMainField(routineService.getInvolveItemsetupsList(routine));
			routine.setInvolveItemsetupsList(involveItemsetupsList);
			List<MESBasicConfig> configList = clearConfigNonMainField(routineService.getConfigList(routine));
			routine.setConfigList(configList);
			List<MESBasicSwitcherModel> switcherModelList = clearSwitcherModelNonMainField(routineService.getSwitcherModelList(routine));
			routine.setSwitcherModelList(switcherModelList);
			
			setSuccessResult(result, routine);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取路径数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getRoutineByPk(
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
			
			MESBasicRoutine routine = routineService.getRoutine(id);
			if(routine == null || !routine.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<MESBasicInvolveItemsetups> involveItemsetupsList = clearInvolveItemsetupsNonMainField(routineService.getInvolveItemsetupsList(routine));
			routine.setInvolveItemsetupsList(involveItemsetupsList);
			List<MESBasicConfig> configList = clearConfigNonMainField(routineService.getConfigList(routine));
			routine.setConfigList(configList);
			List<MESBasicSwitcherModel> switcherModelList = clearSwitcherModelNonMainField(routineService.getSwitcherModelList(routine));
			routine.setSwitcherModelList(switcherModelList);
			setSuccessResult(result, routine);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改路径数据
	 * @param 路径对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateRoutine(
		@WebParam(name="routine")MESBasicRoutine routine,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(routine == null){
				return set500Error(result, "路径不能为空。");
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
			
			if(!beforeUpdateRoutine(routine)){
				return set404Error(result);
			}
			routineService.saveRoutine(routine, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addRoutine(
		@WebParam(name="routine")MESBasicRoutine routine,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(routine == null){
				return set500Error(result, "路径不能为空。");
			}
		
			if(routine.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(routine.getCode() == null){
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
				checkRoutineData(routine);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			routineService.saveRoutine(routine, null);
			setSuccessResult(result, routine.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteRoutineByBusinessKey(
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
			MESBasicRoutine routine = null;
			try{
				routine = routineService.loadRoutineByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(routine == null){
				return set404Error(result);
			}
			routineService.deleteRoutine(routine);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteRoutineByPk(
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
			MESBasicRoutine routine = null;
			try{
				routine = routineService.getRoutine(id);
			}catch(NullPointerException e){}
			if(routine == null || !routine.isValid()){
				return set404Error(result);
			}
			routineService.deleteRoutine(routine);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddRoutine(
		@WebParam(name="routineList")List<MESBasicRoutine> routineList,
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
			for(MESBasicRoutine routine : routineList){
				if(routine.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(routine.getCode() == null || routine.getCode().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkRoutineData(routine);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			routineService.batchImportBaseRoutine(routineList);
			for(MESBasicRoutine routine : routineList){
				idList.add(routine.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateRoutine(
		@WebParam(name="routineList")List<MESBasicRoutine> routineList,
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
			for(MESBasicRoutine routine : routineList){
				try{
					if(!beforeUpdateRoutine(routine)){
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
			routineService.batchImportBaseRoutine(routineList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteRoutineByPk(
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
				MESBasicRoutine temp = null;
				try{
					temp = routineService.getRoutine(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			routineService.deleteRoutine(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteRoutineByBusinessKey(
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
				MESBasicRoutine temp = null;
				try{
					temp = routineService.loadRoutineByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			routineService.deleteRoutine(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getRoutinePage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicRoutine.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),MESBasicRoutine.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicRoutine.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicRoutine.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicRoutine.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicRoutine> page = new Page<MESBasicRoutine>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicRoutine> datas = routineService.getByPage(page, detachedCriteria);
			List<MESBasicRoutine> routineList = datas.getResult();
			if (routineList == null || routineList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(routineList.toArray());
			PaginationDTO<MESBasicRoutine> pagination = new PaginationDTO<MESBasicRoutine>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据路径业务主键查询路径下所有辅模型
	 * @param 路径业务主键
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
			MESBasicRoutine routine = routineService.loadRoutineByBussinessKey(businessKey);
			if (routine == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap involveItemsetupsMap = new SimulationMap();
			involveItemsetupsMap.setName(InternationalResource.get("InvolveItemsetups"));
			involveItemsetupsMap.setList(routineService.getInvolveItemsetupsList(routine));
			resultList.add(involveItemsetupsMap);
			
			SimulationMap configMap = new SimulationMap();
			configMap.setName(InternationalResource.get("Config"));
			configMap.setList(routineService.getConfigList(routine));
			resultList.add(configMap);
			
			SimulationMap switcherModelMap = new SimulationMap();
			switcherModelMap.setName(InternationalResource.get("SwitcherModel"));
			switcherModelMap.setList(routineService.getSwitcherModelList(routine));
			resultList.add(switcherModelMap);
			
			clearCircle(routine);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据路径id查询路径下所有辅模型
	 * 
	 * @param 路径id
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
			MESBasicRoutine routine = routineService.getRoutine(id);
			if (routine == null || !routine.isValid()) {
				result.setErrorMessage("找不到路径");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap involveItemsetupsMap = new SimulationMap();
			involveItemsetupsMap.setName(InternationalResource.get("InvolveItemsetups"));
			involveItemsetupsMap.setList(routineService.getInvolveItemsetupsList(routine));
			resultList.add(involveItemsetupsMap);
			
			SimulationMap configMap = new SimulationMap();
			configMap.setName(InternationalResource.get("Config"));
			configMap.setList(routineService.getConfigList(routine));
			resultList.add(configMap);
			
			SimulationMap switcherModelMap = new SimulationMap();
			switcherModelMap.setName(InternationalResource.get("SwitcherModel"));
			switcherModelMap.setList(routineService.getSwitcherModelList(routine));
			resultList.add(switcherModelMap);
			
			clearCircle(routine);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  计算涉及的测点-------------------------------------------------
	//--hasLink:true---link:Routine
	/**
	 * 根据计算涉及的测点业务主键分页查询计算涉及的测点数据
	 * 
	 * @param 计算涉及的测点业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getInvolveItemsetupsPageByRoutineBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicInvolveItemsetups.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicInvolveItemsetups.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicInvolveItemsetups.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicInvolveItemsetups.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicInvolveItemsetups.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			MESBasicRoutine routine = routineService.loadRoutineByBussinessKey(businessKey);
			if (routine == null) {
				return set500Error(result, "该业务主键的路径不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("routine",routine));
			Page<MESBasicInvolveItemsetups> page = new Page<MESBasicInvolveItemsetups>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicInvolveItemsetups> datas = involveItemsetupsService.getByPage(page, detachedCriteria);
			List<MESBasicInvolveItemsetups> involveItemsetupsList = datas.getResult();
			if (involveItemsetupsList == null || involveItemsetupsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(involveItemsetupsList.toArray());
			PaginationDTO<MESBasicInvolveItemsetups> pagination = new PaginationDTO<MESBasicInvolveItemsetups>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据计算涉及的测点id分页查询计算涉及的测点数据
	 * 
	 * @param 计算涉及的测点id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getInvolveItemsetupsPageByRoutinePk(	
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicInvolveItemsetups.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), MESBasicInvolveItemsetups.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicInvolveItemsetups.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicInvolveItemsetups.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicInvolveItemsetups.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			MESBasicRoutine routine = routineService.getRoutine(id);
			if (routine == null) {
				return set500Error(result, "该主键的路径不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("routine",routine));
			Page<MESBasicInvolveItemsetups> page = new Page<MESBasicInvolveItemsetups>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicInvolveItemsetups> datas = involveItemsetupsService.getByPage(page, detachedCriteria);
			List<MESBasicInvolveItemsetups> involveItemsetupsList = datas.getResult();
			if (involveItemsetupsList == null || involveItemsetupsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(involveItemsetupsList.toArray());
			PaginationDTO<MESBasicInvolveItemsetups> pagination = new PaginationDTO<MESBasicInvolveItemsetups>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据计算涉及的测点id分获取计算涉及的测点数据
	 * 
	 * @param 计算涉及的测点id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getInvolveItemsetups(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicInvolveItemsetups involveItemsetups = involveItemsetupsService.getInvolveItemsetups(id);
			if(involveItemsetups == null){
				return set404Error(result);
			}
			setSuccessResult(result, involveItemsetups);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据计算涉及的测点业务id修改计算涉及的测点数据
	 * 
	 * @param 计算涉及的测点对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateInvolveItemsetups(
		@WebParam(name="involveItemsetups")MESBasicInvolveItemsetups involveItemsetups,
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
			if(!beforeUpdateInvolveItemsetups(involveItemsetups)){
				return set404Error(result);
			}
			involveItemsetupsService.saveInvolveItemsetups(involveItemsetups, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增计算涉及的测点
	 * 
	 * @param 计算涉及的测点对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addInvolveItemsetups(
		@WebParam(name="involveItemsetups")MESBasicInvolveItemsetups involveItemsetups,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(involveItemsetups == null){
				return set500Error(result, "计算涉及的测点对象不能为空。");
			}
			if(involveItemsetups.getId() != null){
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
				checkInvolveItemsetupsData(involveItemsetups);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			MESBasicRoutine tempRoutine = involveItemsetups.getRoutine();
			if (tempRoutine == null) {
				return set500Error(result, "路径对象不能为空");
			}
			
			MESBasicRoutine routine = null;
			if(tempRoutine.getId()!= null){
				routine = routineService.getRoutine(tempRoutine.getId());
			}else if(tempRoutine.getCode() != null){
				routine = routineService.loadRoutineByBussinessKey(tempRoutine.getCode());
			}else{
				return set500Error(result, "路径对象必须设置id或业务主键。");
			}
			
			if(routine == null){
				return set404Error(result);
			}
			involveItemsetups.setRoutine(routine);
			
			involveItemsetupsService.saveInvolveItemsetups(involveItemsetups, null);
			Long involveItemsetupsId = involveItemsetups.getId();
			setSuccessResult(result, involveItemsetupsId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据计算涉及的测点id 删除计算涉及的测点
	 * 
	 * @param 计算涉及的测点id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteInvolveItemsetups(
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
			
			MESBasicInvolveItemsetups involveItemsetups = null;
			try{
				involveItemsetups = involveItemsetupsService.getInvolveItemsetups(id);
			}catch(NullPointerException e){}
			if(involveItemsetups == null  || !involveItemsetups.isValid()){
				return set404Error(result);
			}
			involveItemsetupsService.deleteInvolveItemsetups(involveItemsetups);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改计算涉及的测点数据，计算涉及的测点id不能为空
	 *
	 * @param 计算涉及的测点列表，每个计算涉及的测点必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateInvolveItemsetups(
		@WebParam(name="involveItemsetupsList")List<MESBasicInvolveItemsetups> involveItemsetupsList,
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
			for(MESBasicInvolveItemsetups involveItemsetups : involveItemsetupsList){
				try{
					if(!beforeUpdateInvolveItemsetups(involveItemsetups)){
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
			
			involveItemsetupsService.batchImportBaseInvolveItemsetups(involveItemsetupsList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增计算涉及的测点数据
	 * 
	 * @param 计算涉及的测点列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddInvolveItemsetups(
		@WebParam(name="involveItemsetupsList")List<MESBasicInvolveItemsetups> involveItemsetupsList,
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
			
			if(involveItemsetupsList == null){
				set500Error(result, "involveItemsetupsList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicInvolveItemsetups involveItemsetups : involveItemsetupsList){
				if(involveItemsetups.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(involveItemsetups.getRoutine() == null){
						set500Error(result, "第"+count+"条数据出错：路径对象不能为空。");
						return result;
					}
					MESBasicRoutine routine = getRoutine(involveItemsetups.getRoutine());
					if(routine == null){
						set500Error(result, "第"+count+"条数据出错：路径对象不存在。");
						return result;
					}
					involveItemsetups.setRoutine(routine);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkInvolveItemsetupsData(involveItemsetups);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			involveItemsetupsService.batchImportBaseInvolveItemsetups(involveItemsetupsList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicInvolveItemsetups involveItemsetups : involveItemsetupsList){
				idList.add(involveItemsetups.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据计算涉及的测点id，批量删除计算涉及的测点数据
	 * 
	 * @param 计算涉及的测点id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelInvolveItemsetups(
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
			
			List<MESBasicInvolveItemsetups> involveItemsetupsList = new ArrayList<MESBasicInvolveItemsetups>();
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
				
				MESBasicInvolveItemsetups involveItemsetups = involveItemsetupsService.getInvolveItemsetups(id);
				if(involveItemsetups == null || !involveItemsetups.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				involveItemsetupsList.add(involveItemsetups);
				
				count ++;
			}
			for(MESBasicInvolveItemsetups involveItemsetups : involveItemsetupsList){
				involveItemsetupsService.deleteInvolveItemsetups(involveItemsetups);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有计算涉及的测点数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getInvolveItemsetupsPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicInvolveItemsetups.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicInvolveItemsetups.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicInvolveItemsetups.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicInvolveItemsetups.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicInvolveItemsetups.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicInvolveItemsetups> page = new Page<MESBasicInvolveItemsetups>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicInvolveItemsetups> datas = involveItemsetupsService.getByPage(page, detachedCriteria);
			List<MESBasicInvolveItemsetups> involveItemsetupsList = datas.getResult();
			if (involveItemsetupsList == null || involveItemsetupsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(involveItemsetupsList.toArray());
			PaginationDTO<MESBasicInvolveItemsetups> pagination = new PaginationDTO<MESBasicInvolveItemsetups>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到计算涉及的测点则返回空。
	 * @param involveItemsetups
	 * @return
	 */
	private MESBasicInvolveItemsetups getInvolveItemsetups(MESBasicInvolveItemsetups involveItemsetups) {
		if (involveItemsetups.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicInvolveItemsetups result = involveItemsetupsService.getInvolveItemsetups(involveItemsetups.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果计算涉及的测点不存在，返回false；如果原来没有路径对象，且修改的时候也没有配置路径对象，则报错；如果配置的路径对象不存在，则报错；
	 * @param involveItemsetups
	 * @return 
	 */
	private boolean beforeUpdateInvolveItemsetups(MESBasicInvolveItemsetups involveItemsetups){
		if(involveItemsetups.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicInvolveItemsetups temp = getInvolveItemsetups(involveItemsetups);
		if(temp == null){
			return false;
		}
		MESBasicRoutine routine = null;
		if (temp.getRoutine() == null) {
			if (involveItemsetups.getRoutine() == null || (involveItemsetups.getRoutine().getId() == null && involveItemsetups.getRoutine().getCode() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				routine = getRoutine(involveItemsetups.getRoutine());
				if(routine == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (involveItemsetups.getRoutine() == null || (involveItemsetups.getRoutine().getId() == null && involveItemsetups.getRoutine().getCode() == null)) {
				routine = temp.getRoutine();
			} else {
				routine = getRoutine(involveItemsetups.getRoutine());
				if (routine == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		involveItemsetups.setRoutine(routine);
		involveItemsetups.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicInvolveItemsetups> clearInvolveItemsetupsNonMainField(List<MESBasicInvolveItemsetups> list){
		 List<MESBasicInvolveItemsetups> involveItemsetupsList = new ArrayList<MESBasicInvolveItemsetups>();
		 for(MESBasicInvolveItemsetups involveItemsetups:list){
			 MESBasicInvolveItemsetups temp = new MESBasicInvolveItemsetups();
			 temp.setId(involveItemsetups.getId());
			 temp.setVersion(involveItemsetups.getVersion());
		 	 involveItemsetupsList.add(temp);
		 }
		 return involveItemsetupsList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkInvolveItemsetupsData(MESBasicInvolveItemsetups involveItemsetups){
	}
	 
	//------------------------------------辅模型 WS  路径配置-------------------------------------------------
	//--hasLink:true---link:Routine
	/**
	 * 根据路径配置业务主键分页查询路径配置数据
	 * 
	 * @param 路径配置业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getConfigPageByRoutineBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicConfig.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicConfig.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicConfig.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicConfig.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicConfig.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			MESBasicRoutine routine = routineService.loadRoutineByBussinessKey(businessKey);
			if (routine == null) {
				return set500Error(result, "该业务主键的路径不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("routine",routine));
			Page<MESBasicConfig> page = new Page<MESBasicConfig>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicConfig> datas = configService.getByPage(page, detachedCriteria);
			List<MESBasicConfig> configList = datas.getResult();
			if (configList == null || configList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(configList.toArray());
			PaginationDTO<MESBasicConfig> pagination = new PaginationDTO<MESBasicConfig>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据路径配置id分页查询路径配置数据
	 * 
	 * @param 路径配置id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getConfigPageByRoutinePk(	
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicConfig.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), MESBasicConfig.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicConfig.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicConfig.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicConfig.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			MESBasicRoutine routine = routineService.getRoutine(id);
			if (routine == null) {
				return set500Error(result, "该主键的路径不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("routine",routine));
			Page<MESBasicConfig> page = new Page<MESBasicConfig>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicConfig> datas = configService.getByPage(page, detachedCriteria);
			List<MESBasicConfig> configList = datas.getResult();
			if (configList == null || configList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(configList.toArray());
			PaginationDTO<MESBasicConfig> pagination = new PaginationDTO<MESBasicConfig>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据路径配置id分获取路径配置数据
	 * 
	 * @param 路径配置id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getConfig(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicConfig config = configService.getConfig(id);
			if(config == null){
				return set404Error(result);
			}
			setSuccessResult(result, config);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据路径配置业务id修改路径配置数据
	 * 
	 * @param 路径配置对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateConfig(
		@WebParam(name="config")MESBasicConfig config,
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
			if(!beforeUpdateConfig(config)){
				return set404Error(result);
			}
			configService.saveConfig(config, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增路径配置
	 * 
	 * @param 路径配置对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addConfig(
		@WebParam(name="config")MESBasicConfig config,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(config == null){
				return set500Error(result, "路径配置对象不能为空。");
			}
			if(config.getId() != null){
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
				checkConfigData(config);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			MESBasicRoutine tempRoutine = config.getRoutine();
			if (tempRoutine == null) {
				return set500Error(result, "路径对象不能为空");
			}
			
			MESBasicRoutine routine = null;
			if(tempRoutine.getId()!= null){
				routine = routineService.getRoutine(tempRoutine.getId());
			}else if(tempRoutine.getCode() != null){
				routine = routineService.loadRoutineByBussinessKey(tempRoutine.getCode());
			}else{
				return set500Error(result, "路径对象必须设置id或业务主键。");
			}
			
			if(routine == null){
				return set404Error(result);
			}
			config.setRoutine(routine);
			
			configService.saveConfig(config, null);
			Long configId = config.getId();
			setSuccessResult(result, configId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据路径配置id 删除路径配置
	 * 
	 * @param 路径配置id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteConfig(
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
			
			MESBasicConfig config = null;
			try{
				config = configService.getConfig(id);
			}catch(NullPointerException e){}
			if(config == null  || !config.isValid()){
				return set404Error(result);
			}
			configService.deleteConfig(config);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改路径配置数据，路径配置id不能为空
	 *
	 * @param 路径配置列表，每个路径配置必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateConfig(
		@WebParam(name="configList")List<MESBasicConfig> configList,
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
			for(MESBasicConfig config : configList){
				try{
					if(!beforeUpdateConfig(config)){
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
			
			configService.batchImportBaseConfig(configList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增路径配置数据
	 * 
	 * @param 路径配置列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddConfig(
		@WebParam(name="configList")List<MESBasicConfig> configList,
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
			
			if(configList == null){
				set500Error(result, "configList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicConfig config : configList){
				if(config.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(config.getRoutine() == null){
						set500Error(result, "第"+count+"条数据出错：路径对象不能为空。");
						return result;
					}
					MESBasicRoutine routine = getRoutine(config.getRoutine());
					if(routine == null){
						set500Error(result, "第"+count+"条数据出错：路径对象不存在。");
						return result;
					}
					config.setRoutine(routine);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkConfigData(config);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			configService.batchImportBaseConfig(configList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicConfig config : configList){
				idList.add(config.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据路径配置id，批量删除路径配置数据
	 * 
	 * @param 路径配置id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelConfig(
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
			
			List<MESBasicConfig> configList = new ArrayList<MESBasicConfig>();
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
				
				MESBasicConfig config = configService.getConfig(id);
				if(config == null || !config.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				configList.add(config);
				
				count ++;
			}
			for(MESBasicConfig config : configList){
				configService.deleteConfig(config);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有路径配置数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getConfigPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicConfig.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicConfig.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicConfig.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicConfig.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicConfig.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicConfig> page = new Page<MESBasicConfig>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicConfig> datas = configService.getByPage(page, detachedCriteria);
			List<MESBasicConfig> configList = datas.getResult();
			if (configList == null || configList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(configList.toArray());
			PaginationDTO<MESBasicConfig> pagination = new PaginationDTO<MESBasicConfig>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到路径配置则返回空。
	 * @param config
	 * @return
	 */
	private MESBasicConfig getConfig(MESBasicConfig config) {
		if (config.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicConfig result = configService.getConfig(config.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果路径配置不存在，返回false；如果原来没有路径对象，且修改的时候也没有配置路径对象，则报错；如果配置的路径对象不存在，则报错；
	 * @param config
	 * @return 
	 */
	private boolean beforeUpdateConfig(MESBasicConfig config){
		if(config.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		if(config.getRoutine() == null){
			throw new RuntimeException("routine不能为空。");
		}
		MESBasicConfig temp = getConfig(config);
		if(temp == null){
			return false;
		}
		MESBasicRoutine routine = null;
		if (temp.getRoutine() == null) {
			if (config.getRoutine() == null || (config.getRoutine().getId() == null && config.getRoutine().getCode() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				routine = getRoutine(config.getRoutine());
				if(routine == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (config.getRoutine() == null || (config.getRoutine().getId() == null && config.getRoutine().getCode() == null)) {
				routine = temp.getRoutine();
			} else {
				routine = getRoutine(config.getRoutine());
				if (routine == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		config.setRoutine(routine);
		config.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicConfig> clearConfigNonMainField(List<MESBasicConfig> list){
		 List<MESBasicConfig> configList = new ArrayList<MESBasicConfig>();
		 for(MESBasicConfig config:list){
			 MESBasicConfig temp = new MESBasicConfig();
			 temp.setId(config.getId());
			 temp.setVersion(config.getVersion());
		 	 configList.add(temp);
		 }
		 return configList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkConfigData(MESBasicConfig config){
		 if(config.getRoutine() == null){
		 	throw new RuntimeException("routine不能为空。");
		 }
	}
	 
	//------------------------------------辅模型 WS  开关量-------------------------------------------------
	//--hasLink:true---link:Config
	/**
	 * 根据开关量业务主键分页查询开关量数据
	 * 
	 * @param 开关量业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getSwitcherModelPageByRoutineBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicSwitcherModel.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicSwitcherModel.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicSwitcherModel.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicSwitcherModel.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicSwitcherModel.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			MESBasicRoutine routine = routineService.loadRoutineByBussinessKey(businessKey);
			if (routine == null) {
				return set500Error(result, "该业务主键的路径不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("config",routine));
			Page<MESBasicSwitcherModel> page = new Page<MESBasicSwitcherModel>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicSwitcherModel> datas = switcherModelService.getByPage(page, detachedCriteria);
			List<MESBasicSwitcherModel> switcherModelList = datas.getResult();
			if (switcherModelList == null || switcherModelList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(switcherModelList.toArray());
			PaginationDTO<MESBasicSwitcherModel> pagination = new PaginationDTO<MESBasicSwitcherModel>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据开关量id分页查询开关量数据
	 * 
	 * @param 开关量id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getSwitcherModelPageByRoutinePk(	
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicSwitcherModel.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), MESBasicSwitcherModel.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicSwitcherModel.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicSwitcherModel.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicSwitcherModel.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			MESBasicRoutine routine = routineService.getRoutine(id);
			if (routine == null) {
				return set500Error(result, "该主键的路径不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("config",routine));
			Page<MESBasicSwitcherModel> page = new Page<MESBasicSwitcherModel>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicSwitcherModel> datas = switcherModelService.getByPage(page, detachedCriteria);
			List<MESBasicSwitcherModel> switcherModelList = datas.getResult();
			if (switcherModelList == null || switcherModelList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(switcherModelList.toArray());
			PaginationDTO<MESBasicSwitcherModel> pagination = new PaginationDTO<MESBasicSwitcherModel>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据开关量id分获取开关量数据
	 * 
	 * @param 开关量id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getSwitcherModel(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicSwitcherModel switcherModel = switcherModelService.getSwitcherModel(id);
			if(switcherModel == null){
				return set404Error(result);
			}
			setSuccessResult(result, switcherModel);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据开关量业务id修改开关量数据
	 * 
	 * @param 开关量对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateSwitcherModel(
		@WebParam(name="switcherModel")MESBasicSwitcherModel switcherModel,
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
			if(!beforeUpdateSwitcherModel(switcherModel)){
				return set404Error(result);
			}
			switcherModelService.saveSwitcherModel(switcherModel, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增开关量
	 * 
	 * @param 开关量对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addSwitcherModel(
		@WebParam(name="switcherModel")MESBasicSwitcherModel switcherModel,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(switcherModel == null){
				return set500Error(result, "开关量对象不能为空。");
			}
			if(switcherModel.getId() != null){
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
				checkSwitcherModelData(switcherModel);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			MESBasicRoutine tempRoutine = switcherModel.getConfig();
			if (tempRoutine == null) {
				return set500Error(result, "路径对象不能为空");
			}
			
			MESBasicRoutine routine = null;
			if(tempRoutine.getId()!= null){
				routine = routineService.getRoutine(tempRoutine.getId());
			}else if(tempRoutine.getCode() != null){
				routine = routineService.loadRoutineByBussinessKey(tempRoutine.getCode());
			}else{
				return set500Error(result, "路径对象必须设置id或业务主键。");
			}
			
			if(routine == null){
				return set404Error(result);
			}
			switcherModel.setConfig(routine);
			
			switcherModelService.saveSwitcherModel(switcherModel, null);
			Long switcherModelId = switcherModel.getId();
			setSuccessResult(result, switcherModelId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据开关量id 删除开关量
	 * 
	 * @param 开关量id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteSwitcherModel(
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
			
			MESBasicSwitcherModel switcherModel = null;
			try{
				switcherModel = switcherModelService.getSwitcherModel(id);
			}catch(NullPointerException e){}
			if(switcherModel == null  || !switcherModel.isValid()){
				return set404Error(result);
			}
			switcherModelService.deleteSwitcherModel(switcherModel);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改开关量数据，开关量id不能为空
	 *
	 * @param 开关量列表，每个开关量必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateSwitcherModel(
		@WebParam(name="switcherModelList")List<MESBasicSwitcherModel> switcherModelList,
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
			for(MESBasicSwitcherModel switcherModel : switcherModelList){
				try{
					if(!beforeUpdateSwitcherModel(switcherModel)){
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
			
			switcherModelService.batchImportBaseSwitcherModel(switcherModelList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增开关量数据
	 * 
	 * @param 开关量列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddSwitcherModel(
		@WebParam(name="switcherModelList")List<MESBasicSwitcherModel> switcherModelList,
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
			
			if(switcherModelList == null){
				set500Error(result, "switcherModelList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicSwitcherModel switcherModel : switcherModelList){
				if(switcherModel.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(switcherModel.getConfig() == null){
						set500Error(result, "第"+count+"条数据出错：路径对象不能为空。");
						return result;
					}
					MESBasicRoutine routine = getRoutine(switcherModel.getConfig());
					if(routine == null){
						set500Error(result, "第"+count+"条数据出错：路径对象不存在。");
						return result;
					}
					switcherModel.setConfig(routine);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkSwitcherModelData(switcherModel);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			switcherModelService.batchImportBaseSwitcherModel(switcherModelList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicSwitcherModel switcherModel : switcherModelList){
				idList.add(switcherModel.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据开关量id，批量删除开关量数据
	 * 
	 * @param 开关量id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelSwitcherModel(
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
			
			List<MESBasicSwitcherModel> switcherModelList = new ArrayList<MESBasicSwitcherModel>();
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
				
				MESBasicSwitcherModel switcherModel = switcherModelService.getSwitcherModel(id);
				if(switcherModel == null || !switcherModel.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				switcherModelList.add(switcherModel);
				
				count ++;
			}
			for(MESBasicSwitcherModel switcherModel : switcherModelList){
				switcherModelService.deleteSwitcherModel(switcherModel);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有开关量数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getSwitcherModelPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicSwitcherModel.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicSwitcherModel.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicSwitcherModel.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicSwitcherModel.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicSwitcherModel.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicSwitcherModel> page = new Page<MESBasicSwitcherModel>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicSwitcherModel> datas = switcherModelService.getByPage(page, detachedCriteria);
			List<MESBasicSwitcherModel> switcherModelList = datas.getResult();
			if (switcherModelList == null || switcherModelList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(switcherModelList.toArray());
			PaginationDTO<MESBasicSwitcherModel> pagination = new PaginationDTO<MESBasicSwitcherModel>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到开关量则返回空。
	 * @param switcherModel
	 * @return
	 */
	private MESBasicSwitcherModel getSwitcherModel(MESBasicSwitcherModel switcherModel) {
		if (switcherModel.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicSwitcherModel result = switcherModelService.getSwitcherModel(switcherModel.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果开关量不存在，返回false；如果原来没有路径对象，且修改的时候也没有配置路径对象，则报错；如果配置的路径对象不存在，则报错；
	 * @param switcherModel
	 * @return 
	 */
	private boolean beforeUpdateSwitcherModel(MESBasicSwitcherModel switcherModel){
		if(switcherModel.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		if(switcherModel.getStype() == null){
			throw new RuntimeException("stype不能为空。");
		}
		MESBasicSwitcherModel temp = getSwitcherModel(switcherModel);
		if(temp == null){
			return false;
		}
		MESBasicRoutine routine = null;
		if (temp.getConfig() == null) {
			if (switcherModel.getConfig() == null || (switcherModel.getConfig().getId() == null && switcherModel.getConfig().getCode() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				routine = getRoutine(switcherModel.getConfig());
				if(routine == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (switcherModel.getConfig() == null || (switcherModel.getConfig().getId() == null && switcherModel.getConfig().getCode() == null)) {
				routine = temp.getConfig();
			} else {
				routine = getRoutine(switcherModel.getConfig());
				if (routine == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		switcherModel.setConfig(routine);
		switcherModel.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicSwitcherModel> clearSwitcherModelNonMainField(List<MESBasicSwitcherModel> list){
		 List<MESBasicSwitcherModel> switcherModelList = new ArrayList<MESBasicSwitcherModel>();
		 for(MESBasicSwitcherModel switcherModel:list){
			 MESBasicSwitcherModel temp = new MESBasicSwitcherModel();
			 temp.setId(switcherModel.getId());
			 temp.setVersion(switcherModel.getVersion());
		 	 switcherModelList.add(temp);
		 }
		 return switcherModelList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkSwitcherModelData(MESBasicSwitcherModel switcherModel){
		 if(switcherModel.getStype() == null){
		 	throw new RuntimeException("stype不能为空。");
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
	 * 获取路径对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param routine
	 * @return
	 */
	private MESBasicRoutine getRoutine(MESBasicRoutine routine) {
		if (routine.getId() == null && (routine.getCode() == null || routine.getCode().toString().trim() == ""))
			throw new RuntimeException("路径对象业务主键和id不能同时为空");
		if (routine.getId() != null) {
			MESBasicRoutine result = routineService.getRoutine(routine .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return routineService.loadRoutineByBussinessKey(routine.getCode());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个路径，则返回false，否则返回true
	 * @param routine
	 */
	private boolean beforeUpdateRoutine(MESBasicRoutine routine) {
		if(routine.getName() == null){
			throw new RuntimeException("name不能为空。");
		}
		MESBasicRoutine temp = getRoutine(routine);
		if (temp == null) {
			return false;
		}
		if(routine.getId() == null){
			routine.setId(temp.getId());		
		}
		if(routine.getCode() == null){
			routine.setCode(temp.getCode());
		}
		
		routine.setVersion(temp.getVersion());
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
	 * 清除路径对象下所有辅模型对象中的路径对象
	 * @param routine
	 */
	private void clearCircle(MESBasicRoutine routine) {
		if (routine.getInvolveItemsetupsList() != null && routine.getInvolveItemsetupsList().size() > 0) {
			for (MESBasicInvolveItemsetups involveItemsetups : routine.getInvolveItemsetupsList()) {
				involveItemsetups.setRoutine(null);
			}
		}
		if (routine.getConfigList() != null && routine.getConfigList().size() > 0) {
			for (MESBasicConfig config : routine.getConfigList()) {
				config.setRoutine(null);
			}
		}
		if (routine.getSwitcherModelList() != null && routine.getSwitcherModelList().size() > 0) {
			for (MESBasicSwitcherModel switcherModel : routine.getSwitcherModelList()) {
				switcherModel.setConfig(null);
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
	private void checkRoutineData(MESBasicRoutine routine){
		 if(routine.getName() == null){
		 	throw new RuntimeException("name不能为空。");
		 }
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,MESBasic_1_routine_Routine,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}