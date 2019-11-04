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
import com.supcon.orchid.X6Basic.services.X6BasicUnitGroupsWSService;
import com.supcon.orchid.X6Basic.services.X6BasicUnitGroupsService;
import com.supcon.orchid.X6Basic.services.X6BasicBaseUnitService;
/* CUSTOM CODE START(wsserviceimpl,import,X6Basic_1.0_unitGroup_UnitGroups,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="X6BasicUnitGroups",targetNamespace = "http://ws.supcon.com")
public class X6BasicUnitGroupsWSServiceImpl implements X6BasicUnitGroupsWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private X6BasicUnitGroupsService unitGroupsService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private X6BasicBaseUnitService baseUnitService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取单位组数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getUnitGroupsByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			X6BasicUnitGroups unitGroups = unitGroupsService.loadUnitGroupsByBussinessKey(businessKey);
			if(unitGroups == null){
				return set404Error(result);
			}
			//添加辅模型
			List<X6BasicBaseUnit> baseUnitList = clearBaseUnitNonMainField(unitGroupsService.getBaseUnitList(unitGroups));
			unitGroups.setBaseUnitList(baseUnitList);
			
			setSuccessResult(result, unitGroups);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取单位组数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getUnitGroupsByPk(
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
			
			X6BasicUnitGroups unitGroups = unitGroupsService.getUnitGroups(id);
			if(unitGroups == null || !unitGroups.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<X6BasicBaseUnit> baseUnitList = clearBaseUnitNonMainField(unitGroupsService.getBaseUnitList(unitGroups));
			unitGroups.setBaseUnitList(baseUnitList);
			setSuccessResult(result, unitGroups);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改单位组数据
	 * @param 单位组对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateUnitGroups(
		@WebParam(name="unitGroups")X6BasicUnitGroups unitGroups,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(unitGroups == null){
				return set500Error(result, "单位组不能为空。");
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
			
			if(!beforeUpdateUnitGroups(unitGroups)){
				return set404Error(result);
			}
			unitGroupsService.saveUnitGroups(unitGroups, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addUnitGroups(
		@WebParam(name="unitGroups")X6BasicUnitGroups unitGroups,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(unitGroups == null){
				return set500Error(result, "单位组不能为空。");
			}
		
			if(unitGroups.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(unitGroups.getCode() == null){
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
				checkUnitGroupsData(unitGroups);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			unitGroupsService.saveUnitGroups(unitGroups, null);
			setSuccessResult(result, unitGroups.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteUnitGroupsByBusinessKey(
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
			X6BasicUnitGroups unitGroups = null;
			try{
				unitGroups = unitGroupsService.loadUnitGroupsByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(unitGroups == null){
				return set404Error(result);
			}
			unitGroupsService.deleteUnitGroups(unitGroups);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteUnitGroupsByPk(
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
			X6BasicUnitGroups unitGroups = null;
			try{
				unitGroups = unitGroupsService.getUnitGroups(id);
			}catch(NullPointerException e){}
			if(unitGroups == null || !unitGroups.isValid()){
				return set404Error(result);
			}
			unitGroupsService.deleteUnitGroups(unitGroups);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddUnitGroups(
		@WebParam(name="unitGroupsList")List<X6BasicUnitGroups> unitGroupsList,
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
			for(X6BasicUnitGroups unitGroups : unitGroupsList){
				if(unitGroups.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(unitGroups.getCode() == null || unitGroups.getCode().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkUnitGroupsData(unitGroups);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			unitGroupsService.batchImportBaseUnitGroups(unitGroupsList);
			for(X6BasicUnitGroups unitGroups : unitGroupsList){
				idList.add(unitGroups.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateUnitGroups(
		@WebParam(name="unitGroupsList")List<X6BasicUnitGroups> unitGroupsList,
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
			for(X6BasicUnitGroups unitGroups : unitGroupsList){
				try{
					if(!beforeUpdateUnitGroups(unitGroups)){
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
			unitGroupsService.batchImportBaseUnitGroups(unitGroupsList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteUnitGroupsByPk(
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
				X6BasicUnitGroups temp = null;
				try{
					temp = unitGroupsService.getUnitGroups(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			unitGroupsService.deleteUnitGroups(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteUnitGroupsByBusinessKey(
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
				X6BasicUnitGroups temp = null;
				try{
					temp = unitGroupsService.loadUnitGroupsByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			unitGroupsService.deleteUnitGroups(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getUnitGroupsPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(X6BasicUnitGroups.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),X6BasicUnitGroups.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicUnitGroups.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicUnitGroups.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicUnitGroups.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<X6BasicUnitGroups> page = new Page<X6BasicUnitGroups>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicUnitGroups> datas = unitGroupsService.getByPage(page, detachedCriteria);
			List<X6BasicUnitGroups> unitGroupsList = datas.getResult();
			if (unitGroupsList == null || unitGroupsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(unitGroupsList.toArray());
			PaginationDTO<X6BasicUnitGroups> pagination = new PaginationDTO<X6BasicUnitGroups>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据单位组业务主键查询单位组下所有辅模型
	 * @param 单位组业务主键
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
			X6BasicUnitGroups unitGroups = unitGroupsService.loadUnitGroupsByBussinessKey(businessKey);
			if (unitGroups == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap baseUnitMap = new SimulationMap();
			baseUnitMap.setName(InternationalResource.get("BaseUnit"));
			baseUnitMap.setList(unitGroupsService.getBaseUnitList(unitGroups));
			resultList.add(baseUnitMap);
			
			clearCircle(unitGroups);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据单位组id查询单位组下所有辅模型
	 * 
	 * @param 单位组id
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
			X6BasicUnitGroups unitGroups = unitGroupsService.getUnitGroups(id);
			if (unitGroups == null || !unitGroups.isValid()) {
				result.setErrorMessage("找不到单位组");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap baseUnitMap = new SimulationMap();
			baseUnitMap.setName(InternationalResource.get("BaseUnit"));
			baseUnitMap.setList(unitGroupsService.getBaseUnitList(unitGroups));
			resultList.add(baseUnitMap);
			
			clearCircle(unitGroups);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  单位-------------------------------------------------
	//--hasLink:true---link:UnitGroup
	/**
	 * 根据单位业务主键分页查询单位数据
	 * 
	 * @param 单位业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBaseUnitPageByUnitGroupsBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicBaseUnit.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), X6BasicBaseUnit.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicBaseUnit.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicBaseUnit.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicBaseUnit.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			X6BasicUnitGroups unitGroups = unitGroupsService.loadUnitGroupsByBussinessKey(businessKey);
			if (unitGroups == null) {
				return set500Error(result, "该业务主键的单位组不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("unitGroup",unitGroups));
			Page<X6BasicBaseUnit> page = new Page<X6BasicBaseUnit>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicBaseUnit> datas = baseUnitService.getByPage(page, detachedCriteria);
			List<X6BasicBaseUnit> baseUnitList = datas.getResult();
			if (baseUnitList == null || baseUnitList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(baseUnitList.toArray());
			PaginationDTO<X6BasicBaseUnit> pagination = new PaginationDTO<X6BasicBaseUnit>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据单位id分页查询单位数据
	 * 
	 * @param 单位id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBaseUnitPageByUnitGroupsPk(	
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicBaseUnit.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), X6BasicBaseUnit.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicBaseUnit.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicBaseUnit.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicBaseUnit.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			X6BasicUnitGroups unitGroups = unitGroupsService.getUnitGroups(id);
			if (unitGroups == null) {
				return set500Error(result, "该主键的单位组不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("unitGroup",unitGroups));
			Page<X6BasicBaseUnit> page = new Page<X6BasicBaseUnit>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicBaseUnit> datas = baseUnitService.getByPage(page, detachedCriteria);
			List<X6BasicBaseUnit> baseUnitList = datas.getResult();
			if (baseUnitList == null || baseUnitList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(baseUnitList.toArray());
			PaginationDTO<X6BasicBaseUnit> pagination = new PaginationDTO<X6BasicBaseUnit>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据单位id分获取单位数据
	 * 
	 * @param 单位id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBaseUnit(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			X6BasicBaseUnit baseUnit = baseUnitService.getBaseUnit(id);
			if(baseUnit == null){
				return set404Error(result);
			}
			setSuccessResult(result, baseUnit);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据单位业务id修改单位数据
	 * 
	 * @param 单位对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateBaseUnit(
		@WebParam(name="baseUnit")X6BasicBaseUnit baseUnit,
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
			if(!beforeUpdateBaseUnit(baseUnit)){
				return set404Error(result);
			}
			baseUnitService.saveBaseUnit(baseUnit, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增单位
	 * 
	 * @param 单位对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addBaseUnit(
		@WebParam(name="baseUnit")X6BasicBaseUnit baseUnit,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(baseUnit == null){
				return set500Error(result, "单位对象不能为空。");
			}
			if(baseUnit.getId() != null){
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
				checkBaseUnitData(baseUnit);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			X6BasicUnitGroups tempUnitGroups = baseUnit.getUnitGroup();
			if (tempUnitGroups == null) {
				return set500Error(result, "单位组对象不能为空");
			}
			
			X6BasicUnitGroups unitGroups = null;
			if(tempUnitGroups.getId()!= null){
				unitGroups = unitGroupsService.getUnitGroups(tempUnitGroups.getId());
			}else if(tempUnitGroups.getCode() != null){
				unitGroups = unitGroupsService.loadUnitGroupsByBussinessKey(tempUnitGroups.getCode());
			}else{
				return set500Error(result, "单位组对象必须设置id或业务主键。");
			}
			
			if(unitGroups == null){
				return set404Error(result);
			}
			baseUnit.setUnitGroup(unitGroups);
			
			baseUnitService.saveBaseUnit(baseUnit, null);
			Long baseUnitId = baseUnit.getId();
			setSuccessResult(result, baseUnitId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据单位id 删除单位
	 * 
	 * @param 单位id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteBaseUnit(
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
			
			X6BasicBaseUnit baseUnit = null;
			try{
				baseUnit = baseUnitService.getBaseUnit(id);
			}catch(NullPointerException e){}
			if(baseUnit == null  || !baseUnit.isValid()){
				return set404Error(result);
			}
			baseUnitService.deleteBaseUnit(baseUnit);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改单位数据，单位id不能为空
	 *
	 * @param 单位列表，每个单位必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateBaseUnit(
		@WebParam(name="baseUnitList")List<X6BasicBaseUnit> baseUnitList,
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
			for(X6BasicBaseUnit baseUnit : baseUnitList){
				try{
					if(!beforeUpdateBaseUnit(baseUnit)){
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
			
			baseUnitService.batchImportBaseBaseUnit(baseUnitList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增单位数据
	 * 
	 * @param 单位列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddBaseUnit(
		@WebParam(name="baseUnitList")List<X6BasicBaseUnit> baseUnitList,
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
			
			if(baseUnitList == null){
				set500Error(result, "baseUnitList不能为空。");
				return result;
			}
			
			int count = 1;
			for(X6BasicBaseUnit baseUnit : baseUnitList){
				if(baseUnit.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(baseUnit.getUnitGroup() == null){
						set500Error(result, "第"+count+"条数据出错：单位组对象不能为空。");
						return result;
					}
					X6BasicUnitGroups unitGroups = getUnitGroups(baseUnit.getUnitGroup());
					if(unitGroups == null){
						set500Error(result, "第"+count+"条数据出错：单位组对象不存在。");
						return result;
					}
					baseUnit.setUnitGroup(unitGroups);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkBaseUnitData(baseUnit);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			baseUnitService.batchImportBaseBaseUnit(baseUnitList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(X6BasicBaseUnit baseUnit : baseUnitList){
				idList.add(baseUnit.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据单位id，批量删除单位数据
	 * 
	 * @param 单位id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelBaseUnit(
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
			
			List<X6BasicBaseUnit> baseUnitList = new ArrayList<X6BasicBaseUnit>();
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
				
				X6BasicBaseUnit baseUnit = baseUnitService.getBaseUnit(id);
				if(baseUnit == null || !baseUnit.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				baseUnitList.add(baseUnit);
				
				count ++;
			}
			for(X6BasicBaseUnit baseUnit : baseUnitList){
				baseUnitService.deleteBaseUnit(baseUnit);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有单位数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBaseUnitPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(X6BasicBaseUnit.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), X6BasicBaseUnit.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(X6BasicBaseUnit.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,X6BasicBaseUnit.class);
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
				detachedCriteria = DetachedCriteria.forClass(X6BasicBaseUnit.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<X6BasicBaseUnit> page = new Page<X6BasicBaseUnit>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<X6BasicBaseUnit> datas = baseUnitService.getByPage(page, detachedCriteria);
			List<X6BasicBaseUnit> baseUnitList = datas.getResult();
			if (baseUnitList == null || baseUnitList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(baseUnitList.toArray());
			PaginationDTO<X6BasicBaseUnit> pagination = new PaginationDTO<X6BasicBaseUnit>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到单位则返回空。
	 * @param baseUnit
	 * @return
	 */
	private X6BasicBaseUnit getBaseUnit(X6BasicBaseUnit baseUnit) {
		if (baseUnit.getId() == null)
			throw new RuntimeException("id不能为空");
		X6BasicBaseUnit result = baseUnitService.getBaseUnit(baseUnit.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果单位不存在，返回false；如果原来没有单位组对象，且修改的时候也没有配置单位组对象，则报错；如果配置的单位组对象不存在，则报错；
	 * @param baseUnit
	 * @return 
	 */
	private boolean beforeUpdateBaseUnit(X6BasicBaseUnit baseUnit){
		if(baseUnit.getCode() == null){
			throw new RuntimeException("code不能为空。");
		}
		if(baseUnit.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		if(baseUnit.getName() == null){
			throw new RuntimeException("name不能为空。");
		}
		if(baseUnit.getRate() == null){
			throw new RuntimeException("rate不能为空。");
		}
		if(baseUnit.getUnitGroup() == null){
			throw new RuntimeException("unitGroup不能为空。");
		}
		X6BasicBaseUnit temp = getBaseUnit(baseUnit);
		if(temp == null){
			return false;
		}
		X6BasicUnitGroups unitGroups = null;
		if (temp.getUnitGroup() == null) {
			if (baseUnit.getUnitGroup() == null || (baseUnit.getUnitGroup().getId() == null && baseUnit.getUnitGroup().getCode() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				unitGroups = getUnitGroups(baseUnit.getUnitGroup());
				if(unitGroups == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (baseUnit.getUnitGroup() == null || (baseUnit.getUnitGroup().getId() == null && baseUnit.getUnitGroup().getCode() == null)) {
				unitGroups = temp.getUnitGroup();
			} else {
				unitGroups = getUnitGroups(baseUnit.getUnitGroup());
				if (unitGroups == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		baseUnit.setUnitGroup(unitGroups);
		baseUnit.setVersion(temp.getVersion());
		return true;
	}
	
	private List<X6BasicBaseUnit> clearBaseUnitNonMainField(List<X6BasicBaseUnit> list){
		 List<X6BasicBaseUnit> baseUnitList = new ArrayList<X6BasicBaseUnit>();
		 for(X6BasicBaseUnit baseUnit:list){
			 X6BasicBaseUnit temp = new X6BasicBaseUnit();
			 temp.setCode(baseUnit.getCode());
			 temp.setId(baseUnit.getId());
		 	 baseUnitList.add(temp);
		 }
		 return baseUnitList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkBaseUnitData(X6BasicBaseUnit baseUnit){
		 if(baseUnit.getCode() == null){
		 	throw new RuntimeException("code不能为空。");
		 }
		 if(baseUnit.getName() == null){
		 	throw new RuntimeException("name不能为空。");
		 }
		 if(baseUnit.getRate() == null){
		 	throw new RuntimeException("rate不能为空。");
		 }
		 if(baseUnit.getUnitGroup() == null){
		 	throw new RuntimeException("unitGroup不能为空。");
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
	 * 获取单位组对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param unitGroups
	 * @return
	 */
	private X6BasicUnitGroups getUnitGroups(X6BasicUnitGroups unitGroups) {
		if (unitGroups.getId() == null && (unitGroups.getCode() == null || unitGroups.getCode().toString().trim() == ""))
			throw new RuntimeException("单位组对象业务主键和id不能同时为空");
		if (unitGroups.getId() != null) {
			X6BasicUnitGroups result = unitGroupsService.getUnitGroups(unitGroups .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return unitGroupsService.loadUnitGroupsByBussinessKey(unitGroups.getCode());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个单位组，则返回false，否则返回true
	 * @param unitGroups
	 */
	private boolean beforeUpdateUnitGroups(X6BasicUnitGroups unitGroups) {
		if(unitGroups.getName() == null){
			throw new RuntimeException("name不能为空。");
		}
		X6BasicUnitGroups temp = getUnitGroups(unitGroups);
		if (temp == null) {
			return false;
		}
		if(unitGroups.getId() == null){
			unitGroups.setId(temp.getId());		
		}
		if(unitGroups.getCode() == null){
			unitGroups.setCode(temp.getCode());
		}
		
		unitGroups.setVersion(temp.getVersion());
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
	 * 清除单位组对象下所有辅模型对象中的单位组对象
	 * @param unitGroups
	 */
	private void clearCircle(X6BasicUnitGroups unitGroups) {
		if (unitGroups.getBaseUnitList() != null && unitGroups.getBaseUnitList().size() > 0) {
			for (X6BasicBaseUnit baseUnit : unitGroups.getBaseUnitList()) {
				baseUnit.setUnitGroup(null);
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
	private void checkUnitGroupsData(X6BasicUnitGroups unitGroups){
		 if(unitGroups.getName() == null){
		 	throw new RuntimeException("name不能为空。");
		 }
	}
	/* CUSTOM CODE START(wsserviceimpl,functions,X6Basic_1.0_unitGroup_UnitGroups,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}