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
import com.supcon.orchid.WOM.services.WOMProduceTaskManageWSService;
import com.supcon.orchid.WOM.services.WOMProduceTaskManageService;
import com.supcon.orchid.WOM.services.WOMCheckManageService;
import com.supcon.orchid.WOM.services.WOMInspectService;
import com.supcon.orchid.WOM.services.WOMPutInManageService;
import com.supcon.orchid.WOM.services.WOMTaskReportManageService;
	
/* CUSTOM CODE START(wsserviceimpl,import,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="WOMProduceTaskManage",targetNamespace = "http://ws.supcon.com")
public class WOMProduceTaskManageWSServiceImpl implements WOMProduceTaskManageWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private WOMProduceTaskManageService produceTaskManageService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private WOMCheckManageService checkManageService;
	@Resource
	private WOMInspectService inspectService;
	@Resource
	private WOMPutInManageService putInManageService;
	@Resource
	private WOMTaskReportManageService taskReportManageService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取指令单数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskManageByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			WOMProduceTaskManage produceTaskManage = produceTaskManageService.loadProduceTaskManageByBussinessKey(businessKey);
			if(produceTaskManage == null){
				return set404Error(result);
			}
			//添加辅模型
			
			setSuccessResult(result, produceTaskManage);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取指令单数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskManageByPk(
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
			
			WOMProduceTaskManage produceTaskManage = produceTaskManageService.getProduceTaskManage(id);
			if(produceTaskManage == null || !produceTaskManage.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			setSuccessResult(result, produceTaskManage);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改指令单数据
	 * @param 指令单对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProduceTaskManage(
		@WebParam(name="produceTaskManage")WOMProduceTaskManage produceTaskManage,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(produceTaskManage == null){
				return set500Error(result, "指令单不能为空。");
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
			
			if(!beforeUpdateProduceTaskManage(produceTaskManage)){
				return set404Error(result);
			}
			produceTaskManageService.saveProduceTaskManage(produceTaskManage, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProduceTaskManage(
		@WebParam(name="produceTaskManage")WOMProduceTaskManage produceTaskManage,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(produceTaskManage == null){
				return set500Error(result, "指令单不能为空。");
			}
		
			if(produceTaskManage.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(produceTaskManage.getId() == null){
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
				checkProduceTaskManageData(produceTaskManage);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			produceTaskManageService.saveProduceTaskManage(produceTaskManage, null);
			setSuccessResult(result, produceTaskManage.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskManageByBusinessKey(
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
			WOMProduceTaskManage produceTaskManage = null;
			try{
				produceTaskManage = produceTaskManageService.loadProduceTaskManageByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(produceTaskManage == null){
				return set404Error(result);
			}
			produceTaskManageService.deleteProduceTaskManage(produceTaskManage);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProduceTaskManageByPk(
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
			WOMProduceTaskManage produceTaskManage = null;
			try{
				produceTaskManage = produceTaskManageService.getProduceTaskManage(id);
			}catch(NullPointerException e){}
			if(produceTaskManage == null || !produceTaskManage.isValid()){
				return set404Error(result);
			}
			produceTaskManageService.deleteProduceTaskManage(produceTaskManage);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProduceTaskManage(
		@WebParam(name="produceTaskManageList")List<WOMProduceTaskManage> produceTaskManageList,
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
			for(WOMProduceTaskManage produceTaskManage : produceTaskManageList){
				if(produceTaskManage.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(produceTaskManage.getId() == null || produceTaskManage.getId().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkProduceTaskManageData(produceTaskManage);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			produceTaskManageService.batchImportBaseProduceTaskManage(produceTaskManageList);
			for(WOMProduceTaskManage produceTaskManage : produceTaskManageList){
				idList.add(produceTaskManage.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProduceTaskManage(
		@WebParam(name="produceTaskManageList")List<WOMProduceTaskManage> produceTaskManageList,
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
			for(WOMProduceTaskManage produceTaskManage : produceTaskManageList){
				try{
					if(!beforeUpdateProduceTaskManage(produceTaskManage)){
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
			produceTaskManageService.batchImportBaseProduceTaskManage(produceTaskManageList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteProduceTaskManageByPk(
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
				WOMProduceTaskManage temp = null;
				try{
					temp = produceTaskManageService.getProduceTaskManage(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			produceTaskManageService.deleteProduceTaskManage(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteProduceTaskManageByBusinessKey(
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
				WOMProduceTaskManage temp = null;
				try{
					temp = produceTaskManageService.loadProduceTaskManageByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			produceTaskManageService.deleteProduceTaskManage(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProduceTaskManagePage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskManage.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),WOMProduceTaskManage.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskManage.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMProduceTaskManage.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMProduceTaskManage.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMProduceTaskManage> page = new Page<WOMProduceTaskManage>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMProduceTaskManage> datas = produceTaskManageService.getByPage(page, detachedCriteria);
			List<WOMProduceTaskManage> produceTaskManageList = datas.getResult();
			if (produceTaskManageList == null || produceTaskManageList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(produceTaskManageList.toArray());
			PaginationDTO<WOMProduceTaskManage> pagination = new PaginationDTO<WOMProduceTaskManage>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据指令单业务主键查询指令单下所有辅模型
	 * @param 指令单业务主键
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
			WOMProduceTaskManage produceTaskManage = produceTaskManageService.loadProduceTaskManageByBussinessKey(businessKey);
			if (produceTaskManage == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(produceTaskManage);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据指令单id查询指令单下所有辅模型
	 * 
	 * @param 指令单id
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
			WOMProduceTaskManage produceTaskManage = produceTaskManageService.getProduceTaskManage(id);
			if (produceTaskManage == null || !produceTaskManage.isValid()) {
				result.setErrorMessage("找不到指令单");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(produceTaskManage);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  检验记录业签-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据检验记录业签业务主键分页查询检验记录业签数据
	 * 
	 * @param 检验记录业签业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCheckManagePageByProduceTaskManageBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "检验记录业签跟指令单没有设置关联！");
	}
	/**
	 * 根据检验记录业签id分页查询检验记录业签数据
	 * 
	 * @param 检验记录业签id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCheckManagePageByProduceTaskManagePk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "检验记录业签跟指令单没有设置关联！");
	}
	/**
	 * 根据检验记录业签id分获取检验记录业签数据
	 * 
	 * @param 检验记录业签id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCheckManage(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMCheckManage checkManage = checkManageService.getCheckManage(id);
			if(checkManage == null){
				return set404Error(result);
			}
			setSuccessResult(result, checkManage);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据检验记录业签业务id修改检验记录业签数据
	 * 
	 * @param 检验记录业签对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateCheckManage(
		@WebParam(name="checkManage")WOMCheckManage checkManage,
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
			if(!beforeUpdateCheckManage(checkManage)){
				return set404Error(result);
			}
			checkManageService.saveCheckManage(checkManage, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增检验记录业签
	 * 
	 * @param 检验记录业签对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addCheckManage(
		@WebParam(name="checkManage")WOMCheckManage checkManage,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(checkManage == null){
				return set500Error(result, "检验记录业签对象不能为空。");
			}
			if(checkManage.getId() != null){
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
				checkCheckManageData(checkManage);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			checkManageService.saveCheckManage(checkManage, null);
			Long checkManageId = checkManage.getId();
			setSuccessResult(result, checkManageId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据检验记录业签id 删除检验记录业签
	 * 
	 * @param 检验记录业签id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteCheckManage(
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
			
			WOMCheckManage checkManage = null;
			try{
				checkManage = checkManageService.getCheckManage(id);
			}catch(NullPointerException e){}
			if(checkManage == null  || !checkManage.isValid()){
				return set404Error(result);
			}
			checkManageService.deleteCheckManage(checkManage);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改检验记录业签数据，检验记录业签id不能为空
	 *
	 * @param 检验记录业签列表，每个检验记录业签必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateCheckManage(
		@WebParam(name="checkManageList")List<WOMCheckManage> checkManageList,
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
			for(WOMCheckManage checkManage : checkManageList){
				try{
					if(!beforeUpdateCheckManage(checkManage)){
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
			
			checkManageService.batchImportBaseCheckManage(checkManageList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增检验记录业签数据
	 * 
	 * @param 检验记录业签列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddCheckManage(
		@WebParam(name="checkManageList")List<WOMCheckManage> checkManageList,
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
			
			if(checkManageList == null){
				set500Error(result, "checkManageList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMCheckManage checkManage : checkManageList){
				if(checkManage.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkCheckManageData(checkManage);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			checkManageService.batchImportBaseCheckManage(checkManageList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMCheckManage checkManage : checkManageList){
				idList.add(checkManage.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据检验记录业签id，批量删除检验记录业签数据
	 * 
	 * @param 检验记录业签id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelCheckManage(
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
			
			List<WOMCheckManage> checkManageList = new ArrayList<WOMCheckManage>();
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
				
				WOMCheckManage checkManage = checkManageService.getCheckManage(id);
				if(checkManage == null || !checkManage.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				checkManageList.add(checkManage);
				
				count ++;
			}
			for(WOMCheckManage checkManage : checkManageList){
				checkManageService.deleteCheckManage(checkManage);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有检验记录业签数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getCheckManagePage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMCheckManage.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMCheckManage.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMCheckManage.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMCheckManage.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMCheckManage.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMCheckManage> page = new Page<WOMCheckManage>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMCheckManage> datas = checkManageService.getByPage(page, detachedCriteria);
			List<WOMCheckManage> checkManageList = datas.getResult();
			if (checkManageList == null || checkManageList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(checkManageList.toArray());
			PaginationDTO<WOMCheckManage> pagination = new PaginationDTO<WOMCheckManage>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到检验记录业签则返回空。
	 * @param checkManage
	 * @return
	 */
	private WOMCheckManage getCheckManage(WOMCheckManage checkManage) {
		if (checkManage.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMCheckManage result = checkManageService.getCheckManage(checkManage.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果检验记录业签不存在，返回false；如果原来没有指令单对象，且修改的时候也没有配置指令单对象，则报错；如果配置的指令单对象不存在，则报错；
	 * @param checkManage
	 * @return 
	 */
	private boolean beforeUpdateCheckManage(WOMCheckManage checkManage){
		if(checkManage.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMCheckManage temp = getCheckManage(checkManage);
		if(temp == null){
			return false;
		}
		checkManage.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMCheckManage> clearCheckManageNonMainField(List<WOMCheckManage> list){
		 List<WOMCheckManage> checkManageList = new ArrayList<WOMCheckManage>();
		 for(WOMCheckManage checkManage:list){
			 WOMCheckManage temp = new WOMCheckManage();
			 temp.setId(checkManage.getId());
		 	 checkManageList.add(temp);
		 }
		 return checkManageList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkCheckManageData(WOMCheckManage checkManage){
	}
	 
	//------------------------------------辅模型 WS  请检单-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据请检单业务主键分页查询请检单数据
	 * 
	 * @param 请检单业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getInspectPageByProduceTaskManageBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "请检单跟指令单没有设置关联！");
	}
	/**
	 * 根据请检单id分页查询请检单数据
	 * 
	 * @param 请检单id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getInspectPageByProduceTaskManagePk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "请检单跟指令单没有设置关联！");
	}
	/**
	 * 根据请检单id分获取请检单数据
	 * 
	 * @param 请检单id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getInspect(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMInspect inspect = inspectService.getInspect(id);
			if(inspect == null){
				return set404Error(result);
			}
			setSuccessResult(result, inspect);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据请检单业务id修改请检单数据
	 * 
	 * @param 请检单对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateInspect(
		@WebParam(name="inspect")WOMInspect inspect,
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
			if(!beforeUpdateInspect(inspect)){
				return set404Error(result);
			}
			inspectService.saveInspect(inspect, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增请检单
	 * 
	 * @param 请检单对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addInspect(
		@WebParam(name="inspect")WOMInspect inspect,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(inspect == null){
				return set500Error(result, "请检单对象不能为空。");
			}
			if(inspect.getId() != null){
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
				checkInspectData(inspect);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			inspectService.saveInspect(inspect, null);
			Long inspectId = inspect.getId();
			setSuccessResult(result, inspectId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据请检单id 删除请检单
	 * 
	 * @param 请检单id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteInspect(
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
			
			WOMInspect inspect = null;
			try{
				inspect = inspectService.getInspect(id);
			}catch(NullPointerException e){}
			if(inspect == null  || !inspect.isValid()){
				return set404Error(result);
			}
			inspectService.deleteInspect(inspect);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改请检单数据，请检单id不能为空
	 *
	 * @param 请检单列表，每个请检单必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateInspect(
		@WebParam(name="inspectList")List<WOMInspect> inspectList,
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
			for(WOMInspect inspect : inspectList){
				try{
					if(!beforeUpdateInspect(inspect)){
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
			
			inspectService.batchImportBaseInspect(inspectList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增请检单数据
	 * 
	 * @param 请检单列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddInspect(
		@WebParam(name="inspectList")List<WOMInspect> inspectList,
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
			
			if(inspectList == null){
				set500Error(result, "inspectList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMInspect inspect : inspectList){
				if(inspect.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkInspectData(inspect);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			inspectService.batchImportBaseInspect(inspectList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMInspect inspect : inspectList){
				idList.add(inspect.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据请检单id，批量删除请检单数据
	 * 
	 * @param 请检单id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelInspect(
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
			
			List<WOMInspect> inspectList = new ArrayList<WOMInspect>();
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
				
				WOMInspect inspect = inspectService.getInspect(id);
				if(inspect == null || !inspect.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				inspectList.add(inspect);
				
				count ++;
			}
			for(WOMInspect inspect : inspectList){
				inspectService.deleteInspect(inspect);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有请检单数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getInspectPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMInspect.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMInspect.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMInspect.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMInspect.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMInspect.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMInspect> page = new Page<WOMInspect>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMInspect> datas = inspectService.getByPage(page, detachedCriteria);
			List<WOMInspect> inspectList = datas.getResult();
			if (inspectList == null || inspectList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(inspectList.toArray());
			PaginationDTO<WOMInspect> pagination = new PaginationDTO<WOMInspect>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到请检单则返回空。
	 * @param inspect
	 * @return
	 */
	private WOMInspect getInspect(WOMInspect inspect) {
		if (inspect.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMInspect result = inspectService.getInspect(inspect.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果请检单不存在，返回false；如果原来没有指令单对象，且修改的时候也没有配置指令单对象，则报错；如果配置的指令单对象不存在，则报错；
	 * @param inspect
	 * @return 
	 */
	private boolean beforeUpdateInspect(WOMInspect inspect){
		if(inspect.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMInspect temp = getInspect(inspect);
		if(temp == null){
			return false;
		}
		inspect.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMInspect> clearInspectNonMainField(List<WOMInspect> list){
		 List<WOMInspect> inspectList = new ArrayList<WOMInspect>();
		 for(WOMInspect inspect:list){
			 WOMInspect temp = new WOMInspect();
			 temp.setId(inspect.getId());
		 	 inspectList.add(temp);
		 }
		 return inspectList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkInspectData(WOMInspect inspect){
	}
	 
	//------------------------------------辅模型 WS  投料记录业签-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据投料记录业签业务主键分页查询投料记录业签数据
	 * 
	 * @param 投料记录业签业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPutInManagePageByProduceTaskManageBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "投料记录业签跟指令单没有设置关联！");
	}
	/**
	 * 根据投料记录业签id分页查询投料记录业签数据
	 * 
	 * @param 投料记录业签id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPutInManagePageByProduceTaskManagePk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "投料记录业签跟指令单没有设置关联！");
	}
	/**
	 * 根据投料记录业签id分获取投料记录业签数据
	 * 
	 * @param 投料记录业签id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPutInManage(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMPutInManage putInManage = putInManageService.getPutInManage(id);
			if(putInManage == null){
				return set404Error(result);
			}
			setSuccessResult(result, putInManage);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据投料记录业签业务id修改投料记录业签数据
	 * 
	 * @param 投料记录业签对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updatePutInManage(
		@WebParam(name="putInManage")WOMPutInManage putInManage,
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
			if(!beforeUpdatePutInManage(putInManage)){
				return set404Error(result);
			}
			putInManageService.savePutInManage(putInManage, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增投料记录业签
	 * 
	 * @param 投料记录业签对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addPutInManage(
		@WebParam(name="putInManage")WOMPutInManage putInManage,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(putInManage == null){
				return set500Error(result, "投料记录业签对象不能为空。");
			}
			if(putInManage.getId() != null){
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
				checkPutInManageData(putInManage);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			putInManageService.savePutInManage(putInManage, null);
			Long putInManageId = putInManage.getId();
			setSuccessResult(result, putInManageId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据投料记录业签id 删除投料记录业签
	 * 
	 * @param 投料记录业签id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deletePutInManage(
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
			
			WOMPutInManage putInManage = null;
			try{
				putInManage = putInManageService.getPutInManage(id);
			}catch(NullPointerException e){}
			if(putInManage == null  || !putInManage.isValid()){
				return set404Error(result);
			}
			putInManageService.deletePutInManage(putInManage);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改投料记录业签数据，投料记录业签id不能为空
	 *
	 * @param 投料记录业签列表，每个投料记录业签必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdatePutInManage(
		@WebParam(name="putInManageList")List<WOMPutInManage> putInManageList,
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
			for(WOMPutInManage putInManage : putInManageList){
				try{
					if(!beforeUpdatePutInManage(putInManage)){
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
			
			putInManageService.batchImportBasePutInManage(putInManageList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增投料记录业签数据
	 * 
	 * @param 投料记录业签列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddPutInManage(
		@WebParam(name="putInManageList")List<WOMPutInManage> putInManageList,
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
			
			if(putInManageList == null){
				set500Error(result, "putInManageList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMPutInManage putInManage : putInManageList){
				if(putInManage.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkPutInManageData(putInManage);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			putInManageService.batchImportBasePutInManage(putInManageList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMPutInManage putInManage : putInManageList){
				idList.add(putInManage.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据投料记录业签id，批量删除投料记录业签数据
	 * 
	 * @param 投料记录业签id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelPutInManage(
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
			
			List<WOMPutInManage> putInManageList = new ArrayList<WOMPutInManage>();
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
				
				WOMPutInManage putInManage = putInManageService.getPutInManage(id);
				if(putInManage == null || !putInManage.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				putInManageList.add(putInManage);
				
				count ++;
			}
			for(WOMPutInManage putInManage : putInManageList){
				putInManageService.deletePutInManage(putInManage);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有投料记录业签数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getPutInManagePage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMPutInManage.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMPutInManage.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMPutInManage.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMPutInManage.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMPutInManage.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMPutInManage> page = new Page<WOMPutInManage>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMPutInManage> datas = putInManageService.getByPage(page, detachedCriteria);
			List<WOMPutInManage> putInManageList = datas.getResult();
			if (putInManageList == null || putInManageList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(putInManageList.toArray());
			PaginationDTO<WOMPutInManage> pagination = new PaginationDTO<WOMPutInManage>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到投料记录业签则返回空。
	 * @param putInManage
	 * @return
	 */
	private WOMPutInManage getPutInManage(WOMPutInManage putInManage) {
		if (putInManage.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMPutInManage result = putInManageService.getPutInManage(putInManage.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果投料记录业签不存在，返回false；如果原来没有指令单对象，且修改的时候也没有配置指令单对象，则报错；如果配置的指令单对象不存在，则报错；
	 * @param putInManage
	 * @return 
	 */
	private boolean beforeUpdatePutInManage(WOMPutInManage putInManage){
		if(putInManage.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMPutInManage temp = getPutInManage(putInManage);
		if(temp == null){
			return false;
		}
		putInManage.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMPutInManage> clearPutInManageNonMainField(List<WOMPutInManage> list){
		 List<WOMPutInManage> putInManageList = new ArrayList<WOMPutInManage>();
		 for(WOMPutInManage putInManage:list){
			 WOMPutInManage temp = new WOMPutInManage();
			 temp.setId(putInManage.getId());
		 	 putInManageList.add(temp);
		 }
		 return putInManageList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkPutInManageData(WOMPutInManage putInManage){
	}
	 
	//------------------------------------辅模型 WS  报工记录业签-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据报工记录业签业务主键分页查询报工记录业签数据
	 * 
	 * @param 报工记录业签业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTaskReportManagePageByProduceTaskManageBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "报工记录业签跟指令单没有设置关联！");
	}
	/**
	 * 根据报工记录业签id分页查询报工记录业签数据
	 * 
	 * @param 报工记录业签id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTaskReportManagePageByProduceTaskManagePk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "报工记录业签跟指令单没有设置关联！");
	}
	/**
	 * 根据报工记录业签id分获取报工记录业签数据
	 * 
	 * @param 报工记录业签id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTaskReportManage(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			WOMTaskReportManage taskReportManage = taskReportManageService.getTaskReportManage(id);
			if(taskReportManage == null){
				return set404Error(result);
			}
			setSuccessResult(result, taskReportManage);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据报工记录业签业务id修改报工记录业签数据
	 * 
	 * @param 报工记录业签对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateTaskReportManage(
		@WebParam(name="taskReportManage")WOMTaskReportManage taskReportManage,
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
			if(!beforeUpdateTaskReportManage(taskReportManage)){
				return set404Error(result);
			}
			taskReportManageService.saveTaskReportManage(taskReportManage, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增报工记录业签
	 * 
	 * @param 报工记录业签对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addTaskReportManage(
		@WebParam(name="taskReportManage")WOMTaskReportManage taskReportManage,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(taskReportManage == null){
				return set500Error(result, "报工记录业签对象不能为空。");
			}
			if(taskReportManage.getId() != null){
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
				checkTaskReportManageData(taskReportManage);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			taskReportManageService.saveTaskReportManage(taskReportManage, null);
			Long taskReportManageId = taskReportManage.getId();
			setSuccessResult(result, taskReportManageId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据报工记录业签id 删除报工记录业签
	 * 
	 * @param 报工记录业签id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteTaskReportManage(
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
			
			WOMTaskReportManage taskReportManage = null;
			try{
				taskReportManage = taskReportManageService.getTaskReportManage(id);
			}catch(NullPointerException e){}
			if(taskReportManage == null  || !taskReportManage.isValid()){
				return set404Error(result);
			}
			taskReportManageService.deleteTaskReportManage(taskReportManage);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改报工记录业签数据，报工记录业签id不能为空
	 *
	 * @param 报工记录业签列表，每个报工记录业签必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateTaskReportManage(
		@WebParam(name="taskReportManageList")List<WOMTaskReportManage> taskReportManageList,
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
			for(WOMTaskReportManage taskReportManage : taskReportManageList){
				try{
					if(!beforeUpdateTaskReportManage(taskReportManage)){
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
			
			taskReportManageService.batchImportBaseTaskReportManage(taskReportManageList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增报工记录业签数据
	 * 
	 * @param 报工记录业签列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddTaskReportManage(
		@WebParam(name="taskReportManageList")List<WOMTaskReportManage> taskReportManageList,
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
			
			if(taskReportManageList == null){
				set500Error(result, "taskReportManageList不能为空。");
				return result;
			}
			
			int count = 1;
			for(WOMTaskReportManage taskReportManage : taskReportManageList){
				if(taskReportManage.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkTaskReportManageData(taskReportManage);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			taskReportManageService.batchImportBaseTaskReportManage(taskReportManageList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(WOMTaskReportManage taskReportManage : taskReportManageList){
				idList.add(taskReportManage.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据报工记录业签id，批量删除报工记录业签数据
	 * 
	 * @param 报工记录业签id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelTaskReportManage(
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
			
			List<WOMTaskReportManage> taskReportManageList = new ArrayList<WOMTaskReportManage>();
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
				
				WOMTaskReportManage taskReportManage = taskReportManageService.getTaskReportManage(id);
				if(taskReportManage == null || !taskReportManage.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				taskReportManageList.add(taskReportManage);
				
				count ++;
			}
			for(WOMTaskReportManage taskReportManage : taskReportManageList){
				taskReportManageService.deleteTaskReportManage(taskReportManage);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有报工记录业签数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getTaskReportManagePage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(WOMTaskReportManage.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), WOMTaskReportManage.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(WOMTaskReportManage.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,WOMTaskReportManage.class);
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
				detachedCriteria = DetachedCriteria.forClass(WOMTaskReportManage.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<WOMTaskReportManage> page = new Page<WOMTaskReportManage>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<WOMTaskReportManage> datas = taskReportManageService.getByPage(page, detachedCriteria);
			List<WOMTaskReportManage> taskReportManageList = datas.getResult();
			if (taskReportManageList == null || taskReportManageList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(taskReportManageList.toArray());
			PaginationDTO<WOMTaskReportManage> pagination = new PaginationDTO<WOMTaskReportManage>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到报工记录业签则返回空。
	 * @param taskReportManage
	 * @return
	 */
	private WOMTaskReportManage getTaskReportManage(WOMTaskReportManage taskReportManage) {
		if (taskReportManage.getId() == null)
			throw new RuntimeException("id不能为空");
		WOMTaskReportManage result = taskReportManageService.getTaskReportManage(taskReportManage.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果报工记录业签不存在，返回false；如果原来没有指令单对象，且修改的时候也没有配置指令单对象，则报错；如果配置的指令单对象不存在，则报错；
	 * @param taskReportManage
	 * @return 
	 */
	private boolean beforeUpdateTaskReportManage(WOMTaskReportManage taskReportManage){
		if(taskReportManage.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		WOMTaskReportManage temp = getTaskReportManage(taskReportManage);
		if(temp == null){
			return false;
		}
		taskReportManage.setVersion(temp.getVersion());
		return true;
	}
	
	private List<WOMTaskReportManage> clearTaskReportManageNonMainField(List<WOMTaskReportManage> list){
		 List<WOMTaskReportManage> taskReportManageList = new ArrayList<WOMTaskReportManage>();
		 for(WOMTaskReportManage taskReportManage:list){
			 WOMTaskReportManage temp = new WOMTaskReportManage();
			 temp.setId(taskReportManage.getId());
		 	 taskReportManageList.add(temp);
		 }
		 return taskReportManageList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkTaskReportManageData(WOMTaskReportManage taskReportManage){
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
	 * 获取指令单对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param produceTaskManage
	 * @return
	 */
	private WOMProduceTaskManage getProduceTaskManage(WOMProduceTaskManage produceTaskManage) {
		if (produceTaskManage.getId() == null && (produceTaskManage.getId() == null || produceTaskManage.getId().toString().trim() == ""))
			throw new RuntimeException("指令单对象业务主键和id不能同时为空");
		if (produceTaskManage.getId() != null) {
			WOMProduceTaskManage result = produceTaskManageService.getProduceTaskManage(produceTaskManage .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return produceTaskManageService.loadProduceTaskManageByBussinessKey(produceTaskManage.getId());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个指令单，则返回false，否则返回true
	 * @param produceTaskManage
	 */
	private boolean beforeUpdateProduceTaskManage(WOMProduceTaskManage produceTaskManage) {
		WOMProduceTaskManage temp = getProduceTaskManage(produceTaskManage);
		if (temp == null) {
			return false;
		}
		if(produceTaskManage.getId() == null){
			produceTaskManage.setId(temp.getId());		
		}
		if(produceTaskManage.getId() == null){
			produceTaskManage.setId(temp.getId());
		}
		
		produceTaskManage.setVersion(temp.getVersion());
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
	 * 清除指令单对象下所有辅模型对象中的指令单对象
	 * @param produceTaskManage
	 */
	private void clearCircle(WOMProduceTaskManage produceTaskManage) {
	
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
	private void checkProduceTaskManageData(WOMProduceTaskManage produceTaskManage){
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}