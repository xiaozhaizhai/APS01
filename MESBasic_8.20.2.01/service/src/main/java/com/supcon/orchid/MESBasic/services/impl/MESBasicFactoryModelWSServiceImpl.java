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
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelWSService;
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService;
import com.supcon.orchid.MESBasic.services.MESBasicPositionDealService;
import com.supcon.orchid.MESBasic.services.MESBasicObjPostionService;
import com.supcon.orchid.MESBasic.services.MESBasicObjWareStoreService;
import com.supcon.orchid.MESBasic.services.MESBasicObjTeamService;
import com.supcon.orchid.MESBasic.services.MESBasicObjEquipmentService;
import com.supcon.orchid.MESBasic.services.MESBasicObjProductService;
	
/* CUSTOM CODE START(wsserviceimpl,import,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="MESBasicFactoryModel",targetNamespace = "http://ws.supcon.com")
public class MESBasicFactoryModelWSServiceImpl implements MESBasicFactoryModelWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private MESBasicFactoryModelService factoryModelService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private MESBasicPositionDealService positionDealService;
	@Resource
	private MESBasicObjPostionService objPostionService;
	@Resource
	private MESBasicObjWareStoreService objWareStoreService;
	@Resource
	private MESBasicObjTeamService objTeamService;
	@Resource
	private MESBasicObjEquipmentService objEquipmentService;
	@Resource
	private MESBasicObjProductService objProductService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取工厂数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFactoryModelByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			MESBasicFactoryModel factoryModel = factoryModelService.loadFactoryModelByBussinessKey(businessKey);
			if(factoryModel == null){
				return set404Error(result);
			}
			//添加辅模型
			
			setSuccessResult(result, factoryModel);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取工厂数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFactoryModelByPk(
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
			
			MESBasicFactoryModel factoryModel = factoryModelService.getFactoryModel(id);
			if(factoryModel == null || !factoryModel.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			setSuccessResult(result, factoryModel);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改工厂数据
	 * @param 工厂对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateFactoryModel(
		@WebParam(name="factoryModel")MESBasicFactoryModel factoryModel,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(factoryModel == null){
				return set500Error(result, "工厂不能为空。");
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
			
			if(!beforeUpdateFactoryModel(factoryModel)){
				return set404Error(result);
			}
			factoryModelService.saveFactoryModel(factoryModel, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addFactoryModel(
		@WebParam(name="factoryModel")MESBasicFactoryModel factoryModel,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(factoryModel == null){
				return set500Error(result, "工厂不能为空。");
			}
		
			if(factoryModel.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(factoryModel.getCode() == null){
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
				checkFactoryModelData(factoryModel);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			factoryModelService.saveFactoryModel(factoryModel, null);
			setSuccessResult(result, factoryModel.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteFactoryModelByBusinessKey(
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
			MESBasicFactoryModel factoryModel = null;
			try{
				factoryModel = factoryModelService.loadFactoryModelByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(factoryModel == null){
				return set404Error(result);
			}
			factoryModelService.deleteFactoryModel(factoryModel);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteFactoryModelByPk(
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
			MESBasicFactoryModel factoryModel = null;
			try{
				factoryModel = factoryModelService.getFactoryModel(id);
			}catch(NullPointerException e){}
			if(factoryModel == null || !factoryModel.isValid()){
				return set404Error(result);
			}
			factoryModelService.deleteFactoryModel(factoryModel);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddFactoryModel(
		@WebParam(name="factoryModelList")List<MESBasicFactoryModel> factoryModelList,
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
			for(MESBasicFactoryModel factoryModel : factoryModelList){
				if(factoryModel.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(factoryModel.getCode() == null || factoryModel.getCode().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkFactoryModelData(factoryModel);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			factoryModelService.batchImportBaseFactoryModel(factoryModelList);
			for(MESBasicFactoryModel factoryModel : factoryModelList){
				idList.add(factoryModel.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFactoryModel(
		@WebParam(name="factoryModelList")List<MESBasicFactoryModel> factoryModelList,
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
			for(MESBasicFactoryModel factoryModel : factoryModelList){
				try{
					if(!beforeUpdateFactoryModel(factoryModel)){
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
			factoryModelService.batchImportBaseFactoryModel(factoryModelList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteFactoryModelByPk(
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
				MESBasicFactoryModel temp = null;
				try{
					temp = factoryModelService.getFactoryModel(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			factoryModelService.deleteFactoryModel(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteFactoryModelByBusinessKey(
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
				MESBasicFactoryModel temp = null;
				try{
					temp = factoryModelService.loadFactoryModelByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			factoryModelService.deleteFactoryModel(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFactoryModelPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicFactoryModel.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),MESBasicFactoryModel.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicFactoryModel.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicFactoryModel.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicFactoryModel.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicFactoryModel> page = new Page<MESBasicFactoryModel>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicFactoryModel> datas = factoryModelService.getByPage(page, detachedCriteria);
			List<MESBasicFactoryModel> factoryModelList = datas.getResult();
			if (factoryModelList == null || factoryModelList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(factoryModelList.toArray());
			PaginationDTO<MESBasicFactoryModel> pagination = new PaginationDTO<MESBasicFactoryModel>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据工厂业务主键查询工厂下所有辅模型
	 * @param 工厂业务主键
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
			MESBasicFactoryModel factoryModel = factoryModelService.loadFactoryModelByBussinessKey(businessKey);
			if (factoryModel == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(factoryModel);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工厂id查询工厂下所有辅模型
	 * 
	 * @param 工厂id
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
			MESBasicFactoryModel factoryModel = factoryModelService.getFactoryModel(id);
			if (factoryModel == null || !factoryModel.isValid()) {
				result.setErrorMessage("找不到工厂");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(factoryModel);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  岗位处理-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据岗位处理业务主键分页查询岗位处理数据
	 * 
	 * @param 岗位处理业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPositionDealPageByFactoryModelBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "岗位处理跟工厂没有设置关联！");
	}
	/**
	 * 根据岗位处理id分页查询岗位处理数据
	 * 
	 * @param 岗位处理id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPositionDealPageByFactoryModelPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "岗位处理跟工厂没有设置关联！");
	}
	/**
	 * 根据岗位处理id分获取岗位处理数据
	 * 
	 * @param 岗位处理id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPositionDeal(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicPositionDeal positionDeal = positionDealService.getPositionDeal(id);
			if(positionDeal == null){
				return set404Error(result);
			}
			setSuccessResult(result, positionDeal);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据岗位处理业务id修改岗位处理数据
	 * 
	 * @param 岗位处理对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updatePositionDeal(
		@WebParam(name="positionDeal")MESBasicPositionDeal positionDeal,
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
			if(!beforeUpdatePositionDeal(positionDeal)){
				return set404Error(result);
			}
			positionDealService.savePositionDeal(positionDeal, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增岗位处理
	 * 
	 * @param 岗位处理对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addPositionDeal(
		@WebParam(name="positionDeal")MESBasicPositionDeal positionDeal,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(positionDeal == null){
				return set500Error(result, "岗位处理对象不能为空。");
			}
			if(positionDeal.getId() != null){
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
				checkPositionDealData(positionDeal);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			positionDealService.savePositionDeal(positionDeal, null);
			Long positionDealId = positionDeal.getId();
			setSuccessResult(result, positionDealId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据岗位处理id 删除岗位处理
	 * 
	 * @param 岗位处理id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deletePositionDeal(
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
			
			MESBasicPositionDeal positionDeal = null;
			try{
				positionDeal = positionDealService.getPositionDeal(id);
			}catch(NullPointerException e){}
			if(positionDeal == null  || !positionDeal.isValid()){
				return set404Error(result);
			}
			positionDealService.deletePositionDeal(positionDeal);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改岗位处理数据，岗位处理id不能为空
	 *
	 * @param 岗位处理列表，每个岗位处理必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdatePositionDeal(
		@WebParam(name="positionDealList")List<MESBasicPositionDeal> positionDealList,
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
			for(MESBasicPositionDeal positionDeal : positionDealList){
				try{
					if(!beforeUpdatePositionDeal(positionDeal)){
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
			
			positionDealService.batchImportBasePositionDeal(positionDealList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增岗位处理数据
	 * 
	 * @param 岗位处理列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddPositionDeal(
		@WebParam(name="positionDealList")List<MESBasicPositionDeal> positionDealList,
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
			
			if(positionDealList == null){
				set500Error(result, "positionDealList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicPositionDeal positionDeal : positionDealList){
				if(positionDeal.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkPositionDealData(positionDeal);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			positionDealService.batchImportBasePositionDeal(positionDealList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicPositionDeal positionDeal : positionDealList){
				idList.add(positionDeal.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据岗位处理id，批量删除岗位处理数据
	 * 
	 * @param 岗位处理id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelPositionDeal(
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
			
			List<MESBasicPositionDeal> positionDealList = new ArrayList<MESBasicPositionDeal>();
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
				
				MESBasicPositionDeal positionDeal = positionDealService.getPositionDeal(id);
				if(positionDeal == null || !positionDeal.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				positionDealList.add(positionDeal);
				
				count ++;
			}
			for(MESBasicPositionDeal positionDeal : positionDealList){
				positionDealService.deletePositionDeal(positionDeal);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有岗位处理数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPositionDealPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicPositionDeal.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicPositionDeal.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicPositionDeal.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicPositionDeal.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicPositionDeal.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicPositionDeal> page = new Page<MESBasicPositionDeal>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicPositionDeal> datas = positionDealService.getByPage(page, detachedCriteria);
			List<MESBasicPositionDeal> positionDealList = datas.getResult();
			if (positionDealList == null || positionDealList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(positionDealList.toArray());
			PaginationDTO<MESBasicPositionDeal> pagination = new PaginationDTO<MESBasicPositionDeal>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到岗位处理则返回空。
	 * @param positionDeal
	 * @return
	 */
	private MESBasicPositionDeal getPositionDeal(MESBasicPositionDeal positionDeal) {
		if (positionDeal.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicPositionDeal result = positionDealService.getPositionDeal(positionDeal.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果岗位处理不存在，返回false；如果原来没有工厂对象，且修改的时候也没有配置工厂对象，则报错；如果配置的工厂对象不存在，则报错；
	 * @param positionDeal
	 * @return 
	 */
	private boolean beforeUpdatePositionDeal(MESBasicPositionDeal positionDeal){
		if(positionDeal.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicPositionDeal temp = getPositionDeal(positionDeal);
		if(temp == null){
			return false;
		}
		positionDeal.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicPositionDeal> clearPositionDealNonMainField(List<MESBasicPositionDeal> list){
		 List<MESBasicPositionDeal> positionDealList = new ArrayList<MESBasicPositionDeal>();
		 for(MESBasicPositionDeal positionDeal:list){
			 MESBasicPositionDeal temp = new MESBasicPositionDeal();
			 temp.setId(positionDeal.getId());
		 	 positionDealList.add(temp);
		 }
		 return positionDealList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkPositionDealData(MESBasicPositionDeal positionDeal){
	}
	 
	//------------------------------------辅模型 WS  关联岗位-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据关联岗位业务主键分页查询关联岗位数据
	 * 
	 * @param 关联岗位业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjPostionPageByFactoryModelBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "关联岗位跟工厂没有设置关联！");
	}
	/**
	 * 根据关联岗位id分页查询关联岗位数据
	 * 
	 * @param 关联岗位id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjPostionPageByFactoryModelPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "关联岗位跟工厂没有设置关联！");
	}
	/**
	 * 根据关联岗位id分获取关联岗位数据
	 * 
	 * @param 关联岗位id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjPostion(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicObjPostion objPostion = objPostionService.getObjPostion(id);
			if(objPostion == null){
				return set404Error(result);
			}
			setSuccessResult(result, objPostion);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据关联岗位业务id修改关联岗位数据
	 * 
	 * @param 关联岗位对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateObjPostion(
		@WebParam(name="objPostion")MESBasicObjPostion objPostion,
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
			if(!beforeUpdateObjPostion(objPostion)){
				return set404Error(result);
			}
			objPostionService.saveObjPostion(objPostion, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增关联岗位
	 * 
	 * @param 关联岗位对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addObjPostion(
		@WebParam(name="objPostion")MESBasicObjPostion objPostion,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(objPostion == null){
				return set500Error(result, "关联岗位对象不能为空。");
			}
			if(objPostion.getId() != null){
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
				checkObjPostionData(objPostion);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			objPostionService.saveObjPostion(objPostion, null);
			Long objPostionId = objPostion.getId();
			setSuccessResult(result, objPostionId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据关联岗位id 删除关联岗位
	 * 
	 * @param 关联岗位id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteObjPostion(
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
			
			MESBasicObjPostion objPostion = null;
			try{
				objPostion = objPostionService.getObjPostion(id);
			}catch(NullPointerException e){}
			if(objPostion == null  || !objPostion.isValid()){
				return set404Error(result);
			}
			objPostionService.deleteObjPostion(objPostion);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改关联岗位数据，关联岗位id不能为空
	 *
	 * @param 关联岗位列表，每个关联岗位必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateObjPostion(
		@WebParam(name="objPostionList")List<MESBasicObjPostion> objPostionList,
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
			for(MESBasicObjPostion objPostion : objPostionList){
				try{
					if(!beforeUpdateObjPostion(objPostion)){
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
			
			objPostionService.batchImportBaseObjPostion(objPostionList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增关联岗位数据
	 * 
	 * @param 关联岗位列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddObjPostion(
		@WebParam(name="objPostionList")List<MESBasicObjPostion> objPostionList,
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
			
			if(objPostionList == null){
				set500Error(result, "objPostionList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicObjPostion objPostion : objPostionList){
				if(objPostion.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkObjPostionData(objPostion);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			objPostionService.batchImportBaseObjPostion(objPostionList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicObjPostion objPostion : objPostionList){
				idList.add(objPostion.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据关联岗位id，批量删除关联岗位数据
	 * 
	 * @param 关联岗位id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelObjPostion(
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
			
			List<MESBasicObjPostion> objPostionList = new ArrayList<MESBasicObjPostion>();
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
				
				MESBasicObjPostion objPostion = objPostionService.getObjPostion(id);
				if(objPostion == null || !objPostion.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				objPostionList.add(objPostion);
				
				count ++;
			}
			for(MESBasicObjPostion objPostion : objPostionList){
				objPostionService.deleteObjPostion(objPostion);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有关联岗位数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjPostionPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicObjPostion.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicObjPostion.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicObjPostion.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicObjPostion.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicObjPostion.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicObjPostion> page = new Page<MESBasicObjPostion>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicObjPostion> datas = objPostionService.getByPage(page, detachedCriteria);
			List<MESBasicObjPostion> objPostionList = datas.getResult();
			if (objPostionList == null || objPostionList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(objPostionList.toArray());
			PaginationDTO<MESBasicObjPostion> pagination = new PaginationDTO<MESBasicObjPostion>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到关联岗位则返回空。
	 * @param objPostion
	 * @return
	 */
	private MESBasicObjPostion getObjPostion(MESBasicObjPostion objPostion) {
		if (objPostion.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicObjPostion result = objPostionService.getObjPostion(objPostion.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果关联岗位不存在，返回false；如果原来没有工厂对象，且修改的时候也没有配置工厂对象，则报错；如果配置的工厂对象不存在，则报错；
	 * @param objPostion
	 * @return 
	 */
	private boolean beforeUpdateObjPostion(MESBasicObjPostion objPostion){
		if(objPostion.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicObjPostion temp = getObjPostion(objPostion);
		if(temp == null){
			return false;
		}
		objPostion.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicObjPostion> clearObjPostionNonMainField(List<MESBasicObjPostion> list){
		 List<MESBasicObjPostion> objPostionList = new ArrayList<MESBasicObjPostion>();
		 for(MESBasicObjPostion objPostion:list){
			 MESBasicObjPostion temp = new MESBasicObjPostion();
			 temp.setId(objPostion.getId());
		 	 objPostionList.add(temp);
		 }
		 return objPostionList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkObjPostionData(MESBasicObjPostion objPostion){
	}
	 
	//------------------------------------辅模型 WS  配料仓-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据配料仓业务主键分页查询配料仓数据
	 * 
	 * @param 配料仓业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjWareStorePageByFactoryModelBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "配料仓跟工厂没有设置关联！");
	}
	/**
	 * 根据配料仓id分页查询配料仓数据
	 * 
	 * @param 配料仓id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjWareStorePageByFactoryModelPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "配料仓跟工厂没有设置关联！");
	}
	/**
	 * 根据配料仓id分获取配料仓数据
	 * 
	 * @param 配料仓id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjWareStore(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicObjWareStore objWareStore = objWareStoreService.getObjWareStore(id);
			if(objWareStore == null){
				return set404Error(result);
			}
			setSuccessResult(result, objWareStore);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料仓业务id修改配料仓数据
	 * 
	 * @param 配料仓对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateObjWareStore(
		@WebParam(name="objWareStore")MESBasicObjWareStore objWareStore,
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
			if(!beforeUpdateObjWareStore(objWareStore)){
				return set404Error(result);
			}
			objWareStoreService.saveObjWareStore(objWareStore, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增配料仓
	 * 
	 * @param 配料仓对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addObjWareStore(
		@WebParam(name="objWareStore")MESBasicObjWareStore objWareStore,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(objWareStore == null){
				return set500Error(result, "配料仓对象不能为空。");
			}
			if(objWareStore.getId() != null){
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
				checkObjWareStoreData(objWareStore);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			objWareStoreService.saveObjWareStore(objWareStore, null);
			Long objWareStoreId = objWareStore.getId();
			setSuccessResult(result, objWareStoreId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料仓id 删除配料仓
	 * 
	 * @param 配料仓id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteObjWareStore(
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
			
			MESBasicObjWareStore objWareStore = null;
			try{
				objWareStore = objWareStoreService.getObjWareStore(id);
			}catch(NullPointerException e){}
			if(objWareStore == null  || !objWareStore.isValid()){
				return set404Error(result);
			}
			objWareStoreService.deleteObjWareStore(objWareStore);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改配料仓数据，配料仓id不能为空
	 *
	 * @param 配料仓列表，每个配料仓必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateObjWareStore(
		@WebParam(name="objWareStoreList")List<MESBasicObjWareStore> objWareStoreList,
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
			for(MESBasicObjWareStore objWareStore : objWareStoreList){
				try{
					if(!beforeUpdateObjWareStore(objWareStore)){
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
			
			objWareStoreService.batchImportBaseObjWareStore(objWareStoreList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增配料仓数据
	 * 
	 * @param 配料仓列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddObjWareStore(
		@WebParam(name="objWareStoreList")List<MESBasicObjWareStore> objWareStoreList,
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
			
			if(objWareStoreList == null){
				set500Error(result, "objWareStoreList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicObjWareStore objWareStore : objWareStoreList){
				if(objWareStore.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkObjWareStoreData(objWareStore);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			objWareStoreService.batchImportBaseObjWareStore(objWareStoreList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicObjWareStore objWareStore : objWareStoreList){
				idList.add(objWareStore.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料仓id，批量删除配料仓数据
	 * 
	 * @param 配料仓id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelObjWareStore(
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
			
			List<MESBasicObjWareStore> objWareStoreList = new ArrayList<MESBasicObjWareStore>();
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
				
				MESBasicObjWareStore objWareStore = objWareStoreService.getObjWareStore(id);
				if(objWareStore == null || !objWareStore.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				objWareStoreList.add(objWareStore);
				
				count ++;
			}
			for(MESBasicObjWareStore objWareStore : objWareStoreList){
				objWareStoreService.deleteObjWareStore(objWareStore);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有配料仓数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjWareStorePage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicObjWareStore.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicObjWareStore.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicObjWareStore.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicObjWareStore.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicObjWareStore.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicObjWareStore> page = new Page<MESBasicObjWareStore>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicObjWareStore> datas = objWareStoreService.getByPage(page, detachedCriteria);
			List<MESBasicObjWareStore> objWareStoreList = datas.getResult();
			if (objWareStoreList == null || objWareStoreList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(objWareStoreList.toArray());
			PaginationDTO<MESBasicObjWareStore> pagination = new PaginationDTO<MESBasicObjWareStore>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到配料仓则返回空。
	 * @param objWareStore
	 * @return
	 */
	private MESBasicObjWareStore getObjWareStore(MESBasicObjWareStore objWareStore) {
		if (objWareStore.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicObjWareStore result = objWareStoreService.getObjWareStore(objWareStore.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果配料仓不存在，返回false；如果原来没有工厂对象，且修改的时候也没有配置工厂对象，则报错；如果配置的工厂对象不存在，则报错；
	 * @param objWareStore
	 * @return 
	 */
	private boolean beforeUpdateObjWareStore(MESBasicObjWareStore objWareStore){
		if(objWareStore.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicObjWareStore temp = getObjWareStore(objWareStore);
		if(temp == null){
			return false;
		}
		objWareStore.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicObjWareStore> clearObjWareStoreNonMainField(List<MESBasicObjWareStore> list){
		 List<MESBasicObjWareStore> objWareStoreList = new ArrayList<MESBasicObjWareStore>();
		 for(MESBasicObjWareStore objWareStore:list){
			 MESBasicObjWareStore temp = new MESBasicObjWareStore();
			 temp.setId(objWareStore.getId());
		 	 objWareStoreList.add(temp);
		 }
		 return objWareStoreList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkObjWareStoreData(MESBasicObjWareStore objWareStore){
	}
	 
	//------------------------------------辅模型 WS  班组-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据班组业务主键分页查询班组数据
	 * 
	 * @param 班组业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjTeamPageByFactoryModelBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "班组跟工厂没有设置关联！");
	}
	/**
	 * 根据班组id分页查询班组数据
	 * 
	 * @param 班组id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjTeamPageByFactoryModelPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "班组跟工厂没有设置关联！");
	}
	/**
	 * 根据班组id分获取班组数据
	 * 
	 * @param 班组id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjTeam(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicObjTeam objTeam = objTeamService.getObjTeam(id);
			if(objTeam == null){
				return set404Error(result);
			}
			setSuccessResult(result, objTeam);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据班组业务id修改班组数据
	 * 
	 * @param 班组对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateObjTeam(
		@WebParam(name="objTeam")MESBasicObjTeam objTeam,
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
			if(!beforeUpdateObjTeam(objTeam)){
				return set404Error(result);
			}
			objTeamService.saveObjTeam(objTeam, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增班组
	 * 
	 * @param 班组对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addObjTeam(
		@WebParam(name="objTeam")MESBasicObjTeam objTeam,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(objTeam == null){
				return set500Error(result, "班组对象不能为空。");
			}
			if(objTeam.getId() != null){
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
				checkObjTeamData(objTeam);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			objTeamService.saveObjTeam(objTeam, null);
			Long objTeamId = objTeam.getId();
			setSuccessResult(result, objTeamId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据班组id 删除班组
	 * 
	 * @param 班组id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteObjTeam(
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
			
			MESBasicObjTeam objTeam = null;
			try{
				objTeam = objTeamService.getObjTeam(id);
			}catch(NullPointerException e){}
			if(objTeam == null  || !objTeam.isValid()){
				return set404Error(result);
			}
			objTeamService.deleteObjTeam(objTeam);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改班组数据，班组id不能为空
	 *
	 * @param 班组列表，每个班组必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateObjTeam(
		@WebParam(name="objTeamList")List<MESBasicObjTeam> objTeamList,
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
			for(MESBasicObjTeam objTeam : objTeamList){
				try{
					if(!beforeUpdateObjTeam(objTeam)){
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
			
			objTeamService.batchImportBaseObjTeam(objTeamList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增班组数据
	 * 
	 * @param 班组列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddObjTeam(
		@WebParam(name="objTeamList")List<MESBasicObjTeam> objTeamList,
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
			
			if(objTeamList == null){
				set500Error(result, "objTeamList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicObjTeam objTeam : objTeamList){
				if(objTeam.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkObjTeamData(objTeam);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			objTeamService.batchImportBaseObjTeam(objTeamList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicObjTeam objTeam : objTeamList){
				idList.add(objTeam.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据班组id，批量删除班组数据
	 * 
	 * @param 班组id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelObjTeam(
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
			
			List<MESBasicObjTeam> objTeamList = new ArrayList<MESBasicObjTeam>();
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
				
				MESBasicObjTeam objTeam = objTeamService.getObjTeam(id);
				if(objTeam == null || !objTeam.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				objTeamList.add(objTeam);
				
				count ++;
			}
			for(MESBasicObjTeam objTeam : objTeamList){
				objTeamService.deleteObjTeam(objTeam);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有班组数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjTeamPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicObjTeam.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicObjTeam.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicObjTeam.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicObjTeam.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicObjTeam.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicObjTeam> page = new Page<MESBasicObjTeam>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicObjTeam> datas = objTeamService.getByPage(page, detachedCriteria);
			List<MESBasicObjTeam> objTeamList = datas.getResult();
			if (objTeamList == null || objTeamList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(objTeamList.toArray());
			PaginationDTO<MESBasicObjTeam> pagination = new PaginationDTO<MESBasicObjTeam>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到班组则返回空。
	 * @param objTeam
	 * @return
	 */
	private MESBasicObjTeam getObjTeam(MESBasicObjTeam objTeam) {
		if (objTeam.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicObjTeam result = objTeamService.getObjTeam(objTeam.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果班组不存在，返回false；如果原来没有工厂对象，且修改的时候也没有配置工厂对象，则报错；如果配置的工厂对象不存在，则报错；
	 * @param objTeam
	 * @return 
	 */
	private boolean beforeUpdateObjTeam(MESBasicObjTeam objTeam){
		if(objTeam.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicObjTeam temp = getObjTeam(objTeam);
		if(temp == null){
			return false;
		}
		objTeam.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicObjTeam> clearObjTeamNonMainField(List<MESBasicObjTeam> list){
		 List<MESBasicObjTeam> objTeamList = new ArrayList<MESBasicObjTeam>();
		 for(MESBasicObjTeam objTeam:list){
			 MESBasicObjTeam temp = new MESBasicObjTeam();
			 temp.setId(objTeam.getId());
		 	 objTeamList.add(temp);
		 }
		 return objTeamList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkObjTeamData(MESBasicObjTeam objTeam){
	}
	 
	//------------------------------------辅模型 WS  关联设备-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据关联设备业务主键分页查询关联设备数据
	 * 
	 * @param 关联设备业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjEquipmentPageByFactoryModelBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "关联设备跟工厂没有设置关联！");
	}
	/**
	 * 根据关联设备id分页查询关联设备数据
	 * 
	 * @param 关联设备id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjEquipmentPageByFactoryModelPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "关联设备跟工厂没有设置关联！");
	}
	/**
	 * 根据关联设备id分获取关联设备数据
	 * 
	 * @param 关联设备id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjEquipment(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicObjEquipment objEquipment = objEquipmentService.getObjEquipment(id);
			if(objEquipment == null){
				return set404Error(result);
			}
			setSuccessResult(result, objEquipment);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据关联设备业务id修改关联设备数据
	 * 
	 * @param 关联设备对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateObjEquipment(
		@WebParam(name="objEquipment")MESBasicObjEquipment objEquipment,
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
			if(!beforeUpdateObjEquipment(objEquipment)){
				return set404Error(result);
			}
			objEquipmentService.saveObjEquipment(objEquipment, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增关联设备
	 * 
	 * @param 关联设备对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addObjEquipment(
		@WebParam(name="objEquipment")MESBasicObjEquipment objEquipment,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(objEquipment == null){
				return set500Error(result, "关联设备对象不能为空。");
			}
			if(objEquipment.getId() != null){
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
				checkObjEquipmentData(objEquipment);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			objEquipmentService.saveObjEquipment(objEquipment, null);
			Long objEquipmentId = objEquipment.getId();
			setSuccessResult(result, objEquipmentId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据关联设备id 删除关联设备
	 * 
	 * @param 关联设备id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteObjEquipment(
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
			
			MESBasicObjEquipment objEquipment = null;
			try{
				objEquipment = objEquipmentService.getObjEquipment(id);
			}catch(NullPointerException e){}
			if(objEquipment == null  || !objEquipment.isValid()){
				return set404Error(result);
			}
			objEquipmentService.deleteObjEquipment(objEquipment);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改关联设备数据，关联设备id不能为空
	 *
	 * @param 关联设备列表，每个关联设备必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateObjEquipment(
		@WebParam(name="objEquipmentList")List<MESBasicObjEquipment> objEquipmentList,
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
			for(MESBasicObjEquipment objEquipment : objEquipmentList){
				try{
					if(!beforeUpdateObjEquipment(objEquipment)){
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
			
			objEquipmentService.batchImportBaseObjEquipment(objEquipmentList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增关联设备数据
	 * 
	 * @param 关联设备列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddObjEquipment(
		@WebParam(name="objEquipmentList")List<MESBasicObjEquipment> objEquipmentList,
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
			
			if(objEquipmentList == null){
				set500Error(result, "objEquipmentList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicObjEquipment objEquipment : objEquipmentList){
				if(objEquipment.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkObjEquipmentData(objEquipment);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			objEquipmentService.batchImportBaseObjEquipment(objEquipmentList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicObjEquipment objEquipment : objEquipmentList){
				idList.add(objEquipment.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据关联设备id，批量删除关联设备数据
	 * 
	 * @param 关联设备id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelObjEquipment(
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
			
			List<MESBasicObjEquipment> objEquipmentList = new ArrayList<MESBasicObjEquipment>();
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
				
				MESBasicObjEquipment objEquipment = objEquipmentService.getObjEquipment(id);
				if(objEquipment == null || !objEquipment.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				objEquipmentList.add(objEquipment);
				
				count ++;
			}
			for(MESBasicObjEquipment objEquipment : objEquipmentList){
				objEquipmentService.deleteObjEquipment(objEquipment);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有关联设备数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjEquipmentPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicObjEquipment.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicObjEquipment.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicObjEquipment.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicObjEquipment.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicObjEquipment.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicObjEquipment> page = new Page<MESBasicObjEquipment>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicObjEquipment> datas = objEquipmentService.getByPage(page, detachedCriteria);
			List<MESBasicObjEquipment> objEquipmentList = datas.getResult();
			if (objEquipmentList == null || objEquipmentList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(objEquipmentList.toArray());
			PaginationDTO<MESBasicObjEquipment> pagination = new PaginationDTO<MESBasicObjEquipment>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到关联设备则返回空。
	 * @param objEquipment
	 * @return
	 */
	private MESBasicObjEquipment getObjEquipment(MESBasicObjEquipment objEquipment) {
		if (objEquipment.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicObjEquipment result = objEquipmentService.getObjEquipment(objEquipment.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果关联设备不存在，返回false；如果原来没有工厂对象，且修改的时候也没有配置工厂对象，则报错；如果配置的工厂对象不存在，则报错；
	 * @param objEquipment
	 * @return 
	 */
	private boolean beforeUpdateObjEquipment(MESBasicObjEquipment objEquipment){
		if(objEquipment.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicObjEquipment temp = getObjEquipment(objEquipment);
		if(temp == null){
			return false;
		}
		objEquipment.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicObjEquipment> clearObjEquipmentNonMainField(List<MESBasicObjEquipment> list){
		 List<MESBasicObjEquipment> objEquipmentList = new ArrayList<MESBasicObjEquipment>();
		 for(MESBasicObjEquipment objEquipment:list){
			 MESBasicObjEquipment temp = new MESBasicObjEquipment();
			 temp.setId(objEquipment.getId());
		 	 objEquipmentList.add(temp);
		 }
		 return objEquipmentList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkObjEquipmentData(MESBasicObjEquipment objEquipment){
	}
	 
	//------------------------------------辅模型 WS  关联物品-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据关联物品业务主键分页查询关联物品数据
	 * 
	 * @param 关联物品业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjProductPageByFactoryModelBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "关联物品跟工厂没有设置关联！");
	}
	/**
	 * 根据关联物品id分页查询关联物品数据
	 * 
	 * @param 关联物品id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjProductPageByFactoryModelPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "关联物品跟工厂没有设置关联！");
	}
	/**
	 * 根据关联物品id分获取关联物品数据
	 * 
	 * @param 关联物品id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjProduct(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicObjProduct objProduct = objProductService.getObjProduct(id);
			if(objProduct == null){
				return set404Error(result);
			}
			setSuccessResult(result, objProduct);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据关联物品业务id修改关联物品数据
	 * 
	 * @param 关联物品对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateObjProduct(
		@WebParam(name="objProduct")MESBasicObjProduct objProduct,
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
			if(!beforeUpdateObjProduct(objProduct)){
				return set404Error(result);
			}
			objProductService.saveObjProduct(objProduct, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增关联物品
	 * 
	 * @param 关联物品对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addObjProduct(
		@WebParam(name="objProduct")MESBasicObjProduct objProduct,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(objProduct == null){
				return set500Error(result, "关联物品对象不能为空。");
			}
			if(objProduct.getId() != null){
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
				checkObjProductData(objProduct);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			objProductService.saveObjProduct(objProduct, null);
			Long objProductId = objProduct.getId();
			setSuccessResult(result, objProductId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据关联物品id 删除关联物品
	 * 
	 * @param 关联物品id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteObjProduct(
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
			
			MESBasicObjProduct objProduct = null;
			try{
				objProduct = objProductService.getObjProduct(id);
			}catch(NullPointerException e){}
			if(objProduct == null  || !objProduct.isValid()){
				return set404Error(result);
			}
			objProductService.deleteObjProduct(objProduct);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改关联物品数据，关联物品id不能为空
	 *
	 * @param 关联物品列表，每个关联物品必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateObjProduct(
		@WebParam(name="objProductList")List<MESBasicObjProduct> objProductList,
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
			for(MESBasicObjProduct objProduct : objProductList){
				try{
					if(!beforeUpdateObjProduct(objProduct)){
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
			
			objProductService.batchImportBaseObjProduct(objProductList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增关联物品数据
	 * 
	 * @param 关联物品列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddObjProduct(
		@WebParam(name="objProductList")List<MESBasicObjProduct> objProductList,
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
			
			if(objProductList == null){
				set500Error(result, "objProductList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicObjProduct objProduct : objProductList){
				if(objProduct.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkObjProductData(objProduct);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			objProductService.batchImportBaseObjProduct(objProductList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicObjProduct objProduct : objProductList){
				idList.add(objProduct.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据关联物品id，批量删除关联物品数据
	 * 
	 * @param 关联物品id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelObjProduct(
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
			
			List<MESBasicObjProduct> objProductList = new ArrayList<MESBasicObjProduct>();
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
				
				MESBasicObjProduct objProduct = objProductService.getObjProduct(id);
				if(objProduct == null || !objProduct.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				objProductList.add(objProduct);
				
				count ++;
			}
			for(MESBasicObjProduct objProduct : objProductList){
				objProductService.deleteObjProduct(objProduct);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有关联物品数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getObjProductPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicObjProduct.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicObjProduct.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicObjProduct.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicObjProduct.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicObjProduct.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicObjProduct> page = new Page<MESBasicObjProduct>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicObjProduct> datas = objProductService.getByPage(page, detachedCriteria);
			List<MESBasicObjProduct> objProductList = datas.getResult();
			if (objProductList == null || objProductList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(objProductList.toArray());
			PaginationDTO<MESBasicObjProduct> pagination = new PaginationDTO<MESBasicObjProduct>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到关联物品则返回空。
	 * @param objProduct
	 * @return
	 */
	private MESBasicObjProduct getObjProduct(MESBasicObjProduct objProduct) {
		if (objProduct.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicObjProduct result = objProductService.getObjProduct(objProduct.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果关联物品不存在，返回false；如果原来没有工厂对象，且修改的时候也没有配置工厂对象，则报错；如果配置的工厂对象不存在，则报错；
	 * @param objProduct
	 * @return 
	 */
	private boolean beforeUpdateObjProduct(MESBasicObjProduct objProduct){
		if(objProduct.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicObjProduct temp = getObjProduct(objProduct);
		if(temp == null){
			return false;
		}
		objProduct.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicObjProduct> clearObjProductNonMainField(List<MESBasicObjProduct> list){
		 List<MESBasicObjProduct> objProductList = new ArrayList<MESBasicObjProduct>();
		 for(MESBasicObjProduct objProduct:list){
			 MESBasicObjProduct temp = new MESBasicObjProduct();
			 temp.setId(objProduct.getId());
		 	 objProductList.add(temp);
		 }
		 return objProductList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkObjProductData(MESBasicObjProduct objProduct){
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
	 * 获取工厂对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param factoryModel
	 * @return
	 */
	private MESBasicFactoryModel getFactoryModel(MESBasicFactoryModel factoryModel) {
		if (factoryModel.getId() == null && (factoryModel.getCode() == null || factoryModel.getCode().toString().trim() == ""))
			throw new RuntimeException("工厂对象业务主键和id不能同时为空");
		if (factoryModel.getId() != null) {
			MESBasicFactoryModel result = factoryModelService.getFactoryModel(factoryModel .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return factoryModelService.loadFactoryModelByBussinessKey(factoryModel.getCode());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个工厂，则返回false，否则返回true
	 * @param factoryModel
	 */
	private boolean beforeUpdateFactoryModel(MESBasicFactoryModel factoryModel) {
		MESBasicFactoryModel temp = getFactoryModel(factoryModel);
		if (temp == null) {
			return false;
		}
		if(factoryModel.getId() == null){
			factoryModel.setId(temp.getId());		
		}
		if(factoryModel.getCode() == null){
			factoryModel.setCode(temp.getCode());
		}
		
		factoryModel.setVersion(temp.getVersion());
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
	 * 清除工厂对象下所有辅模型对象中的工厂对象
	 * @param factoryModel
	 */
	private void clearCircle(MESBasicFactoryModel factoryModel) {
	
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
	private void checkFactoryModelData(MESBasicFactoryModel factoryModel){
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}