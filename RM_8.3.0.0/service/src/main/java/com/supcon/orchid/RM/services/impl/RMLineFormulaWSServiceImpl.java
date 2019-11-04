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
import com.supcon.orchid.RM.services.RMLineFormulaWSService;
import com.supcon.orchid.RM.services.RMLineFormulaService;
import com.supcon.orchid.RM.services.RMProcessUnitService;
import com.supcon.orchid.RM.services.RMProcessUnitChoiceService;
import com.supcon.orchid.RM.services.RMProcessPointService;
	
/* CUSTOM CODE START(wsserviceimpl,import,RM_7.5.0.0_suitedLine_LineFormula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="RMLineFormula",targetNamespace = "http://ws.supcon.com")
public class RMLineFormulaWSServiceImpl implements RMLineFormulaWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private RMLineFormulaService lineFormulaService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private RMProcessUnitService processUnitService;
	@Resource
	private RMProcessUnitChoiceService processUnitChoiceService;
	@Resource
	private RMProcessPointService processPointService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取生产线-配方表数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getLineFormulaByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			RMLineFormula lineFormula = lineFormulaService.loadLineFormulaByBussinessKey(businessKey);
			if(lineFormula == null){
				return set404Error(result);
			}
			//添加辅模型
			
			setSuccessResult(result, lineFormula);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取生产线-配方表数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getLineFormulaByPk(
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
			
			RMLineFormula lineFormula = lineFormulaService.getLineFormula(id);
			if(lineFormula == null || !lineFormula.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			setSuccessResult(result, lineFormula);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改生产线-配方表数据
	 * @param 生产线-配方表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateLineFormula(
		@WebParam(name="lineFormula")RMLineFormula lineFormula,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(lineFormula == null){
				return set500Error(result, "生产线-配方表不能为空。");
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
			
			if(!beforeUpdateLineFormula(lineFormula)){
				return set404Error(result);
			}
			lineFormulaService.saveLineFormula(lineFormula, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addLineFormula(
		@WebParam(name="lineFormula")RMLineFormula lineFormula,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(lineFormula == null){
				return set500Error(result, "生产线-配方表不能为空。");
			}
		
			if(lineFormula.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(lineFormula.getId() == null){
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
				checkLineFormulaData(lineFormula);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			lineFormulaService.saveLineFormula(lineFormula, null);
			setSuccessResult(result, lineFormula.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteLineFormulaByBusinessKey(
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
			RMLineFormula lineFormula = null;
			try{
				lineFormula = lineFormulaService.loadLineFormulaByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(lineFormula == null){
				return set404Error(result);
			}
			lineFormulaService.deleteLineFormula(lineFormula);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteLineFormulaByPk(
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
			RMLineFormula lineFormula = null;
			try{
				lineFormula = lineFormulaService.getLineFormula(id);
			}catch(NullPointerException e){}
			if(lineFormula == null || !lineFormula.isValid()){
				return set404Error(result);
			}
			lineFormulaService.deleteLineFormula(lineFormula);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddLineFormula(
		@WebParam(name="lineFormulaList")List<RMLineFormula> lineFormulaList,
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
			for(RMLineFormula lineFormula : lineFormulaList){
				if(lineFormula.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(lineFormula.getId() == null || lineFormula.getId().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkLineFormulaData(lineFormula);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			lineFormulaService.batchImportBaseLineFormula(lineFormulaList);
			for(RMLineFormula lineFormula : lineFormulaList){
				idList.add(lineFormula.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateLineFormula(
		@WebParam(name="lineFormulaList")List<RMLineFormula> lineFormulaList,
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
			for(RMLineFormula lineFormula : lineFormulaList){
				try{
					if(!beforeUpdateLineFormula(lineFormula)){
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
			lineFormulaService.batchImportBaseLineFormula(lineFormulaList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteLineFormulaByPk(
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
				RMLineFormula temp = null;
				try{
					temp = lineFormulaService.getLineFormula(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			lineFormulaService.deleteLineFormula(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteLineFormulaByBusinessKey(
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
				RMLineFormula temp = null;
				try{
					temp = lineFormulaService.loadLineFormulaByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			lineFormulaService.deleteLineFormula(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getLineFormulaPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMLineFormula.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),RMLineFormula.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMLineFormula.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMLineFormula.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMLineFormula.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMLineFormula> page = new Page<RMLineFormula>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMLineFormula> datas = lineFormulaService.getByPage(page, detachedCriteria);
			List<RMLineFormula> lineFormulaList = datas.getResult();
			if (lineFormulaList == null || lineFormulaList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(lineFormulaList.toArray());
			PaginationDTO<RMLineFormula> pagination = new PaginationDTO<RMLineFormula>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据生产线-配方表业务主键查询生产线-配方表下所有辅模型
	 * @param 生产线-配方表业务主键
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
			RMLineFormula lineFormula = lineFormulaService.loadLineFormulaByBussinessKey(businessKey);
			if (lineFormula == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(lineFormula);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据生产线-配方表id查询生产线-配方表下所有辅模型
	 * 
	 * @param 生产线-配方表id
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
			RMLineFormula lineFormula = lineFormulaService.getLineFormula(id);
			if (lineFormula == null || !lineFormula.isValid()) {
				result.setErrorMessage("找不到生产线-配方表");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			clearCircle(lineFormula);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  工序-工作单元表-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据工序-工作单元表业务主键分页查询工序-工作单元表数据
	 * 
	 * @param 工序-工作单元表业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitPageByLineFormulaBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工序-工作单元表跟生产线-配方表没有设置关联！");
	}
	/**
	 * 根据工序-工作单元表id分页查询工序-工作单元表数据
	 * 
	 * @param 工序-工作单元表id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitPageByLineFormulaPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工序-工作单元表跟生产线-配方表没有设置关联！");
	}
	/**
	 * 根据工序-工作单元表id分获取工序-工作单元表数据
	 * 
	 * @param 工序-工作单元表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessUnit(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMProcessUnit processUnit = processUnitService.getProcessUnit(id);
			if(processUnit == null){
				return set404Error(result);
			}
			setSuccessResult(result, processUnit);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序-工作单元表业务id修改工序-工作单元表数据
	 * 
	 * @param 工序-工作单元表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProcessUnit(
		@WebParam(name="processUnit")RMProcessUnit processUnit,
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
			if(!beforeUpdateProcessUnit(processUnit)){
				return set404Error(result);
			}
			processUnitService.saveProcessUnit(processUnit, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增工序-工作单元表
	 * 
	 * @param 工序-工作单元表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProcessUnit(
		@WebParam(name="processUnit")RMProcessUnit processUnit,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(processUnit == null){
				return set500Error(result, "工序-工作单元表对象不能为空。");
			}
			if(processUnit.getId() != null){
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
				checkProcessUnitData(processUnit);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			processUnitService.saveProcessUnit(processUnit, null);
			Long processUnitId = processUnit.getId();
			setSuccessResult(result, processUnitId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序-工作单元表id 删除工序-工作单元表
	 * 
	 * @param 工序-工作单元表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProcessUnit(
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
			
			RMProcessUnit processUnit = null;
			try{
				processUnit = processUnitService.getProcessUnit(id);
			}catch(NullPointerException e){}
			if(processUnit == null  || !processUnit.isValid()){
				return set404Error(result);
			}
			processUnitService.deleteProcessUnit(processUnit);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改工序-工作单元表数据，工序-工作单元表id不能为空
	 *
	 * @param 工序-工作单元表列表，每个工序-工作单元表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProcessUnit(
		@WebParam(name="processUnitList")List<RMProcessUnit> processUnitList,
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
			for(RMProcessUnit processUnit : processUnitList){
				try{
					if(!beforeUpdateProcessUnit(processUnit)){
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
			
			processUnitService.batchImportBaseProcessUnit(processUnitList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增工序-工作单元表数据
	 * 
	 * @param 工序-工作单元表列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProcessUnit(
		@WebParam(name="processUnitList")List<RMProcessUnit> processUnitList,
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
			
			if(processUnitList == null){
				set500Error(result, "processUnitList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMProcessUnit processUnit : processUnitList){
				if(processUnit.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkProcessUnitData(processUnit);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			processUnitService.batchImportBaseProcessUnit(processUnitList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMProcessUnit processUnit : processUnitList){
				idList.add(processUnit.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序-工作单元表id，批量删除工序-工作单元表数据
	 * 
	 * @param 工序-工作单元表id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProcessUnit(
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
			
			List<RMProcessUnit> processUnitList = new ArrayList<RMProcessUnit>();
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
				
				RMProcessUnit processUnit = processUnitService.getProcessUnit(id);
				if(processUnit == null || !processUnit.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				processUnitList.add(processUnit);
				
				count ++;
			}
			for(RMProcessUnit processUnit : processUnitList){
				processUnitService.deleteProcessUnit(processUnit);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有工序-工作单元表数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMProcessUnit.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMProcessUnit.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMProcessUnit.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMProcessUnit.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMProcessUnit.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMProcessUnit> page = new Page<RMProcessUnit>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMProcessUnit> datas = processUnitService.getByPage(page, detachedCriteria);
			List<RMProcessUnit> processUnitList = datas.getResult();
			if (processUnitList == null || processUnitList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(processUnitList.toArray());
			PaginationDTO<RMProcessUnit> pagination = new PaginationDTO<RMProcessUnit>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到工序-工作单元表则返回空。
	 * @param processUnit
	 * @return
	 */
	private RMProcessUnit getProcessUnit(RMProcessUnit processUnit) {
		if (processUnit.getId() == null)
			throw new RuntimeException("id不能为空");
		RMProcessUnit result = processUnitService.getProcessUnit(processUnit.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果工序-工作单元表不存在，返回false；如果原来没有生产线-配方表对象，且修改的时候也没有配置生产线-配方表对象，则报错；如果配置的生产线-配方表对象不存在，则报错；
	 * @param processUnit
	 * @return 
	 */
	private boolean beforeUpdateProcessUnit(RMProcessUnit processUnit){
		if(processUnit.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		RMProcessUnit temp = getProcessUnit(processUnit);
		if(temp == null){
			return false;
		}
		processUnit.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMProcessUnit> clearProcessUnitNonMainField(List<RMProcessUnit> list){
		 List<RMProcessUnit> processUnitList = new ArrayList<RMProcessUnit>();
		 for(RMProcessUnit processUnit:list){
			 RMProcessUnit temp = new RMProcessUnit();
			 temp.setId(processUnit.getId());
		 	 processUnitList.add(temp);
		 }
		 return processUnitList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProcessUnitData(RMProcessUnit processUnit){
	}
	 
	//------------------------------------辅模型 WS  工作单元多选表-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据工作单元多选表业务主键分页查询工作单元多选表数据
	 * 
	 * @param 工作单元多选表业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitChoicePageByLineFormulaBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工作单元多选表跟生产线-配方表没有设置关联！");
	}
	/**
	 * 根据工作单元多选表id分页查询工作单元多选表数据
	 * 
	 * @param 工作单元多选表id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitChoicePageByLineFormulaPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工作单元多选表跟生产线-配方表没有设置关联！");
	}
	/**
	 * 根据工作单元多选表id分获取工作单元多选表数据
	 * 
	 * @param 工作单元多选表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitChoice(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMProcessUnitChoice processUnitChoice = processUnitChoiceService.getProcessUnitChoice(id);
			if(processUnitChoice == null){
				return set404Error(result);
			}
			setSuccessResult(result, processUnitChoice);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工作单元多选表业务id修改工作单元多选表数据
	 * 
	 * @param 工作单元多选表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProcessUnitChoice(
		@WebParam(name="processUnitChoice")RMProcessUnitChoice processUnitChoice,
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
			if(!beforeUpdateProcessUnitChoice(processUnitChoice)){
				return set404Error(result);
			}
			processUnitChoiceService.saveProcessUnitChoice(processUnitChoice, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增工作单元多选表
	 * 
	 * @param 工作单元多选表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProcessUnitChoice(
		@WebParam(name="processUnitChoice")RMProcessUnitChoice processUnitChoice,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(processUnitChoice == null){
				return set500Error(result, "工作单元多选表对象不能为空。");
			}
			if(processUnitChoice.getId() != null){
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
				checkProcessUnitChoiceData(processUnitChoice);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			processUnitChoiceService.saveProcessUnitChoice(processUnitChoice, null);
			Long processUnitChoiceId = processUnitChoice.getId();
			setSuccessResult(result, processUnitChoiceId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工作单元多选表id 删除工作单元多选表
	 * 
	 * @param 工作单元多选表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProcessUnitChoice(
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
			
			RMProcessUnitChoice processUnitChoice = null;
			try{
				processUnitChoice = processUnitChoiceService.getProcessUnitChoice(id);
			}catch(NullPointerException e){}
			if(processUnitChoice == null  || !processUnitChoice.isValid()){
				return set404Error(result);
			}
			processUnitChoiceService.deleteProcessUnitChoice(processUnitChoice);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改工作单元多选表数据，工作单元多选表id不能为空
	 *
	 * @param 工作单元多选表列表，每个工作单元多选表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProcessUnitChoice(
		@WebParam(name="processUnitChoiceList")List<RMProcessUnitChoice> processUnitChoiceList,
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
			for(RMProcessUnitChoice processUnitChoice : processUnitChoiceList){
				try{
					if(!beforeUpdateProcessUnitChoice(processUnitChoice)){
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
			
			processUnitChoiceService.batchImportBaseProcessUnitChoice(processUnitChoiceList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增工作单元多选表数据
	 * 
	 * @param 工作单元多选表列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProcessUnitChoice(
		@WebParam(name="processUnitChoiceList")List<RMProcessUnitChoice> processUnitChoiceList,
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
			
			if(processUnitChoiceList == null){
				set500Error(result, "processUnitChoiceList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMProcessUnitChoice processUnitChoice : processUnitChoiceList){
				if(processUnitChoice.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkProcessUnitChoiceData(processUnitChoice);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			processUnitChoiceService.batchImportBaseProcessUnitChoice(processUnitChoiceList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMProcessUnitChoice processUnitChoice : processUnitChoiceList){
				idList.add(processUnitChoice.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工作单元多选表id，批量删除工作单元多选表数据
	 * 
	 * @param 工作单元多选表id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProcessUnitChoice(
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
			
			List<RMProcessUnitChoice> processUnitChoiceList = new ArrayList<RMProcessUnitChoice>();
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
				
				RMProcessUnitChoice processUnitChoice = processUnitChoiceService.getProcessUnitChoice(id);
				if(processUnitChoice == null || !processUnitChoice.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				processUnitChoiceList.add(processUnitChoice);
				
				count ++;
			}
			for(RMProcessUnitChoice processUnitChoice : processUnitChoiceList){
				processUnitChoiceService.deleteProcessUnitChoice(processUnitChoice);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有工作单元多选表数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessUnitChoicePage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMProcessUnitChoice.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMProcessUnitChoice.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMProcessUnitChoice.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMProcessUnitChoice.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMProcessUnitChoice.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMProcessUnitChoice> page = new Page<RMProcessUnitChoice>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMProcessUnitChoice> datas = processUnitChoiceService.getByPage(page, detachedCriteria);
			List<RMProcessUnitChoice> processUnitChoiceList = datas.getResult();
			if (processUnitChoiceList == null || processUnitChoiceList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(processUnitChoiceList.toArray());
			PaginationDTO<RMProcessUnitChoice> pagination = new PaginationDTO<RMProcessUnitChoice>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到工作单元多选表则返回空。
	 * @param processUnitChoice
	 * @return
	 */
	private RMProcessUnitChoice getProcessUnitChoice(RMProcessUnitChoice processUnitChoice) {
		if (processUnitChoice.getId() == null)
			throw new RuntimeException("id不能为空");
		RMProcessUnitChoice result = processUnitChoiceService.getProcessUnitChoice(processUnitChoice.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果工作单元多选表不存在，返回false；如果原来没有生产线-配方表对象，且修改的时候也没有配置生产线-配方表对象，则报错；如果配置的生产线-配方表对象不存在，则报错；
	 * @param processUnitChoice
	 * @return 
	 */
	private boolean beforeUpdateProcessUnitChoice(RMProcessUnitChoice processUnitChoice){
		if(processUnitChoice.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		RMProcessUnitChoice temp = getProcessUnitChoice(processUnitChoice);
		if(temp == null){
			return false;
		}
		processUnitChoice.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMProcessUnitChoice> clearProcessUnitChoiceNonMainField(List<RMProcessUnitChoice> list){
		 List<RMProcessUnitChoice> processUnitChoiceList = new ArrayList<RMProcessUnitChoice>();
		 for(RMProcessUnitChoice processUnitChoice:list){
			 RMProcessUnitChoice temp = new RMProcessUnitChoice();
			 temp.setId(processUnitChoice.getId());
		 	 processUnitChoiceList.add(temp);
		 }
		 return processUnitChoiceList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProcessUnitChoiceData(RMProcessUnitChoice processUnitChoice){
	}
	 
	//------------------------------------辅模型 WS  工序活动-测点表-------------------------------------------------
	//--hasLink:false---link: // 如 果 你 看 到 这 句 话 说 明 辅 模 型 没 有 连 接 主 模 型  
	/**
	 * 根据工序活动-测点表业务主键分页查询工序活动-测点表数据
	 * 
	 * @param 工序活动-测点表业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessPointPageByLineFormulaBusinessKey(
		@WebParam(name="businessKey")String businessKey, 
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工序活动-测点表跟生产线-配方表没有设置关联！");
	}
	/**
	 * 根据工序活动-测点表id分页查询工序活动-测点表数据
	 * 
	 * @param 工序活动-测点表id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessPointPageByLineFormulaPk(	
		@WebParam(name="pk")String pk,
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		return set500Error(result, "工序活动-测点表跟生产线-配方表没有设置关联！");
	}
	/**
	 * 根据工序活动-测点表id分获取工序活动-测点表数据
	 * 
	 * @param 工序活动-测点表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessPoint(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			RMProcessPoint processPoint = processPointService.getProcessPoint(id);
			if(processPoint == null){
				return set404Error(result);
			}
			setSuccessResult(result, processPoint);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序活动-测点表业务id修改工序活动-测点表数据
	 * 
	 * @param 工序活动-测点表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateProcessPoint(
		@WebParam(name="processPoint")RMProcessPoint processPoint,
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
			if(!beforeUpdateProcessPoint(processPoint)){
				return set404Error(result);
			}
			processPointService.saveProcessPoint(processPoint, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增工序活动-测点表
	 * 
	 * @param 工序活动-测点表对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addProcessPoint(
		@WebParam(name="processPoint")RMProcessPoint processPoint,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(processPoint == null){
				return set500Error(result, "工序活动-测点表对象不能为空。");
			}
			if(processPoint.getId() != null){
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
				checkProcessPointData(processPoint);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			
			processPointService.saveProcessPoint(processPoint, null);
			Long processPointId = processPoint.getId();
			setSuccessResult(result, processPointId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序活动-测点表id 删除工序活动-测点表
	 * 
	 * @param 工序活动-测点表id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteProcessPoint(
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
			
			RMProcessPoint processPoint = null;
			try{
				processPoint = processPointService.getProcessPoint(id);
			}catch(NullPointerException e){}
			if(processPoint == null  || !processPoint.isValid()){
				return set404Error(result);
			}
			processPointService.deleteProcessPoint(processPoint);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改工序活动-测点表数据，工序活动-测点表id不能为空
	 *
	 * @param 工序活动-测点表列表，每个工序活动-测点表必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateProcessPoint(
		@WebParam(name="processPointList")List<RMProcessPoint> processPointList,
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
			for(RMProcessPoint processPoint : processPointList){
				try{
					if(!beforeUpdateProcessPoint(processPoint)){
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
			
			processPointService.batchImportBaseProcessPoint(processPointList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增工序活动-测点表数据
	 * 
	 * @param 工序活动-测点表列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddProcessPoint(
		@WebParam(name="processPointList")List<RMProcessPoint> processPointList,
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
			
			if(processPointList == null){
				set500Error(result, "processPointList不能为空。");
				return result;
			}
			
			int count = 1;
			for(RMProcessPoint processPoint : processPointList){
				if(processPoint.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				
				try{
					checkProcessPointData(processPoint);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			processPointService.batchImportBaseProcessPoint(processPointList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(RMProcessPoint processPoint : processPointList){
				idList.add(processPoint.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据工序活动-测点表id，批量删除工序活动-测点表数据
	 * 
	 * @param 工序活动-测点表id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelProcessPoint(
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
			
			List<RMProcessPoint> processPointList = new ArrayList<RMProcessPoint>();
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
				
				RMProcessPoint processPoint = processPointService.getProcessPoint(id);
				if(processPoint == null || !processPoint.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				processPointList.add(processPoint);
				
				count ++;
			}
			for(RMProcessPoint processPoint : processPointList){
				processPointService.deleteProcessPoint(processPoint);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有工序活动-测点表数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getProcessPointPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(RMProcessPoint.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), RMProcessPoint.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(RMProcessPoint.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,RMProcessPoint.class);
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
				detachedCriteria = DetachedCriteria.forClass(RMProcessPoint.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<RMProcessPoint> page = new Page<RMProcessPoint>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<RMProcessPoint> datas = processPointService.getByPage(page, detachedCriteria);
			List<RMProcessPoint> processPointList = datas.getResult();
			if (processPointList == null || processPointList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(processPointList.toArray());
			PaginationDTO<RMProcessPoint> pagination = new PaginationDTO<RMProcessPoint>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到工序活动-测点表则返回空。
	 * @param processPoint
	 * @return
	 */
	private RMProcessPoint getProcessPoint(RMProcessPoint processPoint) {
		if (processPoint.getId() == null)
			throw new RuntimeException("id不能为空");
		RMProcessPoint result = processPointService.getProcessPoint(processPoint.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果工序活动-测点表不存在，返回false；如果原来没有生产线-配方表对象，且修改的时候也没有配置生产线-配方表对象，则报错；如果配置的生产线-配方表对象不存在，则报错；
	 * @param processPoint
	 * @return 
	 */
	private boolean beforeUpdateProcessPoint(RMProcessPoint processPoint){
		if(processPoint.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		RMProcessPoint temp = getProcessPoint(processPoint);
		if(temp == null){
			return false;
		}
		processPoint.setVersion(temp.getVersion());
		return true;
	}
	
	private List<RMProcessPoint> clearProcessPointNonMainField(List<RMProcessPoint> list){
		 List<RMProcessPoint> processPointList = new ArrayList<RMProcessPoint>();
		 for(RMProcessPoint processPoint:list){
			 RMProcessPoint temp = new RMProcessPoint();
			 temp.setId(processPoint.getId());
		 	 processPointList.add(temp);
		 }
		 return processPointList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkProcessPointData(RMProcessPoint processPoint){
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
	 * 获取生产线-配方表对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param lineFormula
	 * @return
	 */
	private RMLineFormula getLineFormula(RMLineFormula lineFormula) {
		if (lineFormula.getId() == null && (lineFormula.getId() == null || lineFormula.getId().toString().trim() == ""))
			throw new RuntimeException("生产线-配方表对象业务主键和id不能同时为空");
		if (lineFormula.getId() != null) {
			RMLineFormula result = lineFormulaService.getLineFormula(lineFormula .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return lineFormulaService.loadLineFormulaByBussinessKey(lineFormula.getId());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个生产线-配方表，则返回false，否则返回true
	 * @param lineFormula
	 */
	private boolean beforeUpdateLineFormula(RMLineFormula lineFormula) {
		RMLineFormula temp = getLineFormula(lineFormula);
		if (temp == null) {
			return false;
		}
		if(lineFormula.getId() == null){
			lineFormula.setId(temp.getId());		
		}
		if(lineFormula.getId() == null){
			lineFormula.setId(temp.getId());
		}
		
		lineFormula.setVersion(temp.getVersion());
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
	 * 清除生产线-配方表对象下所有辅模型对象中的生产线-配方表对象
	 * @param lineFormula
	 */
	private void clearCircle(RMLineFormula lineFormula) {
	
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
	private void checkLineFormulaData(RMLineFormula lineFormula){
	}
	
	/* CUSTOM CODE START(wsserviceimpl,functions,RM_7.5.0.0_suitedLine_LineFormula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}