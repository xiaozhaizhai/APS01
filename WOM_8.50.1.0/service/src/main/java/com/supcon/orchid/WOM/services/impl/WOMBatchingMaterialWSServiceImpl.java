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
import com.supcon.orchid.WOM.services.WOMBatchingMaterialWSService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialPartService;
	
/* CUSTOM CODE START(wsserviceimpl,import,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="WOMBatchingMaterial",targetNamespace = "http://ws.supcon.com")
public class WOMBatchingMaterialWSServiceImpl implements WOMBatchingMaterialWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private WOMBatchingMaterialService batchingMaterialService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private WOMBatchingMaterialPartService batchingMaterialPartService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取配料指令数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			WOMBatchingMaterial batchingMaterial = batchingMaterialService.loadBatchingMaterialByBussinessKey(businessKey);
			if(batchingMaterial == null){
				return set404Error(result);
			}
			//添加辅模型
			List<WOMBatchingMaterialPart> batchingMaterialPartList = clearBatchingMaterialPartNonMainField(batchingMaterialService.getBatchingMaterialPartList(batchingMaterial));
			batchingMaterial.setBatchingMaterialPartList(batchingMaterialPartList);
			
			setSuccessResult(result, batchingMaterial);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取配料指令数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialByPk(
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
			
			WOMBatchingMaterial batchingMaterial = batchingMaterialService.getBatchingMaterial(id);
			if(batchingMaterial == null || !batchingMaterial.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<WOMBatchingMaterialPart> batchingMaterialPartList = clearBatchingMaterialPartNonMainField(batchingMaterialService.getBatchingMaterialPartList(batchingMaterial));
			batchingMaterial.setBatchingMaterialPartList(batchingMaterialPartList);
			setSuccessResult(result, batchingMaterial);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改配料指令数据
	 * @param 配料指令对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateBatchingMaterial(
		@WebParam(name="batchingMaterial")WOMBatchingMaterial batchingMaterial,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(batchingMaterial == null){
				return set500Error(result, "配料指令不能为空。");
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
			
			if(!beforeUpdateBatchingMaterial(batchingMaterial)){
				return set404Error(result);
			}
			batchingMaterialService.saveSuperEditBatchingMaterial(batchingMaterial, null, null, null, null, null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addBatchingMaterial(
		@WebParam(name="batchingMaterial")WOMBatchingMaterial batchingMaterial,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(batchingMaterial == null){
				return set500Error(result, "配料指令不能为空。");
			}
		
			if(batchingMaterial.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(batchingMaterial.getTableNo() == null){
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
				checkBatchingMaterialData(batchingMaterial);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			batchingMaterialService.saveSuperEditBatchingMaterial(batchingMaterial, null, null, null);
			setSuccessResult(result, batchingMaterial.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteBatchingMaterialByBusinessKey(
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
			WOMBatchingMaterial batchingMaterial = null;
			try{
				batchingMaterial = batchingMaterialService.loadBatchingMaterialByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(batchingMaterial == null){
				return set404Error(result);
			}
			batchingMaterialService.deleteBatchingMaterial(batchingMaterial);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteBatchingMaterialByPk(
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
			WOMBatchingMaterial batchingMaterial = null;
			try{
				batchingMaterial = batchingMaterialService.getBatchingMaterial(id);
			}catch(NullPointerException e){}
			if(batchingMaterial == null || !batchingMaterial.isValid()){
				return set404Error(result);
			}
			batchingMaterialService.deleteBatchingMaterial(batchingMaterial);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddBatchingMaterial(
		@WebParam(name="batchingMaterialList")List<WOMBatchingMaterial> batchingMaterialList,
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
			for(WOMBatchingMaterial batchingMaterial : batchingMaterialList){
				if(batchingMaterial.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(batchingMaterial.getTableNo() == null || batchingMaterial.getTableNo().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkBatchingMaterialData(batchingMaterial);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			batchingMaterialService.batchSaveSuperEditBatchingMaterial(batchingMaterialList, null, null, null);
			for(WOMBatchingMaterial batchingMaterial : batchingMaterialList){
				idList.add(batchingMaterial.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateBatchingMaterial(
		@WebParam(name="batchingMaterialList")List<WOMBatchingMaterial> batchingMaterialList,
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
			for(WOMBatchingMaterial batchingMaterial : batchingMaterialList){
				try{
					if(!beforeUpdateBatchingMaterial(batchingMaterial)){
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
			batchingMaterialService.batchSaveSuperEditBatchingMaterial(batchingMaterialList, null, null, null,null, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteBatchingMaterialByPk(
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
				WOMBatchingMaterial temp = null;
				try{
					temp = batchingMaterialService.getBatchingMaterial(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			batchingMaterialService.deleteBatchingMaterial(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteBatchingMaterialByBusinessKey(
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
				WOMBatchingMaterial temp = null;
				try{
					temp = batchingMaterialService.loadBatchingMaterialByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			batchingMaterialService.deleteBatchingMaterial(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterial.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),WOMBatchingMaterial.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterial.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchingMaterial.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterial.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMBatchingMaterial> page = new Page<WOMBatchingMaterial>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchingMaterial> datas = batchingMaterialService.getByPage(page, detachedCriteria);
			List<WOMBatchingMaterial> batchingMaterialList = datas.getResult();
			if (batchingMaterialList == null || batchingMaterialList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchingMaterialList.toArray());
			PaginationDTO<WOMBatchingMaterial> pagination = new PaginationDTO<WOMBatchingMaterial>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据配料指令业务主键查询配料指令下所有辅模型
	 * @param 配料指令业务主键
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
			WOMBatchingMaterial batchingMaterial = batchingMaterialService.loadBatchingMaterialByBussinessKey(businessKey);
			if (batchingMaterial == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap batchingMaterialPartMap = new SimulationMap();
			batchingMaterialPartMap.setName(InternationalResource.get("BatchingMaterialPart"));
			batchingMaterialPartMap.setList(batchingMaterialService.getBatchingMaterialPartList(batchingMaterial));
			resultList.add(batchingMaterialPartMap);
			
			clearCircle(batchingMaterial);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料指令id查询配料指令下所有辅模型
	 * 
	 * @param 配料指令id
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
			WOMBatchingMaterial batchingMaterial = batchingMaterialService.getBatchingMaterial(id);
			if (batchingMaterial == null || !batchingMaterial.isValid()) {
				result.setErrorMessage("找不到配料指令");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap batchingMaterialPartMap = new SimulationMap();
			batchingMaterialPartMap.setName(InternationalResource.get("BatchingMaterialPart"));
			batchingMaterialPartMap.setList(batchingMaterialService.getBatchingMaterialPartList(batchingMaterial));
			resultList.add(batchingMaterialPartMap);
			
			clearCircle(batchingMaterial);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  配料记录-------------------------------------------------
	//--hasLink:true---link:HeadId
	/**
	 * 根据配料记录业务主键分页查询配料记录数据
	 * 
	 * @param 配料记录业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialPartPageByBatchingMaterialBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMBatchingMaterialPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchingMaterialPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			WOMBatchingMaterial batchingMaterial = batchingMaterialService.loadBatchingMaterialByBussinessKey(businessKey);
			if (batchingMaterial == null) {
				return set500Error(result, "该业务主键的配料指令不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("headId",batchingMaterial));
			Page<WOMBatchingMaterialPart> page = new Page<WOMBatchingMaterialPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchingMaterialPart> datas = batchingMaterialPartService.getByPage(page, detachedCriteria);
			List<WOMBatchingMaterialPart> batchingMaterialPartList = datas.getResult();
			if (batchingMaterialPartList == null || batchingMaterialPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchingMaterialPartList.toArray());
			PaginationDTO<WOMBatchingMaterialPart> pagination = new PaginationDTO<WOMBatchingMaterialPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料记录id分页查询配料记录数据
	 * 
	 * @param 配料记录id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialPartPageByBatchingMaterialPk(	
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), WOMBatchingMaterialPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialPart.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchingMaterialPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			WOMBatchingMaterial batchingMaterial = batchingMaterialService.getBatchingMaterial(id);
			if (batchingMaterial == null) {
				return set500Error(result, "该主键的配料指令不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("headId",batchingMaterial));
			Page<WOMBatchingMaterialPart> page = new Page<WOMBatchingMaterialPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchingMaterialPart> datas = batchingMaterialPartService.getByPage(page, detachedCriteria);
			List<WOMBatchingMaterialPart> batchingMaterialPartList = datas.getResult();
			if (batchingMaterialPartList == null || batchingMaterialPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchingMaterialPartList.toArray());
			PaginationDTO<WOMBatchingMaterialPart> pagination = new PaginationDTO<WOMBatchingMaterialPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料记录id分获取配料记录数据
	 * 
	 * @param 配料记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialPart(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMBatchingMaterialPart batchingMaterialPart = batchingMaterialPartService.getBatchingMaterialPart(id);
			if(batchingMaterialPart == null){
				return set404Error(result);
			}
			setSuccessResult(result, batchingMaterialPart);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料记录业务id修改配料记录数据
	 * 
	 * @param 配料记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateBatchingMaterialPart(
		@WebParam(name="batchingMaterialPart")WOMBatchingMaterialPart batchingMaterialPart,
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
			if(!beforeUpdateBatchingMaterialPart(batchingMaterialPart)){
				return set404Error(result);
			}
			batchingMaterialPartService.saveBatchingMaterialPart(batchingMaterialPart, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增配料记录
	 * 
	 * @param 配料记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addBatchingMaterialPart(
		@WebParam(name="batchingMaterialPart")WOMBatchingMaterialPart batchingMaterialPart,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(batchingMaterialPart == null){
				return set500Error(result, "配料记录对象不能为空。");
			}
			if(batchingMaterialPart.getId() != null){
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
				checkBatchingMaterialPartData(batchingMaterialPart);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			WOMBatchingMaterial tempBatchingMaterial = batchingMaterialPart.getHeadId();
			if (tempBatchingMaterial == null) {
				return set500Error(result, "配料指令对象不能为空");
			}
			
			WOMBatchingMaterial batchingMaterial = null;
			if(tempBatchingMaterial.getId()!= null){
				batchingMaterial = batchingMaterialService.getBatchingMaterial(tempBatchingMaterial.getId());
			}else if(tempBatchingMaterial.getTableNo() != null){
				batchingMaterial = batchingMaterialService.loadBatchingMaterialByBussinessKey(tempBatchingMaterial.getTableNo());
			}else{
				return set500Error(result, "配料指令对象必须设置id或业务主键。");
			}
			
			if(batchingMaterial == null){
				return set404Error(result);
			}
			batchingMaterialPart.setTableInfoId(batchingMaterial.getTableInfoId());
			batchingMaterialPart.setHeadId(batchingMaterial);
			
			batchingMaterialPartService.saveBatchingMaterialPart(batchingMaterialPart, null);
			Long batchingMaterialPartId = batchingMaterialPart.getId();
			setSuccessResult(result, batchingMaterialPartId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料记录id 删除配料记录
	 * 
	 * @param 配料记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteBatchingMaterialPart(
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
			
			WOMBatchingMaterialPart batchingMaterialPart = null;
			try{
				batchingMaterialPart = batchingMaterialPartService.getBatchingMaterialPart(id);
			}catch(NullPointerException e){}
			if(batchingMaterialPart == null  || !batchingMaterialPart.isValid()){
				return set404Error(result);
			}
			batchingMaterialPartService.deleteBatchingMaterialPart(batchingMaterialPart);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改配料记录数据，配料记录id不能为空
	 *
	 * @param 配料记录列表，每个配料记录必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateBatchingMaterialPart(
		@WebParam(name="batchingMaterialPartList")List<WOMBatchingMaterialPart> batchingMaterialPartList,
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
			for(WOMBatchingMaterialPart batchingMaterialPart : batchingMaterialPartList){
				try{
					if(!beforeUpdateBatchingMaterialPart(batchingMaterialPart)){
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
			
			batchingMaterialPartService.batchImportBaseBatchingMaterialPart(batchingMaterialPartList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增配料记录数据
	 * 
	 * @param 配料记录列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddBatchingMaterialPart(
		@WebParam(name="batchingMaterialPartList")List<WOMBatchingMaterialPart> batchingMaterialPartList,
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
			
			if(batchingMaterialPartList == null){
				set500Error(result, "batchingMaterialPartList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMBatchingMaterialPart batchingMaterialPart : batchingMaterialPartList){
				if(batchingMaterialPart.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(batchingMaterialPart.getHeadId() == null){
						set500Error(result, "第"+count+"条数据出错：配料指令对象不能为空。");
						return result;
					}
					WOMBatchingMaterial batchingMaterial = getBatchingMaterial(batchingMaterialPart.getHeadId());
					if(batchingMaterial == null){
						set500Error(result, "第"+count+"条数据出错：配料指令对象不存在。");
						return result;
					}
					batchingMaterialPart.setTableInfoId(batchingMaterial.getTableInfoId());
					batchingMaterialPart.setHeadId(batchingMaterial);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkBatchingMaterialPartData(batchingMaterialPart);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			batchingMaterialPartService.batchImportBaseBatchingMaterialPart(batchingMaterialPartList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMBatchingMaterialPart batchingMaterialPart : batchingMaterialPartList){
				idList.add(batchingMaterialPart.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料记录id，批量删除配料记录数据
	 * 
	 * @param 配料记录id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelBatchingMaterialPart(
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
			
			List<WOMBatchingMaterialPart> batchingMaterialPartList = new ArrayList<WOMBatchingMaterialPart>();
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
				
				WOMBatchingMaterialPart batchingMaterialPart = batchingMaterialPartService.getBatchingMaterialPart(id);
				if(batchingMaterialPart == null || !batchingMaterialPart.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				batchingMaterialPartList.add(batchingMaterialPart);
				
				count ++;
			}
			for(WOMBatchingMaterialPart batchingMaterialPart : batchingMaterialPartList){
				batchingMaterialPartService.deleteBatchingMaterialPart(batchingMaterialPart);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有配料记录数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialPartPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMBatchingMaterialPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchingMaterialPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMBatchingMaterialPart> page = new Page<WOMBatchingMaterialPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchingMaterialPart> datas = batchingMaterialPartService.getByPage(page, detachedCriteria);
			List<WOMBatchingMaterialPart> batchingMaterialPartList = datas.getResult();
			if (batchingMaterialPartList == null || batchingMaterialPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchingMaterialPartList.toArray());
			PaginationDTO<WOMBatchingMaterialPart> pagination = new PaginationDTO<WOMBatchingMaterialPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到配料记录则返回空。
	 * @param batchingMaterialPart
	 * @return
	 */
	private WOMBatchingMaterialPart getBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart) {
		if (batchingMaterialPart.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMBatchingMaterialPart result = batchingMaterialPartService.getBatchingMaterialPart(batchingMaterialPart.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果配料记录不存在，返回false；如果原来没有配料指令对象，且修改的时候也没有配置配料指令对象，则报错；如果配置的配料指令对象不存在，则报错；
	 * @param batchingMaterialPart
	 * @return 
	 */
	private boolean beforeUpdateBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart){
		if(batchingMaterialPart.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMBatchingMaterialPart temp = getBatchingMaterialPart(batchingMaterialPart);
		if(temp == null){
			return false;
		}
		WOMBatchingMaterial batchingMaterial = null;
		if (temp.getHeadId() == null) {
			if (batchingMaterialPart.getHeadId() == null || (batchingMaterialPart.getHeadId().getId() == null && batchingMaterialPart.getHeadId().getTableNo() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				batchingMaterial = getBatchingMaterial(batchingMaterialPart.getHeadId());
				if(batchingMaterial == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (batchingMaterialPart.getHeadId() == null || (batchingMaterialPart.getHeadId().getId() == null && batchingMaterialPart.getHeadId().getTableNo() == null)) {
				batchingMaterial = temp.getHeadId();
			} else {
				batchingMaterial = getBatchingMaterial(batchingMaterialPart.getHeadId());
				if (batchingMaterial == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		batchingMaterialPart.setTableInfoId(batchingMaterial.getTableInfoId());
		
		batchingMaterialPart.setHeadId(batchingMaterial);
		batchingMaterialPart.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMBatchingMaterialPart> clearBatchingMaterialPartNonMainField(List<WOMBatchingMaterialPart> list){
		 List<WOMBatchingMaterialPart> batchingMaterialPartList = new ArrayList<WOMBatchingMaterialPart>();
		 for(WOMBatchingMaterialPart batchingMaterialPart:list){
			 WOMBatchingMaterialPart temp = new WOMBatchingMaterialPart();
			 temp.setId(batchingMaterialPart.getId());
		 	 batchingMaterialPartList.add(temp);
		 }
		 return batchingMaterialPartList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkBatchingMaterialPartData(WOMBatchingMaterialPart batchingMaterialPart){
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
	 * 获取配料指令对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param batchingMaterial
	 * @return
	 */
	private WOMBatchingMaterial getBatchingMaterial(WOMBatchingMaterial batchingMaterial) {
		if (batchingMaterial.getId() == null && (batchingMaterial.getTableNo() == null || batchingMaterial.getTableNo().toString().trim() == ""))
			throw new RuntimeException("配料指令对象业务主键和id不能同时为空");
		if (batchingMaterial.getId() != null) {
			WOMBatchingMaterial result = batchingMaterialService.getBatchingMaterial(batchingMaterial .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return batchingMaterialService.loadBatchingMaterialByBussinessKey(batchingMaterial.getTableNo());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个配料指令，则返回false，否则返回true
	 * @param batchingMaterial
	 */
	private boolean beforeUpdateBatchingMaterial(WOMBatchingMaterial batchingMaterial) {
		batchingMaterial.setStatus(99);
		if(batchingMaterial.getTableInfoId() == null){
			throw new RuntimeException("tableInfoId不能为空。");
		}
		WOMBatchingMaterial temp = getBatchingMaterial(batchingMaterial);
		if (temp == null) {
			return false;
		}
		if(batchingMaterial.getId() == null){
			batchingMaterial.setId(temp.getId());		
		}
		if(batchingMaterial.getTableNo() == null){
			batchingMaterial.setTableNo(temp.getTableNo());
		}
		
		batchingMaterial.setVersion(temp.getVersion());
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
	 * 清除配料指令对象下所有辅模型对象中的配料指令对象
	 * @param batchingMaterial
	 */
	private void clearCircle(WOMBatchingMaterial batchingMaterial) {
		if (batchingMaterial.getBatchingMaterialPartList() != null && batchingMaterial.getBatchingMaterialPartList().size() > 0) {
			for (WOMBatchingMaterialPart batchingMaterialPart : batchingMaterial.getBatchingMaterialPartList()) {
				batchingMaterialPart.setHeadId(null);
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
	private void checkBatchingMaterialData(WOMBatchingMaterial batchingMaterial){
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}