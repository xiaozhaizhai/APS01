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
import com.supcon.orchid.MESBasic.services.MESBasicProductWSService;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.MESBasic.services.MESBasicCommDealInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicProductCostService;
import com.supcon.orchid.MESBasic.services.MESBasicProdDealInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicProdResetDailyService;
import com.supcon.orchid.MESBasic.services.MESBasicProdLevelService;
import com.supcon.orchid.MESBasic.services.MESBasicCprodAttService;
	
/* CUSTOM CODE START(wsserviceimpl,import,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="MESBasicProduct",targetNamespace = "http://ws.supcon.com")
public class MESBasicProductWSServiceImpl implements MESBasicProductWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private MESBasicProductService productService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private MESBasicCommDealInfoService commDealInfoService;
	@Resource
	private MESBasicProductCostService productCostService;
	@Resource
	private MESBasicProdDealInfoService prodDealInfoService;
	@Resource
	private MESBasicProdResetDailyService prodResetDailyService;
	@Resource
	private MESBasicProdLevelService prodLevelService;
	@Resource
	private MESBasicCprodAttService cprodAttService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取物品数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProductByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			MESBasicProduct product = productService.loadProductByBussinessKey(businessKey);
			if(product == null){
				return set404Error(result);
			}
			//添加辅模型
			List<MESBasicProdResetDaily> prodResetDailyList = clearProdResetDailyNonMainField(productService.getProdResetDailyList(product));
			product.setProdResetDailyList(prodResetDailyList);
			List<MESBasicProdLevel> prodLevelList = clearProdLevelNonMainField(productService.getProdLevelList(product));
			product.setProdLevelList(prodLevelList);
			List<MESBasicCprodAtt> cprodAttList = clearCprodAttNonMainField(productService.getCprodAttList(product));
			product.setCprodAttList(cprodAttList);
			
			setSuccessResult(result, product);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取物品数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProductByPk(
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
			
			MESBasicProduct product = productService.getProduct(id);
			if(product == null || !product.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<MESBasicProdResetDaily> prodResetDailyList = clearProdResetDailyNonMainField(productService.getProdResetDailyList(product));
			product.setProdResetDailyList(prodResetDailyList);
			List<MESBasicProdLevel> prodLevelList = clearProdLevelNonMainField(productService.getProdLevelList(product));
			product.setProdLevelList(prodLevelList);
			List<MESBasicCprodAtt> cprodAttList = clearCprodAttNonMainField(productService.getCprodAttList(product));
			product.setCprodAttList(cprodAttList);
			setSuccessResult(result, product);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改物品数据
	 * @param 物品对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProduct(
		@WebParam(name="product")MESBasicProduct product,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(product == null){
				return set500Error(result, "物品不能为空。");
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
			
			if(!beforeUpdateProduct(product)){
				return set404Error(result);
			}
			productService.saveProduct(product, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProduct(
		@WebParam(name="product")MESBasicProduct product,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(product == null){
				return set500Error(result, "物品不能为空。");
			}
		
			if(product.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(product.getProductCode() == null){
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
				checkProductData(product);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			productService.saveProduct(product, null);
			setSuccessResult(result, product.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProductByBusinessKey(
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
			MESBasicProduct product = null;
			try{
				product = productService.loadProductByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(product == null){
				return set404Error(result);
			}
			productService.deleteProduct(product);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProductByPk(
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
			MESBasicProduct product = null;
			try{
				product = productService.getProduct(id);
			}catch(NullPointerException e){}
			if(product == null || !product.isValid()){
				return set404Error(result);
			}
			productService.deleteProduct(product);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProduct(
		@WebParam(name="productList")List<MESBasicProduct> productList,
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
			for(MESBasicProduct product : productList){
				if(product.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(product.getProductCode() == null || product.getProductCode().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkProductData(product);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			productService.batchImportBaseProduct(productList);
			for(MESBasicProduct product : productList){
				idList.add(product.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProduct(
		@WebParam(name="productList")List<MESBasicProduct> productList,
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
			for(MESBasicProduct product : productList){
				try{
					if(!beforeUpdateProduct(product)){
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
			productService.batchImportBaseProduct(productList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteProductByPk(
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
				MESBasicProduct temp = null;
				try{
					temp = productService.getProduct(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			productService.deleteProduct(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteProductByBusinessKey(
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
				MESBasicProduct temp = null;
				try{
					temp = productService.loadProductByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			productService.deleteProduct(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProductPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicProduct.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),MESBasicProduct.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicProduct.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicProduct.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProduct.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicProduct> page = new Page<MESBasicProduct>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicProduct> datas = productService.getByPage(page, detachedCriteria);
			List<MESBasicProduct> productList = datas.getResult();
			if (productList == null || productList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(productList.toArray());
			PaginationDTO<MESBasicProduct> pagination = new PaginationDTO<MESBasicProduct>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据物品业务主键查询物品下所有辅模型
	 * @param 物品业务主键
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
			MESBasicProduct product = productService.loadProductByBussinessKey(businessKey);
			if (product == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap prodResetDailyMap = new SimulationMap();
			prodResetDailyMap.setName(InternationalResource.get("ProdResetDaily"));
			prodResetDailyMap.setList(productService.getProdResetDailyList(product));
			resultList.add(prodResetDailyMap);
			
			SimulationMap prodLevelMap = new SimulationMap();
			prodLevelMap.setName(InternationalResource.get("ProdLevel"));
			prodLevelMap.setList(productService.getProdLevelList(product));
			resultList.add(prodLevelMap);
			
			SimulationMap cprodAttMap = new SimulationMap();
			cprodAttMap.setName(InternationalResource.get("CprodAtt"));
			cprodAttMap.setList(productService.getCprodAttList(product));
			resultList.add(cprodAttMap);
			
			clearCircle(product);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品id查询物品下所有辅模型
	 * 
	 * @param 物品id
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
			MESBasicProduct product = productService.getProduct(id);
			if (product == null || !product.isValid()) {
				result.setErrorMessage("找不到物品");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap prodResetDailyMap = new SimulationMap();
			prodResetDailyMap.setName(InternationalResource.get("ProdResetDaily"));
			prodResetDailyMap.setList(productService.getProdResetDailyList(product));
			resultList.add(prodResetDailyMap);
			
			SimulationMap prodLevelMap = new SimulationMap();
			prodLevelMap.setName(InternationalResource.get("ProdLevel"));
			prodLevelMap.setList(productService.getProdLevelList(product));
			resultList.add(prodLevelMap);
			
			SimulationMap cprodAttMap = new SimulationMap();
			cprodAttMap.setName(InternationalResource.get("CprodAtt"));
			cprodAttMap.setList(productService.getCprodAttList(product));
			resultList.add(cprodAttMap);
			
			clearCircle(product);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  更改记录(采购组)-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据更改记录(采购组)业务主键分页查询更改记录(采购组)数据
	 * 
	 * @param 更改记录(采购组)业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCommDealInfoPageByProductBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "更改记录(采购组)跟物品没有设置关联！");
	}
	/**
	 * 根据更改记录(采购组)id分页查询更改记录(采购组)数据
	 * 
	 * @param 更改记录(采购组)id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCommDealInfoPageByProductPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "更改记录(采购组)跟物品没有设置关联！");
	}
	/**
	 * 根据更改记录(采购组)id分获取更改记录(采购组)数据
	 * 
	 * @param 更改记录(采购组)id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCommDealInfo(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicCommDealInfo commDealInfo = commDealInfoService.getCommDealInfo(id);
			if(commDealInfo == null){
				return set404Error(result);
			}
			setSuccessResult(result, commDealInfo);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据更改记录(采购组)业务id修改更改记录(采购组)数据
	 * 
	 * @param 更改记录(采购组)对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateCommDealInfo(
		@WebParam(name="commDealInfo")MESBasicCommDealInfo commDealInfo,
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
			if(!beforeUpdateCommDealInfo(commDealInfo)){
				return set404Error(result);
			}
			commDealInfoService.saveCommDealInfo(commDealInfo, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增更改记录(采购组)
	 * 
	 * @param 更改记录(采购组)对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addCommDealInfo(
		@WebParam(name="commDealInfo")MESBasicCommDealInfo commDealInfo,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(commDealInfo == null){
				return set500Error(result, "更改记录(采购组)对象不能为空。");
			}
			if(commDealInfo.getId() != null){
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
				checkCommDealInfoData(commDealInfo);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			commDealInfoService.saveCommDealInfo(commDealInfo, null);
			Long commDealInfoId = commDealInfo.getId();
			setSuccessResult(result, commDealInfoId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据更改记录(采购组)id 删除更改记录(采购组)
	 * 
	 * @param 更改记录(采购组)id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteCommDealInfo(
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
			
			MESBasicCommDealInfo commDealInfo = null;
			try{
				commDealInfo = commDealInfoService.getCommDealInfo(id);
			}catch(NullPointerException e){}
			if(commDealInfo == null  || !commDealInfo.isValid()){
				return set404Error(result);
			}
			commDealInfoService.deleteCommDealInfo(commDealInfo);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改更改记录(采购组)数据，更改记录(采购组)id不能为空
	 *
	 * @param 更改记录(采购组)列表，每个更改记录(采购组)必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateCommDealInfo(
		@WebParam(name="commDealInfoList")List<MESBasicCommDealInfo> commDealInfoList,
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
			for(MESBasicCommDealInfo commDealInfo : commDealInfoList){
				try{
					if(!beforeUpdateCommDealInfo(commDealInfo)){
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
			
			commDealInfoService.batchImportBaseCommDealInfo(commDealInfoList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增更改记录(采购组)数据
	 * 
	 * @param 更改记录(采购组)列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddCommDealInfo(
		@WebParam(name="commDealInfoList")List<MESBasicCommDealInfo> commDealInfoList,
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
			
			if(commDealInfoList == null){
				set500Error(result, "commDealInfoList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicCommDealInfo commDealInfo : commDealInfoList){
				if(commDealInfo.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkCommDealInfoData(commDealInfo);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			commDealInfoService.batchImportBaseCommDealInfo(commDealInfoList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicCommDealInfo commDealInfo : commDealInfoList){
				idList.add(commDealInfo.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据更改记录(采购组)id，批量删除更改记录(采购组)数据
	 * 
	 * @param 更改记录(采购组)id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelCommDealInfo(
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
			
			List<MESBasicCommDealInfo> commDealInfoList = new ArrayList<MESBasicCommDealInfo>();
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
				
				MESBasicCommDealInfo commDealInfo = commDealInfoService.getCommDealInfo(id);
				if(commDealInfo == null || !commDealInfo.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				commDealInfoList.add(commDealInfo);
				
				count ++;
			}
			for(MESBasicCommDealInfo commDealInfo : commDealInfoList){
				commDealInfoService.deleteCommDealInfo(commDealInfo);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有更改记录(采购组)数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCommDealInfoPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicCommDealInfo.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicCommDealInfo.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicCommDealInfo.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicCommDealInfo.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicCommDealInfo.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicCommDealInfo> page = new Page<MESBasicCommDealInfo>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicCommDealInfo> datas = commDealInfoService.getByPage(page, detachedCriteria);
			List<MESBasicCommDealInfo> commDealInfoList = datas.getResult();
			if (commDealInfoList == null || commDealInfoList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(commDealInfoList.toArray());
			PaginationDTO<MESBasicCommDealInfo> pagination = new PaginationDTO<MESBasicCommDealInfo>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到更改记录(采购组)则返回空。
	 * @param commDealInfo
	 * @return
	 */
	private MESBasicCommDealInfo getCommDealInfo(MESBasicCommDealInfo commDealInfo) {
		if (commDealInfo.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicCommDealInfo result = commDealInfoService.getCommDealInfo(commDealInfo.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果更改记录(采购组)不存在，返回false；如果原来没有物品对象，且修改的时候也没有配置物品对象，则报错；如果配置的物品对象不存在，则报错；
	 * @param commDealInfo
	 * @return 
	 */
	private boolean beforeUpdateCommDealInfo(MESBasicCommDealInfo commDealInfo){
		if(commDealInfo.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicCommDealInfo temp = getCommDealInfo(commDealInfo);
		if(temp == null){
			return false;
		}
		commDealInfo.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicCommDealInfo> clearCommDealInfoNonMainField(List<MESBasicCommDealInfo> list){
		 List<MESBasicCommDealInfo> commDealInfoList = new ArrayList<MESBasicCommDealInfo>();
		 for(MESBasicCommDealInfo commDealInfo:list){
			 MESBasicCommDealInfo temp = new MESBasicCommDealInfo();
			 temp.setId(commDealInfo.getId());
		 	 commDealInfoList.add(temp);
		 }
		 return commDealInfoList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkCommDealInfoData(MESBasicCommDealInfo commDealInfo){
	}
	 
	//------------------------------------辅模型 WS  价格记录表-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据价格记录表业务主键分页查询价格记录表数据
	 * 
	 * @param 价格记录表业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProductCostPageByProductBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "价格记录表跟物品没有设置关联！");
	}
	/**
	 * 根据价格记录表id分页查询价格记录表数据
	 * 
	 * @param 价格记录表id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProductCostPageByProductPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "价格记录表跟物品没有设置关联！");
	}
	/**
	 * 根据价格记录表id分获取价格记录表数据
	 * 
	 * @param 价格记录表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProductCost(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicProductCost productCost = productCostService.getProductCost(id);
			if(productCost == null){
				return set404Error(result);
			}
			setSuccessResult(result, productCost);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据价格记录表业务id修改价格记录表数据
	 * 
	 * @param 价格记录表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProductCost(
		@WebParam(name="productCost")MESBasicProductCost productCost,
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
			if(!beforeUpdateProductCost(productCost)){
				return set404Error(result);
			}
			productCostService.saveProductCost(productCost, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增价格记录表
	 * 
	 * @param 价格记录表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProductCost(
		@WebParam(name="productCost")MESBasicProductCost productCost,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(productCost == null){
				return set500Error(result, "价格记录表对象不能为空。");
			}
			if(productCost.getId() != null){
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
				checkProductCostData(productCost);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			productCostService.saveProductCost(productCost, null);
			Long productCostId = productCost.getId();
			setSuccessResult(result, productCostId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据价格记录表id 删除价格记录表
	 * 
	 * @param 价格记录表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProductCost(
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
			
			MESBasicProductCost productCost = null;
			try{
				productCost = productCostService.getProductCost(id);
			}catch(NullPointerException e){}
			if(productCost == null  || !productCost.isValid()){
				return set404Error(result);
			}
			productCostService.deleteProductCost(productCost);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改价格记录表数据，价格记录表id不能为空
	 *
	 * @param 价格记录表列表，每个价格记录表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProductCost(
		@WebParam(name="productCostList")List<MESBasicProductCost> productCostList,
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
			for(MESBasicProductCost productCost : productCostList){
				try{
					if(!beforeUpdateProductCost(productCost)){
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
			
			productCostService.batchImportBaseProductCost(productCostList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增价格记录表数据
	 * 
	 * @param 价格记录表列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProductCost(
		@WebParam(name="productCostList")List<MESBasicProductCost> productCostList,
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
			
			if(productCostList == null){
				set500Error(result, "productCostList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicProductCost productCost : productCostList){
				if(productCost.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkProductCostData(productCost);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			productCostService.batchImportBaseProductCost(productCostList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicProductCost productCost : productCostList){
				idList.add(productCost.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据价格记录表id，批量删除价格记录表数据
	 * 
	 * @param 价格记录表id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProductCost(
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
			
			List<MESBasicProductCost> productCostList = new ArrayList<MESBasicProductCost>();
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
				
				MESBasicProductCost productCost = productCostService.getProductCost(id);
				if(productCost == null || !productCost.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				productCostList.add(productCost);
				
				count ++;
			}
			for(MESBasicProductCost productCost : productCostList){
				productCostService.deleteProductCost(productCost);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有价格记录表数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProductCostPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicProductCost.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicProductCost.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicProductCost.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicProductCost.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProductCost.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicProductCost> page = new Page<MESBasicProductCost>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicProductCost> datas = productCostService.getByPage(page, detachedCriteria);
			List<MESBasicProductCost> productCostList = datas.getResult();
			if (productCostList == null || productCostList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(productCostList.toArray());
			PaginationDTO<MESBasicProductCost> pagination = new PaginationDTO<MESBasicProductCost>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到价格记录表则返回空。
	 * @param productCost
	 * @return
	 */
	private MESBasicProductCost getProductCost(MESBasicProductCost productCost) {
		if (productCost.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicProductCost result = productCostService.getProductCost(productCost.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果价格记录表不存在，返回false；如果原来没有物品对象，且修改的时候也没有配置物品对象，则报错；如果配置的物品对象不存在，则报错；
	 * @param productCost
	 * @return 
	 */
	private boolean beforeUpdateProductCost(MESBasicProductCost productCost){
		if(productCost.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicProductCost temp = getProductCost(productCost);
		if(temp == null){
			return false;
		}
		productCost.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicProductCost> clearProductCostNonMainField(List<MESBasicProductCost> list){
		 List<MESBasicProductCost> productCostList = new ArrayList<MESBasicProductCost>();
		 for(MESBasicProductCost productCost:list){
			 MESBasicProductCost temp = new MESBasicProductCost();
			 temp.setId(productCost.getId());
		 	 productCostList.add(temp);
		 }
		 return productCostList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProductCostData(MESBasicProductCost productCost){
	}
	 
	//------------------------------------辅模型 WS  物品维护记录-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据物品维护记录业务主键分页查询物品维护记录数据
	 * 
	 * @param 物品维护记录业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdDealInfoPageByProductBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "物品维护记录跟物品没有设置关联！");
	}
	/**
	 * 根据物品维护记录id分页查询物品维护记录数据
	 * 
	 * @param 物品维护记录id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdDealInfoPageByProductPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "物品维护记录跟物品没有设置关联！");
	}
	/**
	 * 根据物品维护记录id分获取物品维护记录数据
	 * 
	 * @param 物品维护记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdDealInfo(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicProdDealInfo prodDealInfo = prodDealInfoService.getProdDealInfo(id);
			if(prodDealInfo == null){
				return set404Error(result);
			}
			setSuccessResult(result, prodDealInfo);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品维护记录业务id修改物品维护记录数据
	 * 
	 * @param 物品维护记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProdDealInfo(
		@WebParam(name="prodDealInfo")MESBasicProdDealInfo prodDealInfo,
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
			if(!beforeUpdateProdDealInfo(prodDealInfo)){
				return set404Error(result);
			}
			prodDealInfoService.saveProdDealInfo(prodDealInfo, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增物品维护记录
	 * 
	 * @param 物品维护记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProdDealInfo(
		@WebParam(name="prodDealInfo")MESBasicProdDealInfo prodDealInfo,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(prodDealInfo == null){
				return set500Error(result, "物品维护记录对象不能为空。");
			}
			if(prodDealInfo.getId() != null){
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
				checkProdDealInfoData(prodDealInfo);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			prodDealInfoService.saveProdDealInfo(prodDealInfo, null);
			Long prodDealInfoId = prodDealInfo.getId();
			setSuccessResult(result, prodDealInfoId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品维护记录id 删除物品维护记录
	 * 
	 * @param 物品维护记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProdDealInfo(
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
			
			MESBasicProdDealInfo prodDealInfo = null;
			try{
				prodDealInfo = prodDealInfoService.getProdDealInfo(id);
			}catch(NullPointerException e){}
			if(prodDealInfo == null  || !prodDealInfo.isValid()){
				return set404Error(result);
			}
			prodDealInfoService.deleteProdDealInfo(prodDealInfo);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改物品维护记录数据，物品维护记录id不能为空
	 *
	 * @param 物品维护记录列表，每个物品维护记录必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProdDealInfo(
		@WebParam(name="prodDealInfoList")List<MESBasicProdDealInfo> prodDealInfoList,
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
			for(MESBasicProdDealInfo prodDealInfo : prodDealInfoList){
				try{
					if(!beforeUpdateProdDealInfo(prodDealInfo)){
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
			
			prodDealInfoService.batchImportBaseProdDealInfo(prodDealInfoList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增物品维护记录数据
	 * 
	 * @param 物品维护记录列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProdDealInfo(
		@WebParam(name="prodDealInfoList")List<MESBasicProdDealInfo> prodDealInfoList,
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
			
			if(prodDealInfoList == null){
				set500Error(result, "prodDealInfoList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicProdDealInfo prodDealInfo : prodDealInfoList){
				if(prodDealInfo.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkProdDealInfoData(prodDealInfo);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			prodDealInfoService.batchImportBaseProdDealInfo(prodDealInfoList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicProdDealInfo prodDealInfo : prodDealInfoList){
				idList.add(prodDealInfo.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品维护记录id，批量删除物品维护记录数据
	 * 
	 * @param 物品维护记录id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProdDealInfo(
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
			
			List<MESBasicProdDealInfo> prodDealInfoList = new ArrayList<MESBasicProdDealInfo>();
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
				
				MESBasicProdDealInfo prodDealInfo = prodDealInfoService.getProdDealInfo(id);
				if(prodDealInfo == null || !prodDealInfo.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				prodDealInfoList.add(prodDealInfo);
				
				count ++;
			}
			for(MESBasicProdDealInfo prodDealInfo : prodDealInfoList){
				prodDealInfoService.deleteProdDealInfo(prodDealInfo);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有物品维护记录数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdDealInfoPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdDealInfo.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicProdDealInfo.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicProdDealInfo.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicProdDealInfo.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdDealInfo.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicProdDealInfo> page = new Page<MESBasicProdDealInfo>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicProdDealInfo> datas = prodDealInfoService.getByPage(page, detachedCriteria);
			List<MESBasicProdDealInfo> prodDealInfoList = datas.getResult();
			if (prodDealInfoList == null || prodDealInfoList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodDealInfoList.toArray());
			PaginationDTO<MESBasicProdDealInfo> pagination = new PaginationDTO<MESBasicProdDealInfo>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到物品维护记录则返回空。
	 * @param prodDealInfo
	 * @return
	 */
	private MESBasicProdDealInfo getProdDealInfo(MESBasicProdDealInfo prodDealInfo) {
		if (prodDealInfo.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicProdDealInfo result = prodDealInfoService.getProdDealInfo(prodDealInfo.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果物品维护记录不存在，返回false；如果原来没有物品对象，且修改的时候也没有配置物品对象，则报错；如果配置的物品对象不存在，则报错；
	 * @param prodDealInfo
	 * @return 
	 */
	private boolean beforeUpdateProdDealInfo(MESBasicProdDealInfo prodDealInfo){
		if(prodDealInfo.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicProdDealInfo temp = getProdDealInfo(prodDealInfo);
		if(temp == null){
			return false;
		}
		prodDealInfo.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicProdDealInfo> clearProdDealInfoNonMainField(List<MESBasicProdDealInfo> list){
		 List<MESBasicProdDealInfo> prodDealInfoList = new ArrayList<MESBasicProdDealInfo>();
		 for(MESBasicProdDealInfo prodDealInfo:list){
			 MESBasicProdDealInfo temp = new MESBasicProdDealInfo();
			 temp.setId(prodDealInfo.getId());
		 	 prodDealInfoList.add(temp);
		 }
		 return prodDealInfoList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProdDealInfoData(MESBasicProdDealInfo prodDealInfo){
	}
	 
	//------------------------------------辅模型 WS  复验周期-------------------------------------------------
	//--hasLink:true---link:ProductID
	/**
	 * 根据复验周期业务主键分页查询复验周期数据
	 * 
	 * @param 复验周期业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdResetDailyPageByProductBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicProdResetDaily.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicProdResetDaily.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			MESBasicProduct product = productService.loadProductByBussinessKey(businessKey);
			if (product == null) {
				return set500Error(result, "该业务主键的物品不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("productID",product));
			Page<MESBasicProdResetDaily> page = new Page<MESBasicProdResetDaily>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicProdResetDaily> datas = prodResetDailyService.getByPage(page, detachedCriteria);
			List<MESBasicProdResetDaily> prodResetDailyList = datas.getResult();
			if (prodResetDailyList == null || prodResetDailyList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodResetDailyList.toArray());
			PaginationDTO<MESBasicProdResetDaily> pagination = new PaginationDTO<MESBasicProdResetDaily>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据复验周期id分页查询复验周期数据
	 * 
	 * @param 复验周期id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdResetDailyPageByProductPk(	
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), MESBasicProdResetDaily.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicProdResetDaily.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			MESBasicProduct product = productService.getProduct(id);
			if (product == null) {
				return set500Error(result, "该主键的物品不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("productID",product));
			Page<MESBasicProdResetDaily> page = new Page<MESBasicProdResetDaily>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicProdResetDaily> datas = prodResetDailyService.getByPage(page, detachedCriteria);
			List<MESBasicProdResetDaily> prodResetDailyList = datas.getResult();
			if (prodResetDailyList == null || prodResetDailyList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodResetDailyList.toArray());
			PaginationDTO<MESBasicProdResetDaily> pagination = new PaginationDTO<MESBasicProdResetDaily>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据复验周期id分获取复验周期数据
	 * 
	 * @param 复验周期id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdResetDaily(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicProdResetDaily prodResetDaily = prodResetDailyService.getProdResetDaily(id);
			if(prodResetDaily == null){
				return set404Error(result);
			}
			setSuccessResult(result, prodResetDaily);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据复验周期业务id修改复验周期数据
	 * 
	 * @param 复验周期对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProdResetDaily(
		@WebParam(name="prodResetDaily")MESBasicProdResetDaily prodResetDaily,
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
			if(!beforeUpdateProdResetDaily(prodResetDaily)){
				return set404Error(result);
			}
			prodResetDailyService.saveProdResetDaily(prodResetDaily, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增复验周期
	 * 
	 * @param 复验周期对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProdResetDaily(
		@WebParam(name="prodResetDaily")MESBasicProdResetDaily prodResetDaily,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(prodResetDaily == null){
				return set500Error(result, "复验周期对象不能为空。");
			}
			if(prodResetDaily.getId() != null){
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
				checkProdResetDailyData(prodResetDaily);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			MESBasicProduct tempProduct = prodResetDaily.getProductID();
			if (tempProduct == null) {
				return set500Error(result, "物品对象不能为空");
			}
			
			MESBasicProduct product = null;
			if(tempProduct.getId()!= null){
				product = productService.getProduct(tempProduct.getId());
			}else if(tempProduct.getProductCode() != null){
				product = productService.loadProductByBussinessKey(tempProduct.getProductCode());
			}else{
				return set500Error(result, "物品对象必须设置id或业务主键。");
			}
			
			if(product == null){
				return set404Error(result);
			}
			prodResetDaily.setProductID(product);
			
			prodResetDailyService.saveProdResetDaily(prodResetDaily, null);
			Long prodResetDailyId = prodResetDaily.getId();
			setSuccessResult(result, prodResetDailyId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据复验周期id 删除复验周期
	 * 
	 * @param 复验周期id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProdResetDaily(
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
			
			MESBasicProdResetDaily prodResetDaily = null;
			try{
				prodResetDaily = prodResetDailyService.getProdResetDaily(id);
			}catch(NullPointerException e){}
			if(prodResetDaily == null  || !prodResetDaily.isValid()){
				return set404Error(result);
			}
			prodResetDailyService.deleteProdResetDaily(prodResetDaily);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改复验周期数据，复验周期id不能为空
	 *
	 * @param 复验周期列表，每个复验周期必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProdResetDaily(
		@WebParam(name="prodResetDailyList")List<MESBasicProdResetDaily> prodResetDailyList,
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
			for(MESBasicProdResetDaily prodResetDaily : prodResetDailyList){
				try{
					if(!beforeUpdateProdResetDaily(prodResetDaily)){
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
			
			prodResetDailyService.batchImportBaseProdResetDaily(prodResetDailyList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增复验周期数据
	 * 
	 * @param 复验周期列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProdResetDaily(
		@WebParam(name="prodResetDailyList")List<MESBasicProdResetDaily> prodResetDailyList,
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
			
			if(prodResetDailyList == null){
				set500Error(result, "prodResetDailyList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicProdResetDaily prodResetDaily : prodResetDailyList){
				if(prodResetDaily.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(prodResetDaily.getProductID() == null){
						set500Error(result, "第"+count+"条数据出错：物品对象不能为空。");
						return result;
					}
					MESBasicProduct product = getProduct(prodResetDaily.getProductID());
					if(product == null){
						set500Error(result, "第"+count+"条数据出错：物品对象不存在。");
						return result;
					}
					prodResetDaily.setProductID(product);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkProdResetDailyData(prodResetDaily);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			prodResetDailyService.batchImportBaseProdResetDaily(prodResetDailyList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicProdResetDaily prodResetDaily : prodResetDailyList){
				idList.add(prodResetDaily.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据复验周期id，批量删除复验周期数据
	 * 
	 * @param 复验周期id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProdResetDaily(
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
			
			List<MESBasicProdResetDaily> prodResetDailyList = new ArrayList<MESBasicProdResetDaily>();
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
				
				MESBasicProdResetDaily prodResetDaily = prodResetDailyService.getProdResetDaily(id);
				if(prodResetDaily == null || !prodResetDaily.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				prodResetDailyList.add(prodResetDaily);
				
				count ++;
			}
			for(MESBasicProdResetDaily prodResetDaily : prodResetDailyList){
				prodResetDailyService.deleteProdResetDaily(prodResetDaily);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有复验周期数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdResetDailyPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicProdResetDaily.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicProdResetDaily.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdResetDaily.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicProdResetDaily> page = new Page<MESBasicProdResetDaily>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicProdResetDaily> datas = prodResetDailyService.getByPage(page, detachedCriteria);
			List<MESBasicProdResetDaily> prodResetDailyList = datas.getResult();
			if (prodResetDailyList == null || prodResetDailyList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodResetDailyList.toArray());
			PaginationDTO<MESBasicProdResetDaily> pagination = new PaginationDTO<MESBasicProdResetDaily>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到复验周期则返回空。
	 * @param prodResetDaily
	 * @return
	 */
	private MESBasicProdResetDaily getProdResetDaily(MESBasicProdResetDaily prodResetDaily) {
		if (prodResetDaily.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicProdResetDaily result = prodResetDailyService.getProdResetDaily(prodResetDaily.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果复验周期不存在，返回false；如果原来没有物品对象，且修改的时候也没有配置物品对象，则报错；如果配置的物品对象不存在，则报错；
	 * @param prodResetDaily
	 * @return 
	 */
	private boolean beforeUpdateProdResetDaily(MESBasicProdResetDaily prodResetDaily){
		if(prodResetDaily.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicProdResetDaily temp = getProdResetDaily(prodResetDaily);
		if(temp == null){
			return false;
		}
		MESBasicProduct product = null;
		if (temp.getProductID() == null) {
			if (prodResetDaily.getProductID() == null || (prodResetDaily.getProductID().getId() == null && prodResetDaily.getProductID().getProductCode() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				product = getProduct(prodResetDaily.getProductID());
				if(product == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (prodResetDaily.getProductID() == null || (prodResetDaily.getProductID().getId() == null && prodResetDaily.getProductID().getProductCode() == null)) {
				product = temp.getProductID();
			} else {
				product = getProduct(prodResetDaily.getProductID());
				if (product == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		prodResetDaily.setProductID(product);
		prodResetDaily.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicProdResetDaily> clearProdResetDailyNonMainField(List<MESBasicProdResetDaily> list){
		 List<MESBasicProdResetDaily> prodResetDailyList = new ArrayList<MESBasicProdResetDaily>();
		 for(MESBasicProdResetDaily prodResetDaily:list){
			 MESBasicProdResetDaily temp = new MESBasicProdResetDaily();
			 temp.setId(prodResetDaily.getId());
		 	 prodResetDailyList.add(temp);
		 }
		 return prodResetDailyList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProdResetDailyData(MESBasicProdResetDaily prodResetDaily){
	}
	 
	//------------------------------------辅模型 WS  物品等级设置表-------------------------------------------------
	//--hasLink:true---link:ProductID
	/**
	 * 根据物品等级设置表业务主键分页查询物品等级设置表数据
	 * 
	 * @param 物品等级设置表业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdLevelPageByProductBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicProdLevel.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicProdLevel.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			MESBasicProduct product = productService.loadProductByBussinessKey(businessKey);
			if (product == null) {
				return set500Error(result, "该业务主键的物品不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("productID",product));
			Page<MESBasicProdLevel> page = new Page<MESBasicProdLevel>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicProdLevel> datas = prodLevelService.getByPage(page, detachedCriteria);
			List<MESBasicProdLevel> prodLevelList = datas.getResult();
			if (prodLevelList == null || prodLevelList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodLevelList.toArray());
			PaginationDTO<MESBasicProdLevel> pagination = new PaginationDTO<MESBasicProdLevel>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品等级设置表id分页查询物品等级设置表数据
	 * 
	 * @param 物品等级设置表id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdLevelPageByProductPk(	
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), MESBasicProdLevel.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicProdLevel.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			MESBasicProduct product = productService.getProduct(id);
			if (product == null) {
				return set500Error(result, "该主键的物品不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("productID",product));
			Page<MESBasicProdLevel> page = new Page<MESBasicProdLevel>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicProdLevel> datas = prodLevelService.getByPage(page, detachedCriteria);
			List<MESBasicProdLevel> prodLevelList = datas.getResult();
			if (prodLevelList == null || prodLevelList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodLevelList.toArray());
			PaginationDTO<MESBasicProdLevel> pagination = new PaginationDTO<MESBasicProdLevel>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品等级设置表id分获取物品等级设置表数据
	 * 
	 * @param 物品等级设置表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdLevel(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicProdLevel prodLevel = prodLevelService.getProdLevel(id);
			if(prodLevel == null){
				return set404Error(result);
			}
			setSuccessResult(result, prodLevel);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品等级设置表业务id修改物品等级设置表数据
	 * 
	 * @param 物品等级设置表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProdLevel(
		@WebParam(name="prodLevel")MESBasicProdLevel prodLevel,
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
			if(!beforeUpdateProdLevel(prodLevel)){
				return set404Error(result);
			}
			prodLevelService.saveProdLevel(prodLevel, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增物品等级设置表
	 * 
	 * @param 物品等级设置表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProdLevel(
		@WebParam(name="prodLevel")MESBasicProdLevel prodLevel,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(prodLevel == null){
				return set500Error(result, "物品等级设置表对象不能为空。");
			}
			if(prodLevel.getId() != null){
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
				checkProdLevelData(prodLevel);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			MESBasicProduct tempProduct = prodLevel.getProductID();
			if (tempProduct == null) {
				return set500Error(result, "物品对象不能为空");
			}
			
			MESBasicProduct product = null;
			if(tempProduct.getId()!= null){
				product = productService.getProduct(tempProduct.getId());
			}else if(tempProduct.getProductCode() != null){
				product = productService.loadProductByBussinessKey(tempProduct.getProductCode());
			}else{
				return set500Error(result, "物品对象必须设置id或业务主键。");
			}
			
			if(product == null){
				return set404Error(result);
			}
			prodLevel.setProductID(product);
			
			prodLevelService.saveProdLevel(prodLevel, null);
			Long prodLevelId = prodLevel.getId();
			setSuccessResult(result, prodLevelId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品等级设置表id 删除物品等级设置表
	 * 
	 * @param 物品等级设置表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProdLevel(
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
			
			MESBasicProdLevel prodLevel = null;
			try{
				prodLevel = prodLevelService.getProdLevel(id);
			}catch(NullPointerException e){}
			if(prodLevel == null  || !prodLevel.isValid()){
				return set404Error(result);
			}
			prodLevelService.deleteProdLevel(prodLevel);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改物品等级设置表数据，物品等级设置表id不能为空
	 *
	 * @param 物品等级设置表列表，每个物品等级设置表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProdLevel(
		@WebParam(name="prodLevelList")List<MESBasicProdLevel> prodLevelList,
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
			for(MESBasicProdLevel prodLevel : prodLevelList){
				try{
					if(!beforeUpdateProdLevel(prodLevel)){
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
			
			prodLevelService.batchImportBaseProdLevel(prodLevelList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增物品等级设置表数据
	 * 
	 * @param 物品等级设置表列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProdLevel(
		@WebParam(name="prodLevelList")List<MESBasicProdLevel> prodLevelList,
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
			
			if(prodLevelList == null){
				set500Error(result, "prodLevelList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicProdLevel prodLevel : prodLevelList){
				if(prodLevel.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(prodLevel.getProductID() == null){
						set500Error(result, "第"+count+"条数据出错：物品对象不能为空。");
						return result;
					}
					MESBasicProduct product = getProduct(prodLevel.getProductID());
					if(product == null){
						set500Error(result, "第"+count+"条数据出错：物品对象不存在。");
						return result;
					}
					prodLevel.setProductID(product);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkProdLevelData(prodLevel);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			prodLevelService.batchImportBaseProdLevel(prodLevelList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicProdLevel prodLevel : prodLevelList){
				idList.add(prodLevel.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品等级设置表id，批量删除物品等级设置表数据
	 * 
	 * @param 物品等级设置表id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProdLevel(
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
			
			List<MESBasicProdLevel> prodLevelList = new ArrayList<MESBasicProdLevel>();
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
				
				MESBasicProdLevel prodLevel = prodLevelService.getProdLevel(id);
				if(prodLevel == null || !prodLevel.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				prodLevelList.add(prodLevel);
				
				count ++;
			}
			for(MESBasicProdLevel prodLevel : prodLevelList){
				prodLevelService.deleteProdLevel(prodLevel);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有物品等级设置表数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProdLevelPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicProdLevel.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicProdLevel.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicProdLevel.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicProdLevel> page = new Page<MESBasicProdLevel>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicProdLevel> datas = prodLevelService.getByPage(page, detachedCriteria);
			List<MESBasicProdLevel> prodLevelList = datas.getResult();
			if (prodLevelList == null || prodLevelList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(prodLevelList.toArray());
			PaginationDTO<MESBasicProdLevel> pagination = new PaginationDTO<MESBasicProdLevel>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到物品等级设置表则返回空。
	 * @param prodLevel
	 * @return
	 */
	private MESBasicProdLevel getProdLevel(MESBasicProdLevel prodLevel) {
		if (prodLevel.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicProdLevel result = prodLevelService.getProdLevel(prodLevel.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果物品等级设置表不存在，返回false；如果原来没有物品对象，且修改的时候也没有配置物品对象，则报错；如果配置的物品对象不存在，则报错；
	 * @param prodLevel
	 * @return 
	 */
	private boolean beforeUpdateProdLevel(MESBasicProdLevel prodLevel){
		if(prodLevel.getClevel() == null){
			throw new RuntimeException("clevel不能为空。");
		}
		if(prodLevel.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicProdLevel temp = getProdLevel(prodLevel);
		if(temp == null){
			return false;
		}
		MESBasicProduct product = null;
		if (temp.getProductID() == null) {
			if (prodLevel.getProductID() == null || (prodLevel.getProductID().getId() == null && prodLevel.getProductID().getProductCode() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				product = getProduct(prodLevel.getProductID());
				if(product == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (prodLevel.getProductID() == null || (prodLevel.getProductID().getId() == null && prodLevel.getProductID().getProductCode() == null)) {
				product = temp.getProductID();
			} else {
				product = getProduct(prodLevel.getProductID());
				if (product == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		prodLevel.setProductID(product);
		prodLevel.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicProdLevel> clearProdLevelNonMainField(List<MESBasicProdLevel> list){
		 List<MESBasicProdLevel> prodLevelList = new ArrayList<MESBasicProdLevel>();
		 for(MESBasicProdLevel prodLevel:list){
			 MESBasicProdLevel temp = new MESBasicProdLevel();
			 temp.setId(prodLevel.getId());
		 	 prodLevelList.add(temp);
		 }
		 return prodLevelList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProdLevelData(MESBasicProdLevel prodLevel){
		 if(prodLevel.getClevel() == null){
		 	throw new RuntimeException("clevel不能为空。");
		 }
	}
	 
	//------------------------------------辅模型 WS  物品属性参照-------------------------------------------------
	//--hasLink:true---link:Productid
	/**
	 * 根据物品属性参照业务主键分页查询物品属性参照数据
	 * 
	 * @param 物品属性参照业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCprodAttPageByProductBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicCprodAtt.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicCprodAtt.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicCprodAtt.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicCprodAtt.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicCprodAtt.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			MESBasicProduct product = productService.loadProductByBussinessKey(businessKey);
			if (product == null) {
				return set500Error(result, "该业务主键的物品不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("productid",product));
			Page<MESBasicCprodAtt> page = new Page<MESBasicCprodAtt>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicCprodAtt> datas = cprodAttService.getByPage(page, detachedCriteria);
			List<MESBasicCprodAtt> cprodAttList = datas.getResult();
			if (cprodAttList == null || cprodAttList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(cprodAttList.toArray());
			PaginationDTO<MESBasicCprodAtt> pagination = new PaginationDTO<MESBasicCprodAtt>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品属性参照id分页查询物品属性参照数据
	 * 
	 * @param 物品属性参照id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCprodAttPageByProductPk(	
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicCprodAtt.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), MESBasicCprodAtt.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicCprodAtt.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicCprodAtt.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicCprodAtt.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			MESBasicProduct product = productService.getProduct(id);
			if (product == null) {
				return set500Error(result, "该主键的物品不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("productid",product));
			Page<MESBasicCprodAtt> page = new Page<MESBasicCprodAtt>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicCprodAtt> datas = cprodAttService.getByPage(page, detachedCriteria);
			List<MESBasicCprodAtt> cprodAttList = datas.getResult();
			if (cprodAttList == null || cprodAttList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(cprodAttList.toArray());
			PaginationDTO<MESBasicCprodAtt> pagination = new PaginationDTO<MESBasicCprodAtt>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品属性参照id分获取物品属性参照数据
	 * 
	 * @param 物品属性参照id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCprodAtt(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			MESBasicCprodAtt cprodAtt = cprodAttService.getCprodAtt(id);
			if(cprodAtt == null){
				return set404Error(result);
			}
			setSuccessResult(result, cprodAtt);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品属性参照业务id修改物品属性参照数据
	 * 
	 * @param 物品属性参照对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateCprodAtt(
		@WebParam(name="cprodAtt")MESBasicCprodAtt cprodAtt,
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
			if(!beforeUpdateCprodAtt(cprodAtt)){
				return set404Error(result);
			}
			cprodAttService.saveCprodAtt(cprodAtt, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增物品属性参照
	 * 
	 * @param 物品属性参照对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addCprodAtt(
		@WebParam(name="cprodAtt")MESBasicCprodAtt cprodAtt,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(cprodAtt == null){
				return set500Error(result, "物品属性参照对象不能为空。");
			}
			if(cprodAtt.getId() != null){
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
				checkCprodAttData(cprodAtt);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			MESBasicProduct tempProduct = cprodAtt.getProductid();
			if (tempProduct == null) {
				return set500Error(result, "物品对象不能为空");
			}
			
			MESBasicProduct product = null;
			if(tempProduct.getId()!= null){
				product = productService.getProduct(tempProduct.getId());
			}else if(tempProduct.getProductCode() != null){
				product = productService.loadProductByBussinessKey(tempProduct.getProductCode());
			}else{
				return set500Error(result, "物品对象必须设置id或业务主键。");
			}
			
			if(product == null){
				return set404Error(result);
			}
			cprodAtt.setProductid(product);
			
			cprodAttService.saveCprodAtt(cprodAtt, null);
			Long cprodAttId = cprodAtt.getId();
			setSuccessResult(result, cprodAttId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品属性参照id 删除物品属性参照
	 * 
	 * @param 物品属性参照id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteCprodAtt(
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
			
			MESBasicCprodAtt cprodAtt = null;
			try{
				cprodAtt = cprodAttService.getCprodAtt(id);
			}catch(NullPointerException e){}
			if(cprodAtt == null  || !cprodAtt.isValid()){
				return set404Error(result);
			}
			cprodAttService.deleteCprodAtt(cprodAtt);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改物品属性参照数据，物品属性参照id不能为空
	 *
	 * @param 物品属性参照列表，每个物品属性参照必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateCprodAtt(
		@WebParam(name="cprodAttList")List<MESBasicCprodAtt> cprodAttList,
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
			for(MESBasicCprodAtt cprodAtt : cprodAttList){
				try{
					if(!beforeUpdateCprodAtt(cprodAtt)){
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
			
			cprodAttService.batchImportBaseCprodAtt(cprodAttList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增物品属性参照数据
	 * 
	 * @param 物品属性参照列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddCprodAtt(
		@WebParam(name="cprodAttList")List<MESBasicCprodAtt> cprodAttList,
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
			
			if(cprodAttList == null){
				set500Error(result, "cprodAttList不能为空。");
				return result;
			}
			
			int count = 1;
			for(MESBasicCprodAtt cprodAtt : cprodAttList){
				if(cprodAtt.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(cprodAtt.getProductid() == null){
						set500Error(result, "第"+count+"条数据出错：物品对象不能为空。");
						return result;
					}
					MESBasicProduct product = getProduct(cprodAtt.getProductid());
					if(product == null){
						set500Error(result, "第"+count+"条数据出错：物品对象不存在。");
						return result;
					}
					cprodAtt.setProductid(product);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkCprodAttData(cprodAtt);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			cprodAttService.batchImportBaseCprodAtt(cprodAttList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(MESBasicCprodAtt cprodAtt : cprodAttList){
				idList.add(cprodAtt.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据物品属性参照id，批量删除物品属性参照数据
	 * 
	 * @param 物品属性参照id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelCprodAtt(
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
			
			List<MESBasicCprodAtt> cprodAttList = new ArrayList<MESBasicCprodAtt>();
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
				
				MESBasicCprodAtt cprodAtt = cprodAttService.getCprodAtt(id);
				if(cprodAtt == null || !cprodAtt.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				cprodAttList.add(cprodAtt);
				
				count ++;
			}
			for(MESBasicCprodAtt cprodAtt : cprodAttList){
				cprodAttService.deleteCprodAtt(cprodAtt);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有物品属性参照数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCprodAttPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MESBasicCprodAtt.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), MESBasicCprodAtt.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MESBasicCprodAtt.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MESBasicCprodAtt.class);
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
				detachedCriteria = DetachedCriteria.forClass(MESBasicCprodAtt.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MESBasicCprodAtt> page = new Page<MESBasicCprodAtt>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MESBasicCprodAtt> datas = cprodAttService.getByPage(page, detachedCriteria);
			List<MESBasicCprodAtt> cprodAttList = datas.getResult();
			if (cprodAttList == null || cprodAttList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(cprodAttList.toArray());
			PaginationDTO<MESBasicCprodAtt> pagination = new PaginationDTO<MESBasicCprodAtt>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到物品属性参照则返回空。
	 * @param cprodAtt
	 * @return
	 */
	private MESBasicCprodAtt getCprodAtt(MESBasicCprodAtt cprodAtt) {
		if (cprodAtt.getId() == null)
			throw new RuntimeException("id不能为空");
		MESBasicCprodAtt result = cprodAttService.getCprodAtt(cprodAtt.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果物品属性参照不存在，返回false；如果原来没有物品对象，且修改的时候也没有配置物品对象，则报错；如果配置的物品对象不存在，则报错；
	 * @param cprodAtt
	 * @return 
	 */
	private boolean beforeUpdateCprodAtt(MESBasicCprodAtt cprodAtt){
		if(cprodAtt.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		MESBasicCprodAtt temp = getCprodAtt(cprodAtt);
		if(temp == null){
			return false;
		}
		MESBasicProduct product = null;
		if (temp.getProductid() == null) {
			if (cprodAtt.getProductid() == null || (cprodAtt.getProductid().getId() == null && cprodAtt.getProductid().getProductCode() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				product = getProduct(cprodAtt.getProductid());
				if(product == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (cprodAtt.getProductid() == null || (cprodAtt.getProductid().getId() == null && cprodAtt.getProductid().getProductCode() == null)) {
				product = temp.getProductid();
			} else {
				product = getProduct(cprodAtt.getProductid());
				if (product == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		cprodAtt.setProductid(product);
		cprodAtt.setVersion(temp.getVersion());
		return true;
	}
	
	private List<MESBasicCprodAtt> clearCprodAttNonMainField(List<MESBasicCprodAtt> list){
		 List<MESBasicCprodAtt> cprodAttList = new ArrayList<MESBasicCprodAtt>();
		 for(MESBasicCprodAtt cprodAtt:list){
			 MESBasicCprodAtt temp = new MESBasicCprodAtt();
			 temp.setId(cprodAtt.getId());
		 	 cprodAttList.add(temp);
		 }
		 return cprodAttList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkCprodAttData(MESBasicCprodAtt cprodAtt){
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
	 * 获取物品对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param product
	 * @return
	 */
	private MESBasicProduct getProduct(MESBasicProduct product) {
		if (product.getId() == null && (product.getProductCode() == null || product.getProductCode().toString().trim() == ""))
			throw new RuntimeException("物品对象业务主键和id不能同时为空");
		if (product.getId() != null) {
			MESBasicProduct result = productService.getProduct(product .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return productService.loadProductByBussinessKey(product.getProductCode());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个物品，则返回false，否则返回true
	 * @param product
	 */
	private boolean beforeUpdateProduct(MESBasicProduct product) {
		if(product.getBatch() == null){
			throw new RuntimeException("batch不能为空。");
		}
		if(product.getProductBaseUnit() == null){
			throw new RuntimeException("productBaseUnit不能为空。");
		}
		if(product.getProductBuyUnit() == null){
			throw new RuntimeException("productBuyUnit不能为空。");
		}
		if(product.getProductCostUnit() == null){
			throw new RuntimeException("productCostUnit不能为空。");
		}
		if(product.getSaleUnit() == null){
			throw new RuntimeException("saleUnit不能为空。");
		}
		if(product.getStoreUnit() == null){
			throw new RuntimeException("storeUnit不能为空。");
		}
		if(product.getUnitGroup() == null){
			throw new RuntimeException("unitGroup不能为空。");
		}
		MESBasicProduct temp = getProduct(product);
		if (temp == null) {
			return false;
		}
		if(product.getId() == null){
			product.setId(temp.getId());		
		}
		if(product.getProductCode() == null){
			product.setProductCode(temp.getProductCode());
		}
		
		product.setVersion(temp.getVersion());
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
	 * 清除物品对象下所有辅模型对象中的物品对象
	 * @param product
	 */
	private void clearCircle(MESBasicProduct product) {
		if (product.getProdResetDailyList() != null && product.getProdResetDailyList().size() > 0) {
			for (MESBasicProdResetDaily prodResetDaily : product.getProdResetDailyList()) {
				prodResetDaily.setProductID(null);
			}
		}
		if (product.getProdLevelList() != null && product.getProdLevelList().size() > 0) {
			for (MESBasicProdLevel prodLevel : product.getProdLevelList()) {
				prodLevel.setProductID(null);
			}
		}
		if (product.getCprodAttList() != null && product.getCprodAttList().size() > 0) {
			for (MESBasicCprodAtt cprodAtt : product.getCprodAttList()) {
				cprodAtt.setProductid(null);
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
	private void checkProductData(MESBasicProduct product){
		 if(product.getBatch() == null){
		 	throw new RuntimeException("batch不能为空。");
		 }
		 if(product.getProductBaseUnit() == null){
		 	throw new RuntimeException("productBaseUnit不能为空。");
		 }
		 if(product.getProductBuyUnit() == null){
		 	throw new RuntimeException("productBuyUnit不能为空。");
		 }
		 if(product.getProductCostUnit() == null){
		 	throw new RuntimeException("productCostUnit不能为空。");
		 }
		 if(product.getSaleUnit() == null){
		 	throw new RuntimeException("saleUnit不能为空。");
		 }
		 if(product.getStoreUnit() == null){
		 	throw new RuntimeException("storeUnit不能为空。");
		 }
		 if(product.getUnitGroup() == null){
		 	throw new RuntimeException("unitGroup不能为空。");
		 }
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}