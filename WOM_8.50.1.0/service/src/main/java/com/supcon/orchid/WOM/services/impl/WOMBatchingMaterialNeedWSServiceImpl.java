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
import com.supcon.orchid.WOM.services.WOMBatchingMaterialNeedWSService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialNeedService;
import com.supcon.orchid.WOM.services.WOMMakeBatOrderHeadService;
import com.supcon.orchid.WOM.services.WOMMakeBatOrderPartService;
	
/* CUSTOM CODE START(wsserviceimpl,import,WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="WOMBatchingMaterialNeed",targetNamespace = "http://ws.supcon.com")
public class WOMBatchingMaterialNeedWSServiceImpl implements WOMBatchingMaterialNeedWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private WOMBatchingMaterialNeedService batchingMaterialNeedService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private WOMMakeBatOrderHeadService makeBatOrderHeadService;
	@Resource
	private WOMMakeBatOrderPartService makeBatOrderPartService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取配料需求数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialNeedByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			WOMBatchingMaterialNeed batchingMaterialNeed = batchingMaterialNeedService.loadBatchingMaterialNeedByBussinessKey(businessKey);
			if(batchingMaterialNeed == null){
				return set404Error(result);
			}
			//添加辅模型
			
			setSuccessResult(result, batchingMaterialNeed);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取配料需求数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialNeedByPk(
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
			
			WOMBatchingMaterialNeed batchingMaterialNeed = batchingMaterialNeedService.getBatchingMaterialNeed(id);
			if(batchingMaterialNeed == null || !batchingMaterialNeed.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			setSuccessResult(result, batchingMaterialNeed);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改配料需求数据
	 * @param 配料需求对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateBatchingMaterialNeed(
		@WebParam(name="batchingMaterialNeed")WOMBatchingMaterialNeed batchingMaterialNeed,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(batchingMaterialNeed == null){
				return set500Error(result, "配料需求不能为空。");
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
			
			if(!beforeUpdateBatchingMaterialNeed(batchingMaterialNeed)){
				return set404Error(result);
			}
			batchingMaterialNeedService.saveBatchingMaterialNeed(batchingMaterialNeed, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addBatchingMaterialNeed(
		@WebParam(name="batchingMaterialNeed")WOMBatchingMaterialNeed batchingMaterialNeed,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(batchingMaterialNeed == null){
				return set500Error(result, "配料需求不能为空。");
			}
		
			if(batchingMaterialNeed.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(batchingMaterialNeed.getId() == null){
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
				checkBatchingMaterialNeedData(batchingMaterialNeed);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			batchingMaterialNeedService.saveBatchingMaterialNeed(batchingMaterialNeed, null);
			setSuccessResult(result, batchingMaterialNeed.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteBatchingMaterialNeedByBusinessKey(
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
			WOMBatchingMaterialNeed batchingMaterialNeed = null;
			try{
				batchingMaterialNeed = batchingMaterialNeedService.loadBatchingMaterialNeedByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(batchingMaterialNeed == null){
				return set404Error(result);
			}
			batchingMaterialNeedService.deleteBatchingMaterialNeed(batchingMaterialNeed);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteBatchingMaterialNeedByPk(
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
			WOMBatchingMaterialNeed batchingMaterialNeed = null;
			try{
				batchingMaterialNeed = batchingMaterialNeedService.getBatchingMaterialNeed(id);
			}catch(NullPointerException e){}
			if(batchingMaterialNeed == null || !batchingMaterialNeed.isValid()){
				return set404Error(result);
			}
			batchingMaterialNeedService.deleteBatchingMaterialNeed(batchingMaterialNeed);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddBatchingMaterialNeed(
		@WebParam(name="batchingMaterialNeedList")List<WOMBatchingMaterialNeed> batchingMaterialNeedList,
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
			for(WOMBatchingMaterialNeed batchingMaterialNeed : batchingMaterialNeedList){
				if(batchingMaterialNeed.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(batchingMaterialNeed.getId() == null || batchingMaterialNeed.getId().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkBatchingMaterialNeedData(batchingMaterialNeed);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			batchingMaterialNeedService.batchImportBaseBatchingMaterialNeed(batchingMaterialNeedList);
			for(WOMBatchingMaterialNeed batchingMaterialNeed : batchingMaterialNeedList){
				idList.add(batchingMaterialNeed.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateBatchingMaterialNeed(
		@WebParam(name="batchingMaterialNeedList")List<WOMBatchingMaterialNeed> batchingMaterialNeedList,
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
			for(WOMBatchingMaterialNeed batchingMaterialNeed : batchingMaterialNeedList){
				try{
					if(!beforeUpdateBatchingMaterialNeed(batchingMaterialNeed)){
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
			batchingMaterialNeedService.batchImportBaseBatchingMaterialNeed(batchingMaterialNeedList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteBatchingMaterialNeedByPk(
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
				WOMBatchingMaterialNeed temp = null;
				try{
					temp = batchingMaterialNeedService.getBatchingMaterialNeed(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			batchingMaterialNeedService.deleteBatchingMaterialNeed(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteBatchingMaterialNeedByBusinessKey(
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
				WOMBatchingMaterialNeed temp = null;
				try{
					temp = batchingMaterialNeedService.loadBatchingMaterialNeedByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			batchingMaterialNeedService.deleteBatchingMaterialNeed(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getBatchingMaterialNeedPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialNeed.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),WOMBatchingMaterialNeed.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialNeed.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMBatchingMaterialNeed.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMBatchingMaterialNeed.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMBatchingMaterialNeed> page = new Page<WOMBatchingMaterialNeed>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMBatchingMaterialNeed> datas = batchingMaterialNeedService.getByPage(page, detachedCriteria);
			List<WOMBatchingMaterialNeed> batchingMaterialNeedList = datas.getResult();
			if (batchingMaterialNeedList == null || batchingMaterialNeedList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(batchingMaterialNeedList.toArray());
			PaginationDTO<WOMBatchingMaterialNeed> pagination = new PaginationDTO<WOMBatchingMaterialNeed>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据配料需求业务主键查询配料需求下所有辅模型
	 * @param 配料需求业务主键
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
			WOMBatchingMaterialNeed batchingMaterialNeed = batchingMaterialNeedService.loadBatchingMaterialNeedByBussinessKey(businessKey);
			if (batchingMaterialNeed == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(batchingMaterialNeed);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据配料需求id查询配料需求下所有辅模型
	 * 
	 * @param 配料需求id
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
			WOMBatchingMaterialNeed batchingMaterialNeed = batchingMaterialNeedService.getBatchingMaterialNeed(id);
			if (batchingMaterialNeed == null || !batchingMaterialNeed.isValid()) {
				result.setErrorMessage("找不到配料需求");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(batchingMaterialNeed);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  创建配料指令表头-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据创建配料指令表头业务主键分页查询创建配料指令表头数据
	 * 
	 * @param 创建配料指令表头业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMakeBatOrderHeadPageByBatchingMaterialNeedBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "创建配料指令表头跟配料需求没有设置关联！");
	}
	/**
	 * 根据创建配料指令表头id分页查询创建配料指令表头数据
	 * 
	 * @param 创建配料指令表头id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMakeBatOrderHeadPageByBatchingMaterialNeedPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "创建配料指令表头跟配料需求没有设置关联！");
	}
	/**
	 * 根据创建配料指令表头id分获取创建配料指令表头数据
	 * 
	 * @param 创建配料指令表头id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMakeBatOrderHead(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMMakeBatOrderHead makeBatOrderHead = makeBatOrderHeadService.getMakeBatOrderHead(id);
			if(makeBatOrderHead == null){
				return set404Error(result);
			}
			setSuccessResult(result, makeBatOrderHead);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据创建配料指令表头业务id修改创建配料指令表头数据
	 * 
	 * @param 创建配料指令表头对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateMakeBatOrderHead(
		@WebParam(name="makeBatOrderHead")WOMMakeBatOrderHead makeBatOrderHead,
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
			if(!beforeUpdateMakeBatOrderHead(makeBatOrderHead)){
				return set404Error(result);
			}
			makeBatOrderHeadService.saveMakeBatOrderHead(makeBatOrderHead, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增创建配料指令表头
	 * 
	 * @param 创建配料指令表头对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addMakeBatOrderHead(
		@WebParam(name="makeBatOrderHead")WOMMakeBatOrderHead makeBatOrderHead,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(makeBatOrderHead == null){
				return set500Error(result, "创建配料指令表头对象不能为空。");
			}
			if(makeBatOrderHead.getId() != null){
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
				checkMakeBatOrderHeadData(makeBatOrderHead);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			makeBatOrderHeadService.saveMakeBatOrderHead(makeBatOrderHead, null);
			Long makeBatOrderHeadId = makeBatOrderHead.getId();
			setSuccessResult(result, makeBatOrderHeadId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据创建配料指令表头id 删除创建配料指令表头
	 * 
	 * @param 创建配料指令表头id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteMakeBatOrderHead(
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
			
			WOMMakeBatOrderHead makeBatOrderHead = null;
			try{
				makeBatOrderHead = makeBatOrderHeadService.getMakeBatOrderHead(id);
			}catch(NullPointerException e){}
			if(makeBatOrderHead == null  || !makeBatOrderHead.isValid()){
				return set404Error(result);
			}
			makeBatOrderHeadService.deleteMakeBatOrderHead(makeBatOrderHead);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改创建配料指令表头数据，创建配料指令表头id不能为空
	 *
	 * @param 创建配料指令表头列表，每个创建配料指令表头必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateMakeBatOrderHead(
		@WebParam(name="makeBatOrderHeadList")List<WOMMakeBatOrderHead> makeBatOrderHeadList,
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
			for(WOMMakeBatOrderHead makeBatOrderHead : makeBatOrderHeadList){
				try{
					if(!beforeUpdateMakeBatOrderHead(makeBatOrderHead)){
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
			
			makeBatOrderHeadService.batchImportBaseMakeBatOrderHead(makeBatOrderHeadList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增创建配料指令表头数据
	 * 
	 * @param 创建配料指令表头列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddMakeBatOrderHead(
		@WebParam(name="makeBatOrderHeadList")List<WOMMakeBatOrderHead> makeBatOrderHeadList,
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
			
			if(makeBatOrderHeadList == null){
				set500Error(result, "makeBatOrderHeadList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMMakeBatOrderHead makeBatOrderHead : makeBatOrderHeadList){
				if(makeBatOrderHead.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkMakeBatOrderHeadData(makeBatOrderHead);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			makeBatOrderHeadService.batchImportBaseMakeBatOrderHead(makeBatOrderHeadList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMMakeBatOrderHead makeBatOrderHead : makeBatOrderHeadList){
				idList.add(makeBatOrderHead.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据创建配料指令表头id，批量删除创建配料指令表头数据
	 * 
	 * @param 创建配料指令表头id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelMakeBatOrderHead(
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
			
			List<WOMMakeBatOrderHead> makeBatOrderHeadList = new ArrayList<WOMMakeBatOrderHead>();
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
				
				WOMMakeBatOrderHead makeBatOrderHead = makeBatOrderHeadService.getMakeBatOrderHead(id);
				if(makeBatOrderHead == null || !makeBatOrderHead.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				makeBatOrderHeadList.add(makeBatOrderHead);
				
				count ++;
			}
			for(WOMMakeBatOrderHead makeBatOrderHead : makeBatOrderHeadList){
				makeBatOrderHeadService.deleteMakeBatOrderHead(makeBatOrderHead);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有创建配料指令表头数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMakeBatOrderHeadPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMMakeBatOrderHead.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMMakeBatOrderHead.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMMakeBatOrderHead.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMMakeBatOrderHead.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMMakeBatOrderHead.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMMakeBatOrderHead> page = new Page<WOMMakeBatOrderHead>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMMakeBatOrderHead> datas = makeBatOrderHeadService.getByPage(page, detachedCriteria);
			List<WOMMakeBatOrderHead> makeBatOrderHeadList = datas.getResult();
			if (makeBatOrderHeadList == null || makeBatOrderHeadList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(makeBatOrderHeadList.toArray());
			PaginationDTO<WOMMakeBatOrderHead> pagination = new PaginationDTO<WOMMakeBatOrderHead>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到创建配料指令表头则返回空。
	 * @param makeBatOrderHead
	 * @return
	 */
	private WOMMakeBatOrderHead getMakeBatOrderHead(WOMMakeBatOrderHead makeBatOrderHead) {
		if (makeBatOrderHead.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMMakeBatOrderHead result = makeBatOrderHeadService.getMakeBatOrderHead(makeBatOrderHead.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果创建配料指令表头不存在，返回false；如果原来没有配料需求对象，且修改的时候也没有配置配料需求对象，则报错；如果配置的配料需求对象不存在，则报错；
	 * @param makeBatOrderHead
	 * @return 
	 */
	private boolean beforeUpdateMakeBatOrderHead(WOMMakeBatOrderHead makeBatOrderHead){
		if(makeBatOrderHead.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMMakeBatOrderHead temp = getMakeBatOrderHead(makeBatOrderHead);
		if(temp == null){
			return false;
		}
		makeBatOrderHead.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMMakeBatOrderHead> clearMakeBatOrderHeadNonMainField(List<WOMMakeBatOrderHead> list){
		 List<WOMMakeBatOrderHead> makeBatOrderHeadList = new ArrayList<WOMMakeBatOrderHead>();
		 for(WOMMakeBatOrderHead makeBatOrderHead:list){
			 WOMMakeBatOrderHead temp = new WOMMakeBatOrderHead();
			 temp.setId(makeBatOrderHead.getId());
		 	 makeBatOrderHeadList.add(temp);
		 }
		 return makeBatOrderHeadList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkMakeBatOrderHeadData(WOMMakeBatOrderHead makeBatOrderHead){
	}
	 
	//------------------------------------辅模型 WS  创建配料指令表体-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据创建配料指令表体业务主键分页查询创建配料指令表体数据
	 * 
	 * @param 创建配料指令表体业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMakeBatOrderPartPageByBatchingMaterialNeedBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "创建配料指令表体跟配料需求没有设置关联！");
	}
	/**
	 * 根据创建配料指令表体id分页查询创建配料指令表体数据
	 * 
	 * @param 创建配料指令表体id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMakeBatOrderPartPageByBatchingMaterialNeedPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "创建配料指令表体跟配料需求没有设置关联！");
	}
	/**
	 * 根据创建配料指令表体id分获取创建配料指令表体数据
	 * 
	 * @param 创建配料指令表体id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMakeBatOrderPart(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMMakeBatOrderPart makeBatOrderPart = makeBatOrderPartService.getMakeBatOrderPart(id);
			if(makeBatOrderPart == null){
				return set404Error(result);
			}
			setSuccessResult(result, makeBatOrderPart);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据创建配料指令表体业务id修改创建配料指令表体数据
	 * 
	 * @param 创建配料指令表体对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateMakeBatOrderPart(
		@WebParam(name="makeBatOrderPart")WOMMakeBatOrderPart makeBatOrderPart,
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
			if(!beforeUpdateMakeBatOrderPart(makeBatOrderPart)){
				return set404Error(result);
			}
			makeBatOrderPartService.saveMakeBatOrderPart(makeBatOrderPart, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增创建配料指令表体
	 * 
	 * @param 创建配料指令表体对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addMakeBatOrderPart(
		@WebParam(name="makeBatOrderPart")WOMMakeBatOrderPart makeBatOrderPart,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(makeBatOrderPart == null){
				return set500Error(result, "创建配料指令表体对象不能为空。");
			}
			if(makeBatOrderPart.getId() != null){
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
				checkMakeBatOrderPartData(makeBatOrderPart);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			makeBatOrderPartService.saveMakeBatOrderPart(makeBatOrderPart, null);
			Long makeBatOrderPartId = makeBatOrderPart.getId();
			setSuccessResult(result, makeBatOrderPartId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据创建配料指令表体id 删除创建配料指令表体
	 * 
	 * @param 创建配料指令表体id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteMakeBatOrderPart(
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
			
			WOMMakeBatOrderPart makeBatOrderPart = null;
			try{
				makeBatOrderPart = makeBatOrderPartService.getMakeBatOrderPart(id);
			}catch(NullPointerException e){}
			if(makeBatOrderPart == null  || !makeBatOrderPart.isValid()){
				return set404Error(result);
			}
			makeBatOrderPartService.deleteMakeBatOrderPart(makeBatOrderPart);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改创建配料指令表体数据，创建配料指令表体id不能为空
	 *
	 * @param 创建配料指令表体列表，每个创建配料指令表体必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateMakeBatOrderPart(
		@WebParam(name="makeBatOrderPartList")List<WOMMakeBatOrderPart> makeBatOrderPartList,
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
			for(WOMMakeBatOrderPart makeBatOrderPart : makeBatOrderPartList){
				try{
					if(!beforeUpdateMakeBatOrderPart(makeBatOrderPart)){
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
			
			makeBatOrderPartService.batchImportBaseMakeBatOrderPart(makeBatOrderPartList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增创建配料指令表体数据
	 * 
	 * @param 创建配料指令表体列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddMakeBatOrderPart(
		@WebParam(name="makeBatOrderPartList")List<WOMMakeBatOrderPart> makeBatOrderPartList,
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
			
			if(makeBatOrderPartList == null){
				set500Error(result, "makeBatOrderPartList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMMakeBatOrderPart makeBatOrderPart : makeBatOrderPartList){
				if(makeBatOrderPart.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkMakeBatOrderPartData(makeBatOrderPart);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			makeBatOrderPartService.batchImportBaseMakeBatOrderPart(makeBatOrderPartList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMMakeBatOrderPart makeBatOrderPart : makeBatOrderPartList){
				idList.add(makeBatOrderPart.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据创建配料指令表体id，批量删除创建配料指令表体数据
	 * 
	 * @param 创建配料指令表体id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelMakeBatOrderPart(
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
			
			List<WOMMakeBatOrderPart> makeBatOrderPartList = new ArrayList<WOMMakeBatOrderPart>();
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
				
				WOMMakeBatOrderPart makeBatOrderPart = makeBatOrderPartService.getMakeBatOrderPart(id);
				if(makeBatOrderPart == null || !makeBatOrderPart.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				makeBatOrderPartList.add(makeBatOrderPart);
				
				count ++;
			}
			for(WOMMakeBatOrderPart makeBatOrderPart : makeBatOrderPartList){
				makeBatOrderPartService.deleteMakeBatOrderPart(makeBatOrderPart);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有创建配料指令表体数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMakeBatOrderPartPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMMakeBatOrderPart.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMMakeBatOrderPart.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMMakeBatOrderPart.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMMakeBatOrderPart.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMMakeBatOrderPart.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMMakeBatOrderPart> page = new Page<WOMMakeBatOrderPart>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMMakeBatOrderPart> datas = makeBatOrderPartService.getByPage(page, detachedCriteria);
			List<WOMMakeBatOrderPart> makeBatOrderPartList = datas.getResult();
			if (makeBatOrderPartList == null || makeBatOrderPartList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(makeBatOrderPartList.toArray());
			PaginationDTO<WOMMakeBatOrderPart> pagination = new PaginationDTO<WOMMakeBatOrderPart>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到创建配料指令表体则返回空。
	 * @param makeBatOrderPart
	 * @return
	 */
	private WOMMakeBatOrderPart getMakeBatOrderPart(WOMMakeBatOrderPart makeBatOrderPart) {
		if (makeBatOrderPart.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMMakeBatOrderPart result = makeBatOrderPartService.getMakeBatOrderPart(makeBatOrderPart.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果创建配料指令表体不存在，返回false；如果原来没有配料需求对象，且修改的时候也没有配置配料需求对象，则报错；如果配置的配料需求对象不存在，则报错；
	 * @param makeBatOrderPart
	 * @return 
	 */
	private boolean beforeUpdateMakeBatOrderPart(WOMMakeBatOrderPart makeBatOrderPart){
		if(makeBatOrderPart.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMMakeBatOrderPart temp = getMakeBatOrderPart(makeBatOrderPart);
		if(temp == null){
			return false;
		}
		makeBatOrderPart.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMMakeBatOrderPart> clearMakeBatOrderPartNonMainField(List<WOMMakeBatOrderPart> list){
		 List<WOMMakeBatOrderPart> makeBatOrderPartList = new ArrayList<WOMMakeBatOrderPart>();
		 for(WOMMakeBatOrderPart makeBatOrderPart:list){
			 WOMMakeBatOrderPart temp = new WOMMakeBatOrderPart();
			 temp.setId(makeBatOrderPart.getId());
		 	 makeBatOrderPartList.add(temp);
		 }
		 return makeBatOrderPartList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkMakeBatOrderPartData(WOMMakeBatOrderPart makeBatOrderPart){
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
	 * 获取配料需求对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param batchingMaterialNeed
	 * @return
	 */
	private WOMBatchingMaterialNeed getBatchingMaterialNeed(WOMBatchingMaterialNeed batchingMaterialNeed) {
		if (batchingMaterialNeed.getId() == null && (batchingMaterialNeed.getId() == null || batchingMaterialNeed.getId().toString().trim() == ""))
			throw new RuntimeException("配料需求对象业务主键和id不能同时为空");
		if (batchingMaterialNeed.getId() != null) {
			WOMBatchingMaterialNeed result = batchingMaterialNeedService.getBatchingMaterialNeed(batchingMaterialNeed .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return batchingMaterialNeedService.loadBatchingMaterialNeedByBussinessKey(batchingMaterialNeed.getId());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个配料需求，则返回false，否则返回true
	 * @param batchingMaterialNeed
	 */
	private boolean beforeUpdateBatchingMaterialNeed(WOMBatchingMaterialNeed batchingMaterialNeed) {
		WOMBatchingMaterialNeed temp = getBatchingMaterialNeed(batchingMaterialNeed);
		if (temp == null) {
			return false;
		}
		if(batchingMaterialNeed.getId() == null){
			batchingMaterialNeed.setId(temp.getId());		
		}
		if(batchingMaterialNeed.getId() == null){
			batchingMaterialNeed.setId(temp.getId());
		}
		
		batchingMaterialNeed.setVersion(temp.getVersion());
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
	 * 清除配料需求对象下所有辅模型对象中的配料需求对象
	 * @param batchingMaterialNeed
	 */
	private void clearCircle(WOMBatchingMaterialNeed batchingMaterialNeed) {
	
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
	private void checkBatchingMaterialNeedData(WOMBatchingMaterialNeed batchingMaterialNeed){
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}