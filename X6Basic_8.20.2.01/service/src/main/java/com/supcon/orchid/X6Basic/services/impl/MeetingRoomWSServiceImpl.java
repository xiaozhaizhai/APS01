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
import com.supcon.orchid.X6Basic.services.MeetingRoomWSService;
import com.supcon.orchid.X6Basic.services.MeetingRoomService;
import com.supcon.orchid.X6Basic.services.UsedRecordService;
/* CUSTOM CODE START(wsserviceimpl,import,X6Basic_1.0_meetingroom_MeetingRoom,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
@WebService(name="MeetingRoom",targetNamespace = "http://ws.supcon.com")
public class MeetingRoomWSServiceImpl implements MeetingRoomWSService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BAPJAXBProvider xmlProvider ; 
	@Resource
	private ConditionService conditionService;
	@Resource
	private MeetingRoomService meetingRoomService;
	@Resource
	private StaffService staffService;
	@Resource
	private CompanyStaffService companyStaffService;
	
	@Resource
	private UsedRecordService usedRecordService;
//--------------------------------------主模型WS--------------------------------
	/**
	 * 根据业务主键获取会议室管理数据
	 * @param 业务主键
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMeetingRoomByBusinessKey(
		@WebParam(name="businessKey")String businessKey) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(businessKey == null){
				return set500Error(result, "业务主键不能为空。");
			}
			
			MeetingRoom meetingRoom = meetingRoomService.loadMeetingRoomByBussinessKey(businessKey);
			if(meetingRoom == null){
				return set404Error(result);
			}
			//添加辅模型
			List<UsedRecord> usedRecordList = clearUsedRecordNonMainField(meetingRoomService.getUsedRecordList(meetingRoom));
			meetingRoom.setUsedRecordList(usedRecordList);
			
			setSuccessResult(result, meetingRoom);
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据id获取会议室管理数据
	 * @param primary key
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMeetingRoomByPk(
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
			
			MeetingRoom meetingRoom = meetingRoomService.getMeetingRoom(id);
			if(meetingRoom == null || !meetingRoom.isValid()){
				return set404Error(result);
			}
			
			//添加辅模型
			List<UsedRecord> usedRecordList = clearUsedRecordNonMainField(meetingRoomService.getUsedRecordList(meetingRoom));
			meetingRoom.setUsedRecordList(usedRecordList);
			setSuccessResult(result, meetingRoom);
			
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 修改会议室管理数据
	 * @param 会议室管理对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateMeetingRoom(
		@WebParam(name="meetingRoom")MeetingRoom meetingRoom,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(meetingRoom == null){
				return set500Error(result, "会议室管理不能为空。");
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
			
			if(!beforeUpdateMeetingRoom(meetingRoom)){
				return set404Error(result);
			}
			meetingRoomService.saveMeetingRoom(meetingRoom, null);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addMeetingRoom(
		@WebParam(name="meetingRoom")MeetingRoom meetingRoom,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try{
			if(meetingRoom == null){
				return set500Error(result, "会议室管理不能为空。");
			}
		
			if(meetingRoom.getId() != null){
				return set500Error(result, "新增方法不能设置id。");
			}
			if(meetingRoom.getId() == null){
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
				checkMeetingRoomData(meetingRoom);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			meetingRoomService.saveMeetingRoom(meetingRoom, null);
			setSuccessResult(result, meetingRoom.getId());
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override

	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteMeetingRoomByBusinessKey(
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
			MeetingRoom meetingRoom = null;
			try{
				meetingRoom = meetingRoomService.loadMeetingRoomByBussinessKey(businessKey);
			}catch(NullPointerException e){}
			if(meetingRoom == null){
				return set404Error(result);
			}
			meetingRoomService.deleteMeetingRoom(meetingRoom);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override//
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteMeetingRoomByPk(
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
			MeetingRoom meetingRoom = null;
			try{
				meetingRoom = meetingRoomService.getMeetingRoom(id);
			}catch(NullPointerException e){}
			if(meetingRoom == null || !meetingRoom.isValid()){
				return set404Error(result);
			}
			meetingRoomService.deleteMeetingRoom(meetingRoom);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddMeetingRoom(
		@WebParam(name="meetingRoomList")List<MeetingRoom> meetingRoomList,
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
			for(MeetingRoom meetingRoom : meetingRoomList){
				if(meetingRoom.getId() != null){
					set500Error(result, "第"+count+"条数据出错： 添加操作，不能配置id。");
					return result;
				}
				if(meetingRoom.getId() == null || meetingRoom.getId().toString().trim().isEmpty()){
					set500Error(result, "第"+count+"条数据出错： 业务主键不能为空。");
					return result;
				}
				
				try{
					checkMeetingRoomData(meetingRoom);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
					
				count++;
			}
			
			List<Long> idList = new ArrayList<Long>();
			
			meetingRoomService.batchImportBaseMeetingRoom(meetingRoomList);
			for(MeetingRoom meetingRoom : meetingRoomList){
				idList.add(meetingRoom.getId());
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
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateMeetingRoom(
		@WebParam(name="meetingRoomList")List<MeetingRoom> meetingRoomList,
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
			for(MeetingRoom meetingRoom : meetingRoomList){
				try{
					if(!beforeUpdateMeetingRoom(meetingRoom)){
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
			meetingRoomService.batchImportBaseMeetingRoom(meetingRoomList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteMeetingRoomByPk(
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
				MeetingRoom temp = null;
				try{
					temp = meetingRoomService.getMeetingRoom(id);
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("第"+count+"条数据不存在:"+k);
					result.setStatusCode("404");
					return result;
				}
				count ++;
			}
			
			meetingRoomService.deleteMeetingRoom(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
	
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDeleteMeetingRoomByBusinessKey(
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
				MeetingRoom temp = null;
				try{
					temp = meetingRoomService.loadMeetingRoomByBussinessKey(businessKey.get(i));
				}catch(NullPointerException e){}
				if(temp == null || !temp.isValid()){
					result.setErrorMessage("找不到第"+(i+1)+"条数据："+businessKey.get(i));
					result.setStatusCode("404");
					return result;
				}
				idList.add(temp.getId());
			}
			meetingRoomService.deleteMeetingRoom(idList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	
		
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getMeetingRoomPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(MeetingRoom.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter),MeetingRoom.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(MeetingRoom.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,MeetingRoom.class);
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
				detachedCriteria = DetachedCriteria.forClass(MeetingRoom.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<MeetingRoom> page = new Page<MeetingRoom>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<MeetingRoom> datas = meetingRoomService.getByPage(page, detachedCriteria);
			List<MeetingRoom> meetingRoomList = datas.getResult();
			if (meetingRoomList == null || meetingRoomList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(meetingRoomList.toArray());
			PaginationDTO<MeetingRoom> pagination = new PaginationDTO<MeetingRoom>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	/**
	 * 根据会议室管理业务主键查询会议室管理下所有辅模型
	 * @param 会议室管理业务主键
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
			MeetingRoom meetingRoom = meetingRoomService.loadMeetingRoomByBussinessKey(businessKey);
			if (meetingRoom == null) {
				set404Error(result);
				return result;
			}
				
			
			
			
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap usedRecordMap = new SimulationMap();
			usedRecordMap.setName(InternationalResource.get("UsedRecord"));
			usedRecordMap.setList(meetingRoomService.getUsedRecordList(meetingRoom));
			resultList.add(usedRecordMap);
			
			clearCircle(meetingRoom);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据会议室管理id查询会议室管理下所有辅模型
	 * 
	 * @param 会议室管理id
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
			MeetingRoom meetingRoom = meetingRoomService.getMeetingRoom(id);
			if (meetingRoom == null || !meetingRoom.isValid()) {
				result.setErrorMessage("找不到会议室管理");
				result.setStatusCode("404");
				return result;
			}
				
			List<SimulationMap> resultList = new ArrayList<SimulationMap>();
			
			SimulationMap usedRecordMap = new SimulationMap();
			usedRecordMap.setName(InternationalResource.get("UsedRecord"));
			usedRecordMap.setList(meetingRoomService.getUsedRecordList(meetingRoom));
			resultList.add(usedRecordMap);
			
			clearCircle(meetingRoom);
			result.setResult(resultList);
			result.setStatusCode("200");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	
	//------------------------------------辅模型 WS  会议室使用记录-------------------------------------------------
	//--hasLink:true---link:Meeting
	/**
	 * 根据会议室使用记录业务主键分页查询会议室使用记录数据
	 * 
	 * @param 会议室使用记录业务主键
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getUsedRecordPageByMeetingRoomBusinessKey(
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
				detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), UsedRecord.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}
			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,UsedRecord.class);
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
				detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			
			MeetingRoom meetingRoom = meetingRoomService.loadMeetingRoomByBussinessKey(businessKey);
			if (meetingRoom == null) {
				return set500Error(result, "该业务主键的会议室管理不存在： " + businessKey);
			}
			detachedCriteria.add(Restrictions.eq("meeting",meetingRoom));
			Page<UsedRecord> page = new Page<UsedRecord>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<UsedRecord> datas = usedRecordService.getByPage(page, detachedCriteria);
			List<UsedRecord> usedRecordList = datas.getResult();
			if (usedRecordList == null || usedRecordList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(usedRecordList.toArray());
			PaginationDTO<UsedRecord> pagination = new PaginationDTO<UsedRecord>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
			
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据会议室使用记录id分页查询会议室使用记录数据
	 * 
	 * @param 会议室使用记录id
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getUsedRecordPageByMeetingRoomPk(	
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
				detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(
							new JSONObject(filter), UsedRecord.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
				}
				
				try {
					FilterUtils.validateOrderByCondition(orderBy,UsedRecord.class);
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
				detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Long id = null;
			try {
				id = Long.parseLong(pk);
			} catch (NumberFormatException e) {
				return set500Error(result, "pk不是一个Long型数字: " + pk);
			}
			MeetingRoom meetingRoom = meetingRoomService.getMeetingRoom(id);
			if (meetingRoom == null) {
				return set500Error(result, "该主键的会议室管理不存在： " + id);
			}
			detachedCriteria.add(Restrictions.eq("meeting",meetingRoom));
			Page<UsedRecord> page = new Page<UsedRecord>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<UsedRecord> datas = usedRecordService.getByPage(page, detachedCriteria);
			List<UsedRecord> usedRecordList = datas.getResult();
			if (usedRecordList == null || usedRecordList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(usedRecordList.toArray());
			PaginationDTO<UsedRecord> pagination = new PaginationDTO<UsedRecord>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据会议室使用记录id分获取会议室使用记录数据
	 * 
	 * @param 会议室使用记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getUsedRecord(
		@WebParam(name="pk")String pk) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			Long id = Long.parseLong(pk);
			UsedRecord usedRecord = usedRecordService.getUsedRecord(id);
			if(usedRecord == null){
				return set404Error(result);
			}
			setSuccessResult(result, usedRecord);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据会议室使用记录业务id修改会议室使用记录数据
	 * 
	 * @param 会议室使用记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO updateUsedRecord(
		@WebParam(name="usedRecord")UsedRecord usedRecord,
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
			if(!beforeUpdateUsedRecord(usedRecord)){
				return set404Error(result);
			}
			usedRecordService.saveUsedRecord(usedRecord, null);
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 新增会议室使用记录
	 * 
	 * @param 会议室使用记录对象
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO addUsedRecord(
		@WebParam(name="usedRecord")UsedRecord usedRecord,
		@WebParam(name="ownerStaffUUID")String ownerStaffUUID) {
			
		JWSResultDTO result = new JWSResultDTO();
		try {
			if(usedRecord == null){
				return set500Error(result, "会议室使用记录对象不能为空。");
			}
			if(usedRecord.getId() != null){
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
				checkUsedRecordData(usedRecord);
			}catch(RuntimeException e){
				return set500Error(result, e.getMessage());
			}
			
			MeetingRoom tempMeetingRoom = usedRecord.getMeeting();
			if (tempMeetingRoom == null) {
				return set500Error(result, "会议室管理对象不能为空");
			}
			
			MeetingRoom meetingRoom = null;
			if(tempMeetingRoom.getId()!= null){
				meetingRoom = meetingRoomService.getMeetingRoom(tempMeetingRoom.getId());
			}else if(tempMeetingRoom.getId() != null){
				meetingRoom = meetingRoomService.loadMeetingRoomByBussinessKey(tempMeetingRoom.getId());
			}else{
				return set500Error(result, "会议室管理对象必须设置id或业务主键。");
			}
			
			if(meetingRoom == null){
				return set404Error(result);
			}
			usedRecord.setMeeting(meetingRoom);
			
			usedRecordService.saveUsedRecord(usedRecord, null);
			Long usedRecordId = usedRecord.getId();
			setSuccessResult(result, usedRecordId);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据会议室使用记录id 删除会议室使用记录
	 * 
	 * @param 会议室使用记录id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO deleteUsedRecord(
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
			
			UsedRecord usedRecord = null;
			try{
				usedRecord = usedRecordService.getUsedRecord(id);
			}catch(NullPointerException e){}
			if(usedRecord == null  || !usedRecord.isValid()){
				return set404Error(result);
			}
			usedRecordService.deleteUsedRecord(usedRecord);
			
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量修改会议室使用记录数据，会议室使用记录id不能为空
	 *
	 * @param 会议室使用记录列表，每个会议室使用记录必须包含ownerStaffUUID,业务主键（BAP未实现）或者id
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchUpdateUsedRecord(
		@WebParam(name="usedRecordList")List<UsedRecord> usedRecordList,
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
			for(UsedRecord usedRecord : usedRecordList){
				try{
					if(!beforeUpdateUsedRecord(usedRecord)){
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
			
			usedRecordService.batchImportBaseUsedRecord(usedRecordList);
			setSuccessResult(result, "SUCCESS");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 批量新增会议室使用记录数据
	 * 
	 * @param 会议室使用记录列表
	 * @param ownerStaffUUID
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSListResultDTO batchAddUsedRecord(
		@WebParam(name="usedRecordList")List<UsedRecord> usedRecordList,
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
			
			if(usedRecordList == null){
				set500Error(result, "usedRecordList不能为空。");
				return result;
			}
			
			int count = 1;
			for(UsedRecord usedRecord : usedRecordList){
				if(usedRecord.getId() != null){
					set500Error(result, "第"+count+"条数据出错：新增操作不能添加id。");
					return result;
				}
				try{
					if(usedRecord.getMeeting() == null){
						set500Error(result, "第"+count+"条数据出错：会议室管理对象不能为空。");
						return result;
					}
					MeetingRoom meetingRoom = getMeetingRoom(usedRecord.getMeeting());
					if(meetingRoom == null){
						set500Error(result, "第"+count+"条数据出错：会议室管理对象不存在。");
						return result;
					}
					usedRecord.setMeeting(meetingRoom);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				try{
					checkUsedRecordData(usedRecord);
				}catch(RuntimeException e){
					set500Error(result, "第"+count+"条数据出错："+e.getMessage());
					return result;
				}
				
				count++;
			}
			
			usedRecordService.batchImportBaseUsedRecord(usedRecordList);
			//获取id
			List<Long> idList = new ArrayList<Long>();
			for(UsedRecord usedRecord : usedRecordList){
				idList.add(usedRecord.getId());
			}
			result.setResult(idList);
			result.setStatusCode("200");
		}catch(Throwable t){
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 根据会议室使用记录id，批量删除会议室使用记录数据
	 * 
	 * @param 会议室使用记录id列表
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO batchDelUsedRecord(
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
			
			List<UsedRecord> usedRecordList = new ArrayList<UsedRecord>();
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
				
				UsedRecord usedRecord = usedRecordService.getUsedRecord(id);
				if(usedRecord == null || !usedRecord.isValid()){
					result.setErrorMessage("第"+count+"条不存在");
					result.setStatusCode("404");
					return result;
				}
				usedRecordList.add(usedRecord);
				
				count ++;
			}
			for(UsedRecord usedRecord : usedRecordList){
				usedRecordService.deleteUsedRecord(usedRecord);
			}
			setSuccessResult(result, "SUCCESS");
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	/**
	 * 分页查询所有会议室使用记录数据
	 * 
	 * @param 分页查询参数
	 * @return jws返回对象
	 */
	@Override
	@WebMethod
	@WebResult(name="jwsResult")public JWSResultDTO getUsedRecordPage(
		@WebParam(name="pageParam")PageParamDTO pageParam) {
			
		JWSResultDTO result = new JWSResultDTO();
		preparePageParam(pageParam);
		DetachedCriteria detachedCriteria = null;
		try {
			String filter = pageParam.getFilter();
			String orderBy = pageParam.getOrderBy();
			// 解析filter
			if (filter != null && !filter.isEmpty()) {
				detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
				try {
					detachedCriteria.add(FilterUtils.generateCondition(new JSONObject(filter), UsedRecord.class));
				} catch (Exception e) {
					return set500Error(result, "解析过滤条件失败： " + e.getMessage());
				}

			}
			
			// 解析orderby
			if (orderBy != null && !orderBy.isEmpty()) {
				if(detachedCriteria == null){
					detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
				}
				try {
					FilterUtils.validateOrderByCondition(orderBy,UsedRecord.class);
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
				detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
			}
			detachedCriteria.add(Restrictions.eq("valid", true));
			Page<UsedRecord> page = new Page<UsedRecord>(pageParam.getPageNo(), pageParam.getPageSize());
			if (!pageParam.isCount()) {
				page.setAutoCount(false);
			}
			Page<UsedRecord> datas = usedRecordService.getByPage(page, detachedCriteria);
			List<UsedRecord> usedRecordList = datas.getResult();
			if (usedRecordList == null || usedRecordList.isEmpty()) {
				set404Error(result);
				return result;
			}
			PageValueDTO pageValue = new PageValueDTO();
			pageValue.setData(usedRecordList.toArray());
			PaginationDTO<UsedRecord> pagination = new PaginationDTO<UsedRecord>(page);
			pageValue.setPagination(pagination);
			setSuccessResult(result, pageValue);
		} catch (Throwable t) {
			setSysError(result, t);
		}
		return result;
	}
	
	/**
	 * 获取辅模型，必须含有id，否则报错；如果找到会议室使用记录则返回空。
	 * @param usedRecord
	 * @return
	 */
	private UsedRecord getUsedRecord(UsedRecord usedRecord) {
		if (usedRecord.getId() == null)
			throw new RuntimeException("id不能为空");
		UsedRecord result = usedRecordService.getUsedRecord(usedRecord.getId());
		if(result.isValid())
			return result;
		return null;
	}
	
	/**
	 * 如果会议室使用记录不存在，返回false；如果原来没有会议室管理对象，且修改的时候也没有配置会议室管理对象，则报错；如果配置的会议室管理对象不存在，则报错；
	 * @param usedRecord
	 * @return 
	 */
	private boolean beforeUpdateUsedRecord(UsedRecord usedRecord){
		if(usedRecord.getId() == null){
			throw new RuntimeException("id不能为空。");
		}
		if(usedRecord.getTypeId() == null){
			throw new RuntimeException("typeId不能为空。");
		}
		UsedRecord temp = getUsedRecord(usedRecord);
		if(temp == null){
			return false;
		}
		MeetingRoom meetingRoom = null;
		if (temp.getMeeting() == null) {
			if (usedRecord.getMeeting() == null || (usedRecord.getMeeting().getId() == null && usedRecord.getMeeting().getId() == null)) {
				throw new RuntimeException("原数据没有配置主模型，请为其配置主模型。");
			} else {
				meetingRoom = getMeetingRoom(usedRecord.getMeeting());
				if(meetingRoom == null){
					throw new RuntimeException("原数据没有配置主模型，且找不到当前设置的主模型。");
				}
			}
		} else {
			if (usedRecord.getMeeting() == null || (usedRecord.getMeeting().getId() == null && usedRecord.getMeeting().getId() == null)) {
				meetingRoom = temp.getMeeting();
			} else {
				meetingRoom = getMeetingRoom(usedRecord.getMeeting());
				if (meetingRoom == null) {
					throw new RuntimeException("找不到当前设置的主模型。");
				}
			}
		}
		usedRecord.setMeeting(meetingRoom);
		usedRecord.setVersion(temp.getVersion());
		return true;
	}
	
	private List<UsedRecord> clearUsedRecordNonMainField(List<UsedRecord> list){
		 List<UsedRecord> usedRecordList = new ArrayList<UsedRecord>();
		 for(UsedRecord usedRecord:list){
			 UsedRecord temp = new UsedRecord();
			 temp.setId(usedRecord.getId());
		 	 usedRecordList.add(temp);
		 }
		 return usedRecordList;
	 }
	 /**
	  * 如果有除主键外的不可空字段为null则抛出异常
	  */
	 private void checkUsedRecordData(UsedRecord usedRecord){
		 if(usedRecord.getTypeId() == null){
		 	throw new RuntimeException("typeId不能为空。");
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
	 * 获取会议室管理对象，必须要有业务主键或id，如果业务主键和id都为空，则抛出异常；如果找不到结果，则返回null。
	 * @param meetingRoom
	 * @return
	 */
	private MeetingRoom getMeetingRoom(MeetingRoom meetingRoom) {
		if (meetingRoom.getId() == null && (meetingRoom.getId() == null || meetingRoom.getId().toString().trim() == ""))
			throw new RuntimeException("会议室管理对象业务主键和id不能同时为空");
		if (meetingRoom.getId() != null) {
			MeetingRoom result = meetingRoomService.getMeetingRoom(meetingRoom .getId());
			if(result.isValid()){
				return result;
			}
			return null;
		}else {
			return meetingRoomService.loadMeetingRoomByBussinessKey(meetingRoom.getId());
		}
	}
	
	/**
	 * 自动填充id或业务主键，如果有其他必填项没填，则抛出异常;如果系统中没有这个会议室管理，则返回false，否则返回true
	 * @param meetingRoom
	 */
	private boolean beforeUpdateMeetingRoom(MeetingRoom meetingRoom) {
		MeetingRoom temp = getMeetingRoom(meetingRoom);
		if (temp == null) {
			return false;
		}
		if(meetingRoom.getId() == null){
			meetingRoom.setId(temp.getId());		
		}
		if(meetingRoom.getId() == null){
			meetingRoom.setId(temp.getId());
		}
		
		meetingRoom.setVersion(temp.getVersion());
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
	 * 清除会议室管理对象下所有辅模型对象中的会议室管理对象
	 * @param meetingRoom
	 */
	private void clearCircle(MeetingRoom meetingRoom) {
		if (meetingRoom.getUsedRecordList() != null && meetingRoom.getUsedRecordList().size() > 0) {
			for (UsedRecord usedRecord : meetingRoom.getUsedRecordList()) {
				usedRecord.setMeeting(null);
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
	private void checkMeetingRoomData(MeetingRoom meetingRoom){
	}
	/* CUSTOM CODE START(wsserviceimpl,functions,X6Basic_1.0_meetingroom_MeetingRoom,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}