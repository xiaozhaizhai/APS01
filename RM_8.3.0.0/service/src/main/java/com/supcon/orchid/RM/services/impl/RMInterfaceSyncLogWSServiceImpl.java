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
import com.supcon.orchid.RM.services.RMInterfaceSyncLogWSService;
import com.supcon.orchid.RM.services.RMInterfaceSyncLogService;
import com.supcon.orchid.RM.services.RMMQDealinfoService;
import com.supcon.orchid.RM.services.RMFactoryMapOtherService;
	
/* CUSTOM CODE START(wsserviceimpl,import,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="RMInterfaceSyncLog",targetNamespace = "http://ws.supcon.com")
public class RMInterfaceSyncLogWSServiceImpl implements RMInterfaceSyncLogWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private RMInterfaceSyncLogService interfaceSyncLogService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private RMMQDealinfoService mQDealinfoService;
	@Resource
	private RMFactoryMapOtherService factoryMapOtherService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取接口同步日志数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getInterfaceSyncLogByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			RMInterfaceSyncLog interfaceSyncLog = interfaceSyncLogService.loadInterfaceSyncLogByBussinessKey(businessKey);
			if(interfaceSyncLog == null){
				return set404Error(result);
			}
			//添加辅模型
			
			setSuccessResult(result, interfaceSyncLog);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取接口同步日志数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getInterfaceSyncLogByPk(
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
			
			RMInterfaceSyncLog interfaceSyncLog = interfaceSyncLogService.getInterfaceSyncLog(id);
			if(interfaceSyncLog == null || !interfaceSyncLog.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			setSuccessResult(result, interfaceSyncLog);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改接口同步日志数据
	 * @param 接口同步日志对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateInterfaceSyncLog(
		@WebParam(name="interfaceSyncLog")RMInterfaceSyncLog interfaceSyncLog,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(interfaceSyncLog == null){
				return set500Error(result, "接口同步日志不能为空。");
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
			
			if(!beforeUpdateInterfaceSyncLog(interfaceSyncLog)){
				return set404Error(result);
			}
			interfaceSyncLogService.saveInterfaceSyncLog(interfaceSyncLog, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addInterfaceSyncLog(
		@WebParam(name="interfaceSyncLog")RMInterfaceSyncLog interfaceSyncLog,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(interfaceSyncLog == null){
				return set500Error(result, "接口同步日志不能为空。");
			}
		
			if(interfaceSyncLog.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(interfaceSyncLog.getId() == null){
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
				checkInterfaceSyncLogData(interfaceSyncLog);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			interfaceSyncLogService.saveInterfaceSyncLog(interfaceSyncLog, null);
			setSuccessResult(result, interfaceSyncLog.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteInterfaceSyncLogByBusinessKey(
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
			RMInterfaceSyncLog interfaceSyncLog = null;
			try{
				interfaceSyncLog = interfaceSyncLogService.loadInterfaceSyncLogByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(interfaceSyncLog == null){
				return set404Error(result);
			}
			interfaceSyncLogService.deleteInterfaceSyncLog(interfaceSyncLog);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteInterfaceSyncLogByPk(
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
			RMInterfaceSyncLog interfaceSyncLog = null;
			try{
				interfaceSyncLog = interfaceSyncLogService.getInterfaceSyncLog(id);
			}catch(NullPointerException e){}
			if(interfaceSyncLog == null || !interfaceSyncLog.isValid()){
				return set404Error(result);
			}
			interfaceSyncLogService.deleteInterfaceSyncLog(interfaceSyncLog);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddInterfaceSyncLog(
		@WebParam(name="interfaceSyncLogList")List<RMInterfaceSyncLog> interfaceSyncLogList,
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
			for(RMInterfaceSyncLog interfaceSyncLog : interfaceSyncLogList){
				if(interfaceSyncLog.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(interfaceSyncLog.getId() == null || interfaceSyncLog.getId().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkInterfaceSyncLogData(interfaceSyncLog);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			interfaceSyncLogService.batchImportBaseInterfaceSyncLog(interfaceSyncLogList);
			for(RMInterfaceSyncLog interfaceSyncLog : interfaceSyncLogList){
				idList.add(interfaceSyncLog.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateInterfaceSyncLog(
		@WebParam(name="interfaceSyncLogList")List<RMInterfaceSyncLog> interfaceSyncLogList,
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
			for(RMInterfaceSyncLog interfaceSyncLog : interfaceSyncLogList){
				try{
					if(!beforeUpdateInterfaceSyncLog(interfaceSyncLog)){
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
			interfaceSyncLogService.batchImportBaseInterfaceSyncLog(interfaceSyncLogList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteInterfaceSyncLogByPk(
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
				RMInterfaceSyncLog temp = null;
				try{
					temp = interfaceSyncLogService.getInterfaceSyncLog(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			interfaceSyncLogService.deleteInterfaceSyncLog(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteInterfaceSyncLogByBusinessKey(
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
				RMInterfaceSyncLog temp = null;
				try{
					temp = interfaceSyncLogService.loadInterfaceSyncLogByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			interfaceSyncLogService.deleteInterfaceSyncLog(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getInterfaceSyncLogPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMInterfaceSyncLog.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),RMInterfaceSyncLog.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMInterfaceSyncLog.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMInterfaceSyncLog.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMInterfaceSyncLog.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMInterfaceSyncLog> page = new Page<RMInterfaceSyncLog>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMInterfaceSyncLog> datas = interfaceSyncLogService.getByPage(page, detachedCriteria);
			List<RMInterfaceSyncLog> interfaceSyncLogList = datas.getResult();
			if (interfaceSyncLogList == null || interfaceSyncLogList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(interfaceSyncLogList.toArray());
			PaginationDTO<RMInterfaceSyncLog> pagination = new PaginationDTO<RMInterfaceSyncLog>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据接口同步日志业务主键查询接口同步日志下所有辅模型
	 * @param 接口同步日志业务主键
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
			RMInterfaceSyncLog interfaceSyncLog = interfaceSyncLogService.loadInterfaceSyncLogByBussinessKey(businessKey);
			if (interfaceSyncLog == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(interfaceSyncLog);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据接口同步日志id查询接口同步日志下所有辅模型
	 * 
	 * @param 接口同步日志id
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
			RMInterfaceSyncLog interfaceSyncLog = interfaceSyncLogService.getInterfaceSyncLog(id);
			if (interfaceSyncLog == null || !interfaceSyncLog.isValid()) {
				result.setErrorMessage("找不到接口同步日志");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(interfaceSyncLog);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  MQ处理信息表-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据MQ处理信息表业务主键分页查询MQ处理信息表数据
	 * 
	 * @param MQ处理信息表业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMQDealinfoPageByInterfaceSyncLogBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "MQ处理信息表跟接口同步日志没有设置关联！");
	}
	/**
	 * 根据MQ处理信息表id分页查询MQ处理信息表数据
	 * 
	 * @param MQ处理信息表id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMQDealinfoPageByInterfaceSyncLogPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "MQ处理信息表跟接口同步日志没有设置关联！");
	}
	/**
	 * 根据MQ处理信息表id分获取MQ处理信息表数据
	 * 
	 * @param MQ处理信息表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMQDealinfo(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMMQDealinfo mQDealinfo = mQDealinfoService.getMQDealinfo(id);
			if(mQDealinfo == null){
				return set404Error(result);
			}
			setSuccessResult(result, mQDealinfo);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据MQ处理信息表业务id修改MQ处理信息表数据
	 * 
	 * @param MQ处理信息表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateMQDealinfo(
		@WebParam(name="mQDealinfo")RMMQDealinfo mQDealinfo,
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
			if(!beforeUpdateMQDealinfo(mQDealinfo)){
				return set404Error(result);
			}
			mQDealinfoService.saveMQDealinfo(mQDealinfo, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增MQ处理信息表
	 * 
	 * @param MQ处理信息表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addMQDealinfo(
		@WebParam(name="mQDealinfo")RMMQDealinfo mQDealinfo,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(mQDealinfo == null){
				return set500Error(result, "MQ处理信息表对象不能为空。");
			}
			if(mQDealinfo.getId() != null){
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
				checkMQDealinfoData(mQDealinfo);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			mQDealinfoService.saveMQDealinfo(mQDealinfo, null);
			Long mQDealinfoId = mQDealinfo.getId();
			setSuccessResult(result, mQDealinfoId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据MQ处理信息表id 删除MQ处理信息表
	 * 
	 * @param MQ处理信息表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteMQDealinfo(
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
			
			RMMQDealinfo mQDealinfo = null;
			try{
				mQDealinfo = mQDealinfoService.getMQDealinfo(id);
			}catch(NullPointerException e){}
			if(mQDealinfo == null  || !mQDealinfo.isValid()){
				return set404Error(result);
			}
			mQDealinfoService.deleteMQDealinfo(mQDealinfo);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改MQ处理信息表数据，MQ处理信息表id不能为空
	 *
	 * @param MQ处理信息表列表，每个MQ处理信息表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateMQDealinfo(
		@WebParam(name="mQDealinfoList")List<RMMQDealinfo> mQDealinfoList,
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
			for(RMMQDealinfo mQDealinfo : mQDealinfoList){
				try{
					if(!beforeUpdateMQDealinfo(mQDealinfo)){
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
			
			mQDealinfoService.batchImportBaseMQDealinfo(mQDealinfoList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增MQ处理信息表数据
	 * 
	 * @param MQ处理信息表列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddMQDealinfo(
		@WebParam(name="mQDealinfoList")List<RMMQDealinfo> mQDealinfoList,
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
			
			if(mQDealinfoList == null){
				set500Error(result, "mQDealinfoList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMMQDealinfo mQDealinfo : mQDealinfoList){
				if(mQDealinfo.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkMQDealinfoData(mQDealinfo);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			mQDealinfoService.batchImportBaseMQDealinfo(mQDealinfoList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMMQDealinfo mQDealinfo : mQDealinfoList){
				idList.add(mQDealinfo.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据MQ处理信息表id，批量删除MQ处理信息表数据
	 * 
	 * @param MQ处理信息表id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelMQDealinfo(
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
			
			List<RMMQDealinfo> mQDealinfoList = new ArrayList<RMMQDealinfo>();
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
				
				RMMQDealinfo mQDealinfo = mQDealinfoService.getMQDealinfo(id);
				if(mQDealinfo == null || !mQDealinfo.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				mQDealinfoList.add(mQDealinfo);
				
				count ++;
			}
			for(RMMQDealinfo mQDealinfo : mQDealinfoList){
				mQDealinfoService.deleteMQDealinfo(mQDealinfo);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有MQ处理信息表数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMQDealinfoPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMMQDealinfo.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMMQDealinfo.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMMQDealinfo.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMMQDealinfo.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMMQDealinfo.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMMQDealinfo> page = new Page<RMMQDealinfo>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMMQDealinfo> datas = mQDealinfoService.getByPage(page, detachedCriteria);
			List<RMMQDealinfo> mQDealinfoList = datas.getResult();
			if (mQDealinfoList == null || mQDealinfoList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(mQDealinfoList.toArray());
			PaginationDTO<RMMQDealinfo> pagination = new PaginationDTO<RMMQDealinfo>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到MQ处理信息表则返回空。
	 * @param mQDealinfo
	 * @return
	 */
	private RMMQDealinfo getMQDealinfo(RMMQDealinfo mQDealinfo) {
		if (mQDealinfo.getId() == null)
			throw new RuntimeException("id不能为空");
		RMMQDealinfo result = mQDealinfoService.getMQDealinfo(mQDealinfo.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果MQ处理信息表不存在，返回false；如果原来没有接口同步日志对象，且修改的时候也没有配置接口同步日志对象，则报错；如果配置的接口同步日志对象不存在，则报错；
	 * @param mQDealinfo
	 * @return 
	 */
	private boolean beforeUpdateMQDealinfo(RMMQDealinfo mQDealinfo){
		if(mQDealinfo.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		RMMQDealinfo temp = getMQDealinfo(mQDealinfo);
		if(temp == null){
			return false;
		}
		mQDealinfo.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMMQDealinfo> clearMQDealinfoNonMainField(List<RMMQDealinfo> list){
		 List<RMMQDealinfo> mQDealinfoList = new ArrayList<RMMQDealinfo>();
		 for(RMMQDealinfo mQDealinfo:list){
			 RMMQDealinfo temp = new RMMQDealinfo();
			 temp.setId(mQDealinfo.getId());
		 	 mQDealinfoList.add(temp);
		 }
		 return mQDealinfoList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkMQDealinfoData(RMMQDealinfo mQDealinfo){
	}
	 
	//------------------------------------辅模型 WS  工厂模型映射表-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据工厂模型映射表业务主键分页查询工厂模型映射表数据
	 * 
	 * @param 工厂模型映射表业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFactoryMapOtherPageByInterfaceSyncLogBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工厂模型映射表跟接口同步日志没有设置关联！");
	}
	/**
	 * 根据工厂模型映射表id分页查询工厂模型映射表数据
	 * 
	 * @param 工厂模型映射表id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFactoryMapOtherPageByInterfaceSyncLogPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工厂模型映射表跟接口同步日志没有设置关联！");
	}
	/**
	 * 根据工厂模型映射表id分获取工厂模型映射表数据
	 * 
	 * @param 工厂模型映射表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFactoryMapOther(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMFactoryMapOther factoryMapOther = factoryMapOtherService.getFactoryMapOther(id);
			if(factoryMapOther == null){
				return set404Error(result);
			}
			setSuccessResult(result, factoryMapOther);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工厂模型映射表业务id修改工厂模型映射表数据
	 * 
	 * @param 工厂模型映射表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateFactoryMapOther(
		@WebParam(name="factoryMapOther")RMFactoryMapOther factoryMapOther,
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
			if(!beforeUpdateFactoryMapOther(factoryMapOther)){
				return set404Error(result);
			}
			factoryMapOtherService.saveFactoryMapOther(factoryMapOther, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增工厂模型映射表
	 * 
	 * @param 工厂模型映射表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addFactoryMapOther(
		@WebParam(name="factoryMapOther")RMFactoryMapOther factoryMapOther,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(factoryMapOther == null){
				return set500Error(result, "工厂模型映射表对象不能为空。");
			}
			if(factoryMapOther.getId() != null){
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
				checkFactoryMapOtherData(factoryMapOther);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			factoryMapOtherService.saveFactoryMapOther(factoryMapOther, null);
			Long factoryMapOtherId = factoryMapOther.getId();
			setSuccessResult(result, factoryMapOtherId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工厂模型映射表id 删除工厂模型映射表
	 * 
	 * @param 工厂模型映射表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteFactoryMapOther(
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
			
			RMFactoryMapOther factoryMapOther = null;
			try{
				factoryMapOther = factoryMapOtherService.getFactoryMapOther(id);
			}catch(NullPointerException e){}
			if(factoryMapOther == null  || !factoryMapOther.isValid()){
				return set404Error(result);
			}
			factoryMapOtherService.deleteFactoryMapOther(factoryMapOther);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改工厂模型映射表数据，工厂模型映射表id不能为空
	 *
	 * @param 工厂模型映射表列表，每个工厂模型映射表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateFactoryMapOther(
		@WebParam(name="factoryMapOtherList")List<RMFactoryMapOther> factoryMapOtherList,
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
			for(RMFactoryMapOther factoryMapOther : factoryMapOtherList){
				try{
					if(!beforeUpdateFactoryMapOther(factoryMapOther)){
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
			
			factoryMapOtherService.batchImportBaseFactoryMapOther(factoryMapOtherList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增工厂模型映射表数据
	 * 
	 * @param 工厂模型映射表列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddFactoryMapOther(
		@WebParam(name="factoryMapOtherList")List<RMFactoryMapOther> factoryMapOtherList,
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
			
			if(factoryMapOtherList == null){
				set500Error(result, "factoryMapOtherList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMFactoryMapOther factoryMapOther : factoryMapOtherList){
				if(factoryMapOther.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkFactoryMapOtherData(factoryMapOther);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			factoryMapOtherService.batchImportBaseFactoryMapOther(factoryMapOtherList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMFactoryMapOther factoryMapOther : factoryMapOtherList){
				idList.add(factoryMapOther.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工厂模型映射表id，批量删除工厂模型映射表数据
	 * 
	 * @param 工厂模型映射表id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelFactoryMapOther(
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
			
			List<RMFactoryMapOther> factoryMapOtherList = new ArrayList<RMFactoryMapOther>();
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
				
				RMFactoryMapOther factoryMapOther = factoryMapOtherService.getFactoryMapOther(id);
				if(factoryMapOther == null || !factoryMapOther.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				factoryMapOtherList.add(factoryMapOther);
				
				count ++;
			}
			for(RMFactoryMapOther factoryMapOther : factoryMapOtherList){
				factoryMapOtherService.deleteFactoryMapOther(factoryMapOther);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有工厂模型映射表数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getFactoryMapOtherPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMFactoryMapOther.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMFactoryMapOther.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMFactoryMapOther.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMFactoryMapOther.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMFactoryMapOther.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMFactoryMapOther> page = new Page<RMFactoryMapOther>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMFactoryMapOther> datas = factoryMapOtherService.getByPage(page, detachedCriteria);
			List<RMFactoryMapOther> factoryMapOtherList = datas.getResult();
			if (factoryMapOtherList == null || factoryMapOtherList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(factoryMapOtherList.toArray());
			PaginationDTO<RMFactoryMapOther> pagination = new PaginationDTO<RMFactoryMapOther>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到工厂模型映射表则返回空。
	 * @param factoryMapOther
	 * @return
	 */
	private RMFactoryMapOther getFactoryMapOther(RMFactoryMapOther factoryMapOther) {
		if (factoryMapOther.getId() == null)
			throw new RuntimeException("id不能为空");
		RMFactoryMapOther result = factoryMapOtherService.getFactoryMapOther(factoryMapOther.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果工厂模型映射表不存在，返回false；如果原来没有接口同步日志对象，且修改的时候也没有配置接口同步日志对象，则报错；如果配置的接口同步日志对象不存在，则报错；
	 * @param factoryMapOther
	 * @return 
	 */
	private boolean beforeUpdateFactoryMapOther(RMFactoryMapOther factoryMapOther){
		if(factoryMapOther.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		RMFactoryMapOther temp = getFactoryMapOther(factoryMapOther);
		if(temp == null){
			return false;
		}
		factoryMapOther.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMFactoryMapOther> clearFactoryMapOtherNonMainField(List<RMFactoryMapOther> list){
		 List<RMFactoryMapOther> factoryMapOtherList = new ArrayList<RMFactoryMapOther>();
		 for(RMFactoryMapOther factoryMapOther:list){
			 RMFactoryMapOther temp = new RMFactoryMapOther();
			 temp.setId(factoryMapOther.getId());
		 	 factoryMapOtherList.add(temp);
		 }
		 return factoryMapOtherList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkFactoryMapOtherData(RMFactoryMapOther factoryMapOther){
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
	 * 获取接口同步日志对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param interfaceSyncLog
	 * @return
	 */
	private RMInterfaceSyncLog getInterfaceSyncLog(RMInterfaceSyncLog interfaceSyncLog) {
		if (interfaceSyncLog.getId() == null && (interfaceSyncLog.getId() == null || interfaceSyncLog.getId().toString().trim() == ""))
			throw new RuntimeException("接口同步日志对象业务主键和id不能同时为空");
		if (interfaceSyncLog.getId() != null) {
			RMInterfaceSyncLog result = interfaceSyncLogService.getInterfaceSyncLog(interfaceSyncLog .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return interfaceSyncLogService.loadInterfaceSyncLogByBussinessKey(interfaceSyncLog.getId());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个接口同步日志，则返回false，否则返回true
	 * @param interfaceSyncLog
	 */
	private boolean beforeUpdateInterfaceSyncLog(RMInterfaceSyncLog interfaceSyncLog) {
		if(interfaceSyncLog.getLogID() == null){
			throw new RuntimeException("logID不能为空。");
		}
		if(interfaceSyncLog.getLogIsIgnore() == null){
			throw new RuntimeException("logIsIgnore不能为空。");
		}
		if(interfaceSyncLog.getLogSynFlag() == null){
			throw new RuntimeException("logSynFlag不能为空。");
		}
		if(interfaceSyncLog.getLogType() == null){
			throw new RuntimeException("logType不能为空。");
		}
		RMInterfaceSyncLog temp = getInterfaceSyncLog(interfaceSyncLog);
		if (temp == null) {
			return false;
		}
		if(interfaceSyncLog.getId() == null){
			interfaceSyncLog.setId(temp.getId());		
		}
		if(interfaceSyncLog.getId() == null){
			interfaceSyncLog.setId(temp.getId());
		}
		
		interfaceSyncLog.setVersion(temp.getVersion());
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
	 * 清除接口同步日志对象下所有辅模型对象中的接口同步日志对象
	 * @param interfaceSyncLog
	 */
	private void clearCircle(RMInterfaceSyncLog interfaceSyncLog) {
	
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
	private void checkInterfaceSyncLogData(RMInterfaceSyncLog interfaceSyncLog){
		 if(interfaceSyncLog.getLogID() == null){
		 	throw new RuntimeException("logID不能为空。");
		 }
		 if(interfaceSyncLog.getLogIsIgnore() == null){
		 	throw new RuntimeException("logIsIgnore不能为空。");
		 }
		 if(interfaceSyncLog.getLogSynFlag() == null){
		 	throw new RuntimeException("logSynFlag不能为空。");
		 }
		 if(interfaceSyncLog.getLogType() == null){
		 	throw new RuntimeException("logType不能为空。");
		 }
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}