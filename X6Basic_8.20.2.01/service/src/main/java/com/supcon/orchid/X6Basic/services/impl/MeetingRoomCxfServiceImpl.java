package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.MeetingRoomCxfService;
import com.supcon.orchid.X6Basic.services.MeetingRoomService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_meetingroom_MeetingRoom,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("meetingRoomCxfService")
@Transactional
public class MeetingRoomCxfServiceImpl implements MeetingRoomCxfService {
	
	@Resource
	private MeetingRoomService meetingRoomService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_meetingroom_list")
	public MeetingRoom getMeetingRoom(long id){
		MeetingRoom meetingRoom = meetingRoomService.getMeetingRoom(id);
		return meetingRoom;
	}
	
	@Override
	@BAPPermission("X6Basic_1.0_meetingroom_list_BUTTON_modify")
	public void updateMeetingRoom(long id, MeetingRoom meetingRoom) {
		// TODO Auto-generated method stub
		meetingRoom.setId(id);
		meetingRoomService.saveMeetingRoom(meetingRoom,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_meetingroom_list_BUTTON_add")
	public void createMeetingRoom(MeetingRoom meetingRoom) {
		// TODO Auto-generated method stub
		meetingRoomService.saveMeetingRoom(meetingRoom,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_meetingroom_list_BUTTON_del")
	public void deleteMeetingRoom(long id) {
		// TODO Auto-generated method stub
		MeetingRoom meetingRoom = meetingRoomService.getMeetingRoom(id);
		meetingRoomService.deleteMeetingRoom(meetingRoom);
	}
	
	@Override
	public ArrayList<MeetingRoom> getMeetingRoomList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"meetingRoom\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MeetingRoom> list = meetingRoomService.getMeetingRooms(customer, customerValue);
		 
		return (ArrayList<MeetingRoom>) list;
	}

	@Override
	@BAPPermission("X6Basic_1.0_meetingroom_list_BUTTON_add")
	public void MeetingRoomList(ArrayList<MeetingRoom> meetingRooms) {
		// TODO Auto-generated method stub
		for(MeetingRoom meetingRoom : meetingRooms){
			MeetingRoom old = meetingRoomService.loadMeetingRoomByBussinessKey(meetingRoom);
			if(old!=null){
				meetingRoom.setId(old.getId());
				meetingRoom.setVersion(old.getVersion());
			}
			meetingRoomService.mergeMeetingRoom(meetingRoom, null,null,null);
		}
	}
	
	@Override
	public Page<MeetingRoom> getMeetingRoomPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"meetingRoom\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MeetingRoom> page = new Page<MeetingRoom>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MeetingRoom> list = meetingRoomService.getMeetingRooms(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MeetingRoom> getMeetingRoomPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"meetingRoom\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MeetingRoom> page = new Page<MeetingRoom>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MeetingRoom> list = meetingRoomService.getMeetingRooms(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_meetingroom_MeetingRoom,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}