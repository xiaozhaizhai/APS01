package com.supcon.orchid.WOM.services.impl;
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
import com.supcon.orchid.WOM.entities.WOMActiveExelog;
import com.supcon.orchid.WOM.entities.WOMBatchNumRule;
import com.supcon.orchid.WOM.entities.WOMBatchProdTaskPart;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTask;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderHead;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderPart;
import com.supcon.orchid.WOM.entities.WOMCheckManage;
import com.supcon.orchid.WOM.entities.WOMInspect;
import com.supcon.orchid.WOM.entities.WOMProduceTaskManage;
import com.supcon.orchid.WOM.entities.WOMPutInManage;
import com.supcon.orchid.WOM.entities.WOMTaskReportManage;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialPart;
import com.supcon.orchid.WOM.entities.WOMProActAndBatState;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;
import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
import com.supcon.orchid.WOM.services.WOMPutInMaterialWSService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialPartService;
	
/* CUSTOM CODE START(wsserviceimpl,import,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="WOMPutInMaterial",targetNamespace = "http://ws.supcon.com")
public class WOMPutInMaterialWSServiceImpl implements WOMPutInMaterialWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private WOMPutInMaterialService putInMaterialService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private WOMPutInMaterialPartService putInMaterialPartService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取投料单数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPutInMaterialByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			WOMPutInMaterial putInMaterial = putInMaterialService.loadPutInMaterialByBussinessKey(businessKey);
			if(putInMaterial == null){
				return set404Error(result);
			}
			//添加辅模型
			List<WOMPutInMaterialPart> putInMaterialPartList = clearPutInMaterialPartNonMainField(putInMaterialService.getPutInMaterialPartList(putInMaterial));
			putInMaterial.setPutInMaterialPartList(putInMaterialPartList);
			
			setSuccessResult(result, putInMaterial);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取投料单数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPutInMaterialByPk(
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
			
			WOMPutInMaterial putInMaterial = putInMaterialService.getPutInMaterial(id);
			if(putInMaterial == null || !putInMaterial.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<WOMPutInMaterialPart> putInMaterialPartList = clearPutInMaterialPartNonMainField(putInMaterialService.getPutInMaterialPartList(putInMaterial));
			putInMaterial.setPutInMaterialPartList(putInMaterialPartList);
			setSuccessResult(result, putInMaterial);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改投料单数据
	 * @param 投料单对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updatePutInMaterial(
		@WebParam(name="putInMaterial")WOMPutInMaterial putInMaterial,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(putInMaterial == null){
				return set500Error(result, "投料单不能为空。");
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
			
			if(!beforeUpdatePutInMaterial(putInMaterial)){
				return set404Error(result);
			}
			putInMaterialService.saveSuperEditPutInMaterial(putInMaterial, null, null, null, null, null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addPutInMaterial(
		@WebParam(name="putInMaterial")WOMPutInMaterial putInMaterial,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(putInMaterial == null){
				return set500Error(result, "投料单不能为空。");
			}
		
			if(putInMaterial.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(putInMaterial.getTableNo() == null){
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
				checkPutInMaterialData(putInMaterial);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			putInMaterialService.saveSuperEditPutInMaterial(putInMaterial, null, null, null);
			setSuccessResult(result, putInMaterial.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deletePutInMaterialByBusinessKey(
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
			WOMPutInMaterial putInMaterial = null;
			try{
				putInMaterial = putInMaterialService.loadPutInMaterialByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(putInMaterial == null){
				return set404Error(result);
			}
			putInMaterialService.deletePutInMaterial(putInMaterial);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deletePutInMaterialByPk(
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
			WOMPutInMaterial putInMaterial = null;
			try{
				putInMaterial = putInMaterialService.getPutInMaterial(id);
			}catch(NullPointerException e){}
			if(putInMaterial == null || !putInMaterial.isValid()){
				return set404Error(result);
			}
			putInMaterialService.deletePutInMaterial(putInMaterial);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddPutInMaterial(
		@WebParam(name="putInMaterialList")List<WOMPutInMaterial> putInMaterialList,
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
			for(WOMPutInMaterial putInMaterial : putInMaterialList){
				if(putInMaterial.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(putInMaterial.getTableNo() == null || putInMaterial.getTableNo().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkPutInMaterialData(putInMaterial);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			putInMaterialService.batchSaveSuperEditPutInMaterial(putInMaterialList, null, null, null);
			for(WOMPutInMaterial putInMaterial : putInMaterialList){
				idList.add(putInMaterial.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdatePutInMaterial(
		@WebParam(name="putInMaterialList")List<WOMPutInMaterial> putInMaterialList,
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
			for(WOMPutInMaterial putInMaterial : putInMaterialList){
				try{
					if(!beforeUpdatePutInMaterial(putInMaterial)){
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
			putInMaterialService.batchSaveSuperEditPutInMaterial(putInMaterialList, null, null, null,null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeletePutInMaterialByPk(
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
				WOMPutInMaterial temp = null;
				try{
					temp = putInMaterialService.getPutInMaterial(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			putInMaterialService.deletePutInMaterial(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeletePutInMaterialByBusinessKey(
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
				WOMPutInMaterial temp = null;
				try{
					temp = putInMaterialService.loadPutInMaterialByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			putInMaterialService.deletePutInMaterial(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPutInMaterialPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterial.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),WOMPutInMaterial.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterial.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMPutInMaterial.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterial.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMPutInMaterial> page = new Page<WOMPutInMaterial>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMPutInMaterial> datas = putInMaterialService.getByPage(page, detachedCriteria);
			List<WOMPutInMaterial> putInMaterialList = datas.getResult();
			if (putInMaterialList == null || putInMaterialList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(putInMaterialList.toArray());
			PaginationDTO<WOMPutInMaterial> pagination = new PaginationDTO<WOMPutInMaterial>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据投料单业务主键查询投料单下所有辅模型
	 * @param 投料单业务主键
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
			WOMPutInMaterial putInMaterial = putInMaterialService.loadPutInMaterialByBussinessKey(businessKey);
			if (putInMaterial == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap putInMaterialPartMap = new SimulationMap();
			putInMaterialPartMap.setName(InternationalResource.get("PutInMaterialPart"));
			putInMaterialPartMap.setList(putInMaterialService.getPutInMaterialPartList(putInMaterial));
			resultList.add(putInMaterialPartMap);
			
			clearCircle(putInMaterial);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据投料单id查询投料单下所有辅模型
	 * 
	 * @param 投料单id
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
			WOMPutInMaterial putInMaterial = putInMaterialService.getPutInMaterial(id);
			if (putInMaterial == null || !putInMaterial.isValid()) {
				result.setErrorMessage("找不到投料单");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap putInMaterialPartMap = new SimulationMap();
			putInMaterialPartMap.setName(InternationalResource.get("PutInMaterialPart"));
			putInMaterialPartMap.setList(putInMaterialService.getPutInMaterialPartList(putInMaterial));
			resultList.add(putInMaterialPartMap);
			
			clearCircle(putInMaterial);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  投料记录-------------------------------------------------
	//--hasLink:true---link:HeadId
	/**
	 * 根据投料记录业务主键分页查询投料记录数据
	 * 
	 * @param 投料记录业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPutInMaterialPartPageByPutInMaterialBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterialPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMPutInMaterialPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterialPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMPutInMaterialPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterialPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			WOMPutInMaterial putInMaterial = putInMaterialService.loadPutInMaterialByBussinessKey(businessKey);
			if (putInMaterial == null) {
				return set500Error(result, "该业务主键的投料单不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("headId",putInMaterial));
			Page<WOMPutInMaterialPart> page = new Page<WOMPutInMaterialPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMPutInMaterialPart> datas = putInMaterialPartService.getByPage(page, detachedCriteria);
			List<WOMPutInMaterialPart> putInMaterialPartList = datas.getResult();
			if (putInMaterialPartList == null || putInMaterialPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(putInMaterialPartList.toArray());
			PaginationDTO<WOMPutInMaterialPart> pagination = new PaginationDTO<WOMPutInMaterialPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据投料记录id分页查询投料记录数据
	 * 
	 * @param 投料记录id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPutInMaterialPartPageByPutInMaterialPk(	
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
				detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterialPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), WOMPutInMaterialPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterialPart.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMPutInMaterialPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterialPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			WOMPutInMaterial putInMaterial = putInMaterialService.getPutInMaterial(id);
			if (putInMaterial == null) {
				return set500Error(result, "该主键的投料单不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("headId",putInMaterial));
			Page<WOMPutInMaterialPart> page = new Page<WOMPutInMaterialPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMPutInMaterialPart> datas = putInMaterialPartService.getByPage(page, detachedCriteria);
			List<WOMPutInMaterialPart> putInMaterialPartList = datas.getResult();
			if (putInMaterialPartList == null || putInMaterialPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(putInMaterialPartList.toArray());
			PaginationDTO<WOMPutInMaterialPart> pagination = new PaginationDTO<WOMPutInMaterialPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据投料记录id分获取投料记录数据
	 * 
	 * @param 投料记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPutInMaterialPart(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMPutInMaterialPart putInMaterialPart = putInMaterialPartService.getPutInMaterialPart(id);
			if(putInMaterialPart == null){
				return set404Error(result);
			}
			setSuccessResult(result, putInMaterialPart);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据投料记录业务id修改投料记录数据
	 * 
	 * @param 投料记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updatePutInMaterialPart(
		@WebParam(name="putInMaterialPart")WOMPutInMaterialPart putInMaterialPart,
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
			if(!beforeUpdatePutInMaterialPart(putInMaterialPart)){
				return set404Error(result);
			}
			putInMaterialPartService.savePutInMaterialPart(putInMaterialPart, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增投料记录
	 * 
	 * @param 投料记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addPutInMaterialPart(
		@WebParam(name="putInMaterialPart")WOMPutInMaterialPart putInMaterialPart,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(putInMaterialPart == null){
				return set500Error(result, "投料记录对象不能为空。");
			}
			if(putInMaterialPart.getId() != null){
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
				checkPutInMaterialPartData(putInMaterialPart);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			WOMPutInMaterial tempPutInMaterial = putInMaterialPart.getHeadId();
			if (tempPutInMaterial == null) {
				return set500Error(result, "投料单对象不能为空");
			}
			
			WOMPutInMaterial putInMaterial = null;
			if(tempPutInMaterial.getId()!= null){
				putInMaterial = putInMaterialService.getPutInMaterial(tempPutInMaterial.getId());
			}else if(tempPutInMaterial.getTableNo() != null){
				putInMaterial = putInMaterialService.loadPutInMaterialByBussinessKey(tempPutInMaterial.getTableNo());
			}else{
				return set500Error(result, "投料单对象必须设置id或业务主键。");
			}
			
			if(putInMaterial == null){
				return set404Error(result);
			}
			putInMaterialPart.setTableInfoId(putInMaterial.getTableInfoId());
			putInMaterialPart.setHeadId(putInMaterial);
			
			putInMaterialPartService.savePutInMaterialPart(putInMaterialPart, null);
			Long putInMaterialPartId = putInMaterialPart.getId();
			setSuccessResult(result, putInMaterialPartId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据投料记录id 删除投料记录
	 * 
	 * @param 投料记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deletePutInMaterialPart(
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
			
			WOMPutInMaterialPart putInMaterialPart = null;
			try{
				putInMaterialPart = putInMaterialPartService.getPutInMaterialPart(id);
			}catch(NullPointerException e){}
			if(putInMaterialPart == null  || !putInMaterialPart.isValid()){
				return set404Error(result);
			}
			putInMaterialPartService.deletePutInMaterialPart(putInMaterialPart);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改投料记录数据，投料记录id不能为空
	 *
	 * @param 投料记录列表，每个投料记录必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdatePutInMaterialPart(
		@WebParam(name="putInMaterialPartList")List<WOMPutInMaterialPart> putInMaterialPartList,
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
			for(WOMPutInMaterialPart putInMaterialPart : putInMaterialPartList){
				try{
					if(!beforeUpdatePutInMaterialPart(putInMaterialPart)){
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
			
			putInMaterialPartService.batchImportBasePutInMaterialPart(putInMaterialPartList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增投料记录数据
	 * 
	 * @param 投料记录列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddPutInMaterialPart(
		@WebParam(name="putInMaterialPartList")List<WOMPutInMaterialPart> putInMaterialPartList,
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
			
			if(putInMaterialPartList == null){
				set500Error(result, "putInMaterialPartList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMPutInMaterialPart putInMaterialPart : putInMaterialPartList){
				if(putInMaterialPart.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(putInMaterialPart.getHeadId() == null){
						set500Error(result, "第"+count+"条数据出错：投料单对象不能为空。");
						return result;
					}
					WOMPutInMaterial putInMaterial = getPutInMaterial(putInMaterialPart.getHeadId());
					if(putInMaterial == null){
						set500Error(result, "第"+count+"条数据出错：投料单对象不存在。");
						return result;
					}
					putInMaterialPart.setTableInfoId(putInMaterial.getTableInfoId());
					putInMaterialPart.setHeadId(putInMaterial);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkPutInMaterialPartData(putInMaterialPart);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			putInMaterialPartService.batchImportBasePutInMaterialPart(putInMaterialPartList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMPutInMaterialPart putInMaterialPart : putInMaterialPartList){
				idList.add(putInMaterialPart.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据投料记录id，批量删除投料记录数据
	 * 
	 * @param 投料记录id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelPutInMaterialPart(
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
			
			List<WOMPutInMaterialPart> putInMaterialPartList = new ArrayList<WOMPutInMaterialPart>();
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
				
				WOMPutInMaterialPart putInMaterialPart = putInMaterialPartService.getPutInMaterialPart(id);
				if(putInMaterialPart == null || !putInMaterialPart.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				putInMaterialPartList.add(putInMaterialPart);
				
				count ++;
			}
			for(WOMPutInMaterialPart putInMaterialPart : putInMaterialPartList){
				putInMaterialPartService.deletePutInMaterialPart(putInMaterialPart);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有投料记录数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPutInMaterialPartPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterialPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMPutInMaterialPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterialPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMPutInMaterialPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMPutInMaterialPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMPutInMaterialPart> page = new Page<WOMPutInMaterialPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMPutInMaterialPart> datas = putInMaterialPartService.getByPage(page, detachedCriteria);
			List<WOMPutInMaterialPart> putInMaterialPartList = datas.getResult();
			if (putInMaterialPartList == null || putInMaterialPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(putInMaterialPartList.toArray());
			PaginationDTO<WOMPutInMaterialPart> pagination = new PaginationDTO<WOMPutInMaterialPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到投料记录则返回空。
	 * @param putInMaterialPart
	 * @return
	 */
	private WOMPutInMaterialPart getPutInMaterialPart(WOMPutInMaterialPart putInMaterialPart) {
		if (putInMaterialPart.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMPutInMaterialPart result = putInMaterialPartService.getPutInMaterialPart(putInMaterialPart.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果投料记录不存在，返回false；如果原来没有投料单对象，且修改的时候也没有配置投料单对象，则报错；如果配置的投料单对象不存在，则报错；
	 * @param putInMaterialPart
	 * @return 
	 */
	private boolean beforeUpdatePutInMaterialPart(WOMPutInMaterialPart putInMaterialPart){
		if(putInMaterialPart.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMPutInMaterialPart temp = getPutInMaterialPart(putInMaterialPart);
		if(temp == null){
			return false;
		}
		WOMPutInMaterial putInMaterial = null;
		if (temp.getHeadId() == null) {
			if (putInMaterialPart.getHeadId() == null || (putInMaterialPart.getHeadId().getId() == null && putInMaterialPart.getHeadId().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				putInMaterial = getPutInMaterial(putInMaterialPart.getHeadId());
				if(putInMaterial == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (putInMaterialPart.getHeadId() == null || (putInMaterialPart.getHeadId().getId() == null && putInMaterialPart.getHeadId().getTableNo() == null)) {
				putInMaterial = temp.getHeadId();
			} else {
				putInMaterial = getPutInMaterial(putInMaterialPart.getHeadId());
				if (putInMaterial == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		putInMaterialPart.setTableInfoId(putInMaterial.getTableInfoId());
		
		putInMaterialPart.setHeadId(putInMaterial);
		putInMaterialPart.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMPutInMaterialPart> clearPutInMaterialPartNonMainField(List<WOMPutInMaterialPart> list){
		 List<WOMPutInMaterialPart> putInMaterialPartList = new ArrayList<WOMPutInMaterialPart>();
		 for(WOMPutInMaterialPart putInMaterialPart:list){
			 WOMPutInMaterialPart temp = new WOMPutInMaterialPart();
			 temp.setId(putInMaterialPart.getId());
		 	 putInMaterialPartList.add(temp);
		 }
		 return putInMaterialPartList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkPutInMaterialPartData(WOMPutInMaterialPart putInMaterialPart){
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
	 * 获取投料单对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param putInMaterial
	 * @return
	 */
	private WOMPutInMaterial getPutInMaterial(WOMPutInMaterial putInMaterial) {
		if (putInMaterial.getId() == null && (putInMaterial.getTableNo() == null || putInMaterial.getTableNo().toString().trim() == ""))
			throw new RuntimeException("投料单对象业务主键和id不能同时为空");
		if (putInMaterial.getId() != null) {
			WOMPutInMaterial result = putInMaterialService.getPutInMaterial(putInMaterial .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return putInMaterialService.loadPutInMaterialByBussinessKey(putInMaterial.getTableNo());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个投料单，则返回false，否则返回true
	 * @param putInMaterial
	 */
	private boolean beforeUpdatePutInMaterial(WOMPutInMaterial putInMaterial) {
		putInMaterial.setStatus(99);
		if(putInMaterial.getTableInfoId() == null){
			throw new RuntimeException("tableInfoId不能为空。");
		}
		WOMPutInMaterial temp = getPutInMaterial(putInMaterial);
		if (temp == null) {
			return false;
		}
		if(putInMaterial.getId() == null){
			putInMaterial.setId(temp.getId());		
		}
		if(putInMaterial.getTableNo() == null){
			putInMaterial.setTableNo(temp.getTableNo());
		}
		
		putInMaterial.setVersion(temp.getVersion());
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
	 * 清除投料单对象下所有辅模型对象中的投料单对象
	 * @param putInMaterial
	 */
	private void clearCircle(WOMPutInMaterial putInMaterial) {
		if (putInMaterial.getPutInMaterialPartList() != null && putInMaterial.getPutInMaterialPartList().size() > 0) {
			for (WOMPutInMaterialPart putInMaterialPart : putInMaterial.getPutInMaterialPartList()) {
				putInMaterialPart.setHeadId(null);
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
	private void checkPutInMaterialData(WOMPutInMaterial putInMaterial){
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}