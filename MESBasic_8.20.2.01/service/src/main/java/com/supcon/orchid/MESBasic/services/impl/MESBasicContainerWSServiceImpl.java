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
import com.supcon.orchid.MESBasic.services.MESBasicContainerWSService;
import com.supcon.orchid.MESBasic.services.MESBasicContainerService;
import com.supcon.orchid.MESBasic.services.MESBasicPropertyTagsService;
	
/* CUSTOM CODE START(wsserviceimpl,import,MESBasic_1_container_Container,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="MESBasicContainer",targetNamespace = "http://ws.supcon.com")
public class MESBasicContainerWSServiceImpl implements MESBasicContainerWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private MESBasicContainerService containerService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private MESBasicPropertyTagsService propertyTagsService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取容器数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getContainerByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			MESBasicContainer container = containerService.loadContainerByBussinessKey(businessKey);
			if(container == null){
				return set404Error(result);
			}
			//添加辅模型
			List<MESBasicPropertyTags> propertyTagsList = clearPropertyTagsNonMainField(containerService.getPropertyTagsList(container));
			container.setPropertyTagsList(propertyTagsList);
			
			setSuccessResult(result, container);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取容器数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getContainerByPk(
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
			
			MESBasicContainer container = containerService.getContainer(id);
			if(container == null || !container.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<MESBasicPropertyTags> propertyTagsList = clearPropertyTagsNonMainField(containerService.getPropertyTagsList(container));
			container.setPropertyTagsList(propertyTagsList);
			setSuccessResult(result, container);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改容器数据
	 * @param 容器对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateContainer(
		@WebParam(name="container")MESBasicContainer container,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(container == null){
				return set500Error(result, "容器不能为空。");
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
			
			if(!beforeUpdateContainer(container)){
				return set404Error(result);
			}
			containerService.saveContainer(container, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addContainer(
		@WebParam(name="container")MESBasicContainer container,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(container == null){
				return set500Error(result, "容器不能为空。");
			}
		
			if(container.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(container.getCode() == null){
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
				checkContainerData(container);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			containerService.saveContainer(container, null);
			setSuccessResult(result, container.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteContainerByBusinessKey(
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
			MESBasicContainer container = null;
			try{
				container = containerService.loadContainerByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(container == null){
				return set404Error(result);
			}
			containerService.deleteContainer(container);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteContainerByPk(
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
			MESBasicContainer container = null;
			try{
				container = containerService.getContainer(id);
			}catch(NullPointerException e){}
			if(container == null || !container.isValid()){
				return set404Error(result);
			}
			containerService.deleteContainer(container);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddContainer(
		@WebParam(name="containerList")List<MESBasicContainer> containerList,
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
			for(MESBasicContainer container : containerList){
				if(container.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(container.getCode() == null || container.getCode().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkContainerData(container);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			containerService.batchImportBaseContainer(containerList);
			for(MESBasicContainer container : containerList){
				idList.add(container.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateContainer(
		@WebParam(name="containerList")List<MESBasicContainer> containerList,
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
			for(MESBasicContainer container : containerList){
				try{
					if(!beforeUpdateContainer(container)){
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
			containerService.batchImportBaseContainer(containerList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteContainerByPk(
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
				MESBasicContainer temp = null;
				try{
					temp = containerService.getContainer(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			containerService.deleteContainer(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteContainerByBusinessKey(
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
				MESBasicContainer temp = null;
				try{
					temp = containerService.loadContainerByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			containerService.deleteContainer(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getContainerPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicContainer.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),MESBasicContainer.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicContainer.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicContainer.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicContainer.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicContainer> page = new Page<MESBasicContainer>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicContainer> datas = containerService.getByPage(page, detachedCriteria);
			List<MESBasicContainer> containerList = datas.getResult();
			if (containerList == null || containerList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(containerList.toArray());
			PaginationDTO<MESBasicContainer> pagination = new PaginationDTO<MESBasicContainer>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据容器业务主键查询容器下所有辅模型
	 * @param 容器业务主键
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
			MESBasicContainer container = containerService.loadContainerByBussinessKey(businessKey);
			if (container == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap propertyTagsMap = new SimulationMap();
			propertyTagsMap.setName(InternationalResource.get("PropertyTags"));
			propertyTagsMap.setList(containerService.getPropertyTagsList(container));
			resultList.add(propertyTagsMap);
			
			clearCircle(container);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据容器id查询容器下所有辅模型
	 * 
	 * @param 容器id
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
			MESBasicContainer container = containerService.getContainer(id);
			if (container == null || !container.isValid()) {
				result.setErrorMessage("找不到容器");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap propertyTagsMap = new SimulationMap();
			propertyTagsMap.setName(InternationalResource.get("PropertyTags"));
			propertyTagsMap.setList(containerService.getPropertyTagsList(container));
			resultList.add(propertyTagsMap);
			
			clearCircle(container);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  容器属性-------------------------------------------------
	//--hasLink:true---link:Container
	/**
	 * 根据容器属性业务主键分页查询容器属性数据
	 * 
	 * @param 容器属性业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPropertyTagsPageByContainerBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicPropertyTags.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicPropertyTags.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicPropertyTags.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicPropertyTags.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicPropertyTags.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			MESBasicContainer container = containerService.loadContainerByBussinessKey(businessKey);
			if (container == null) {
				return set500Error(result, "该业务主键的容器不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("container",container));
			Page<MESBasicPropertyTags> page = new Page<MESBasicPropertyTags>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicPropertyTags> datas = propertyTagsService.getByPage(page, detachedCriteria);
			List<MESBasicPropertyTags> propertyTagsList = datas.getResult();
			if (propertyTagsList == null || propertyTagsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(propertyTagsList.toArray());
			PaginationDTO<MESBasicPropertyTags> pagination = new PaginationDTO<MESBasicPropertyTags>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据容器属性id分页查询容器属性数据
	 * 
	 * @param 容器属性id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPropertyTagsPageByContainerPk(	
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicPropertyTags.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), MESBasicPropertyTags.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicPropertyTags.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicPropertyTags.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicPropertyTags.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			MESBasicContainer container = containerService.getContainer(id);
			if (container == null) {
				return set500Error(result, "该主键的容器不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("container",container));
			Page<MESBasicPropertyTags> page = new Page<MESBasicPropertyTags>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicPropertyTags> datas = propertyTagsService.getByPage(page, detachedCriteria);
			List<MESBasicPropertyTags> propertyTagsList = datas.getResult();
			if (propertyTagsList == null || propertyTagsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(propertyTagsList.toArray());
			PaginationDTO<MESBasicPropertyTags> pagination = new PaginationDTO<MESBasicPropertyTags>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据容器属性id分获取容器属性数据
	 * 
	 * @param 容器属性id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPropertyTags(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicPropertyTags propertyTags = propertyTagsService.getPropertyTags(id);
			if(propertyTags == null){
				return set404Error(result);
			}
			setSuccessResult(result, propertyTags);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据容器属性业务id修改容器属性数据
	 * 
	 * @param 容器属性对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updatePropertyTags(
		@WebParam(name="propertyTags")MESBasicPropertyTags propertyTags,
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
			if(!beforeUpdatePropertyTags(propertyTags)){
				return set404Error(result);
			}
			propertyTagsService.savePropertyTags(propertyTags, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增容器属性
	 * 
	 * @param 容器属性对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addPropertyTags(
		@WebParam(name="propertyTags")MESBasicPropertyTags propertyTags,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(propertyTags == null){
				return set500Error(result, "容器属性对象不能为空。");
			}
			if(propertyTags.getId() != null){
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
				checkPropertyTagsData(propertyTags);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			MESBasicContainer tempContainer = propertyTags.getContainer();
			if (tempContainer == null) {
				return set500Error(result, "容器对象不能为空");
			}
			
			MESBasicContainer container = null;
			if(tempContainer.getId()!= null){
				container = containerService.getContainer(tempContainer.getId());
			}else if(tempContainer.getCode() != null){
				container = containerService.loadContainerByBussinessKey(tempContainer.getCode());
			}else{
				return set500Error(result, "容器对象必须设置id或业务主键。");
			}
			
			if(container == null){
				return set404Error(result);
			}
			propertyTags.setContainer(container);
			
			propertyTagsService.savePropertyTags(propertyTags, null);
			Long propertyTagsId = propertyTags.getId();
			setSuccessResult(result, propertyTagsId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据容器属性id 删除容器属性
	 * 
	 * @param 容器属性id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deletePropertyTags(
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
			
			MESBasicPropertyTags propertyTags = null;
			try{
				propertyTags = propertyTagsService.getPropertyTags(id);
			}catch(NullPointerException e){}
			if(propertyTags == null  || !propertyTags.isValid()){
				return set404Error(result);
			}
			propertyTagsService.deletePropertyTags(propertyTags);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改容器属性数据，容器属性id不能为空
	 *
	 * @param 容器属性列表，每个容器属性必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdatePropertyTags(
		@WebParam(name="propertyTagsList")List<MESBasicPropertyTags> propertyTagsList,
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
			for(MESBasicPropertyTags propertyTags : propertyTagsList){
				try{
					if(!beforeUpdatePropertyTags(propertyTags)){
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
			
			propertyTagsService.batchImportBasePropertyTags(propertyTagsList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增容器属性数据
	 * 
	 * @param 容器属性列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddPropertyTags(
		@WebParam(name="propertyTagsList")List<MESBasicPropertyTags> propertyTagsList,
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
			
			if(propertyTagsList == null){
				set500Error(result, "propertyTagsList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicPropertyTags propertyTags : propertyTagsList){
				if(propertyTags.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(propertyTags.getContainer() == null){
						set500Error(result, "第"+count+"条数据出错：容器对象不能为空。");
						return result;
					}
					MESBasicContainer container = getContainer(propertyTags.getContainer());
					if(container == null){
						set500Error(result, "第"+count+"条数据出错：容器对象不存在。");
						return result;
					}
					propertyTags.setContainer(container);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkPropertyTagsData(propertyTags);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			propertyTagsService.batchImportBasePropertyTags(propertyTagsList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicPropertyTags propertyTags : propertyTagsList){
				idList.add(propertyTags.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据容器属性id，批量删除容器属性数据
	 * 
	 * @param 容器属性id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelPropertyTags(
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
			
			List<MESBasicPropertyTags> propertyTagsList = new ArrayList<MESBasicPropertyTags>();
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
				
				MESBasicPropertyTags propertyTags = propertyTagsService.getPropertyTags(id);
				if(propertyTags == null || !propertyTags.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				propertyTagsList.add(propertyTags);
				
				count ++;
			}
			for(MESBasicPropertyTags propertyTags : propertyTagsList){
				propertyTagsService.deletePropertyTags(propertyTags);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有容器属性数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPropertyTagsPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicPropertyTags.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicPropertyTags.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicPropertyTags.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicPropertyTags.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicPropertyTags.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicPropertyTags> page = new Page<MESBasicPropertyTags>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicPropertyTags> datas = propertyTagsService.getByPage(page, detachedCriteria);
			List<MESBasicPropertyTags> propertyTagsList = datas.getResult();
			if (propertyTagsList == null || propertyTagsList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(propertyTagsList.toArray());
			PaginationDTO<MESBasicPropertyTags> pagination = new PaginationDTO<MESBasicPropertyTags>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到容器属性则返回空。
	 * @param propertyTags
	 * @return
	 */
	private MESBasicPropertyTags getPropertyTags(MESBasicPropertyTags propertyTags) {
		if (propertyTags.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicPropertyTags result = propertyTagsService.getPropertyTags(propertyTags.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果容器属性不存在，返回false；如果原来没有容器对象，且修改的时候也没有配置容器对象，则报错；如果配置的容器对象不存在，则报错；
	 * @param propertyTags
	 * @return 
	 */
	private boolean beforeUpdatePropertyTags(MESBasicPropertyTags propertyTags){
		if(propertyTags.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicPropertyTags temp = getPropertyTags(propertyTags);
		if(temp == null){
			return false;
		}
		MESBasicContainer container = null;
		if (temp.getContainer() == null) {
			if (propertyTags.getContainer() == null || (propertyTags.getContainer().getId() == null && propertyTags.getContainer().getCode() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				container = getContainer(propertyTags.getContainer());
				if(container == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (propertyTags.getContainer() == null || (propertyTags.getContainer().getId() == null && propertyTags.getContainer().getCode() == null)) {
				container = temp.getContainer();
			} else {
				container = getContainer(propertyTags.getContainer());
				if (container == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		propertyTags.setContainer(container);
		propertyTags.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicPropertyTags> clearPropertyTagsNonMainField(List<MESBasicPropertyTags> list){
		 List<MESBasicPropertyTags> propertyTagsList = new ArrayList<MESBasicPropertyTags>();
		 for(MESBasicPropertyTags propertyTags:list){
			 MESBasicPropertyTags temp = new MESBasicPropertyTags();
			 temp.setId(propertyTags.getId());
			 temp.setVersion(propertyTags.getVersion());
		 	 propertyTagsList.add(temp);
		 }
		 return propertyTagsList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkPropertyTagsData(MESBasicPropertyTags propertyTags){
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
	 * 获取容器对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param container
	 * @return
	 */
	private MESBasicContainer getContainer(MESBasicContainer container) {
		if (container.getId() == null && (container.getCode() == null || container.getCode().toString().trim() == ""))
			throw new RuntimeException("容器对象业务主键和id不能同时为空");
		if (container.getId() != null) {
			MESBasicContainer result = containerService.getContainer(container .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return containerService.loadContainerByBussinessKey(container.getCode());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个容器，则返回false，否则返回true
	 * @param container
	 */
	private boolean beforeUpdateContainer(MESBasicContainer container) {
		if(container.getContainerStatus() == null){
			throw new RuntimeException("containerStatus不能为空。");
		}
		if(container.getContainerType() == null){
			throw new RuntimeException("containerType不能为空。");
		}
		if(container.getName() == null){
			throw new RuntimeException("name不能为空。");
		}
		MESBasicContainer temp = getContainer(container);
		if (temp == null) {
			return false;
		}
		if(container.getId() == null){
			container.setId(temp.getId());		
		}
		if(container.getCode() == null){
			container.setCode(temp.getCode());
		}
		
		container.setVersion(temp.getVersion());
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
	 * 清除容器对象下所有辅模型对象中的容器对象
	 * @param container
	 */
	private void clearCircle(MESBasicContainer container) {
		if (container.getPropertyTagsList() != null && container.getPropertyTagsList().size() > 0) {
			for (MESBasicPropertyTags propertyTags : container.getPropertyTagsList()) {
				propertyTags.setContainer(null);
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
	private void checkContainerData(MESBasicContainer container){
		 if(container.getContainerStatus() == null){
		 	throw new RuntimeException("containerStatus不能为空。");
		 }
		 if(container.getContainerType() == null){
		 	throw new RuntimeException("containerType不能为空。");
		 }
		 if(container.getName() == null){
		 	throw new RuntimeException("name不能为空。");
		 }
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,MESBasic_1_container_Container,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}