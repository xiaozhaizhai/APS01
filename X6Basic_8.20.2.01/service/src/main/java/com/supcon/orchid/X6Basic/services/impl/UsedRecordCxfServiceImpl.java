package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.UsedRecordCxfService;
import com.supcon.orchid.X6Basic.services.UsedRecordService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("usedRecordCxfService")
@Transactional
public class UsedRecordCxfServiceImpl implements UsedRecordCxfService {
	
	@Resource
	private UsedRecordService usedRecordService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public UsedRecord getUsedRecord(long id){
		UsedRecord usedRecord = usedRecordService.getUsedRecord(id);
		return usedRecord;
	}
	
	@Override
	
	public void updateUsedRecord(long id, UsedRecord usedRecord) {
		// TODO Auto-generated method stub
		usedRecord.setId(id);
		usedRecordService.saveUsedRecord(usedRecord,null,null,null);
	}

	@Override
	
	public void createUsedRecord(UsedRecord usedRecord) {
		// TODO Auto-generated method stub
		usedRecordService.saveUsedRecord(usedRecord,null,null,null);
	}

	@Override
	
	public void deleteUsedRecord(long id) {
		// TODO Auto-generated method stub
		UsedRecord usedRecord = usedRecordService.getUsedRecord(id);
		usedRecordService.deleteUsedRecord(usedRecord);
	}
	
	@Override
	public ArrayList<UsedRecord> getUsedRecordList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"usedRecord\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<UsedRecord> list = usedRecordService.getUsedRecords(customer, customerValue);
		 
		return (ArrayList<UsedRecord>) list;
	}

	@Override
	
	public void UsedRecordList(ArrayList<UsedRecord> usedRecords) {
		// TODO Auto-generated method stub
		for(UsedRecord usedRecord : usedRecords){
			UsedRecord old = usedRecordService.loadUsedRecordByBussinessKey(usedRecord);
			if(old!=null){
				usedRecord.setId(old.getId());
				usedRecord.setVersion(old.getVersion());
			}
			usedRecordService.mergeUsedRecord(usedRecord, null,null,null);
		}
	}
	
	@Override
	public Page<UsedRecord> getUsedRecordPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"usedRecord\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<UsedRecord> page = new Page<UsedRecord>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<UsedRecord> list = usedRecordService.getUsedRecords(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<UsedRecord> getUsedRecordPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"usedRecord\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<UsedRecord> page = new Page<UsedRecord>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<UsedRecord> list = usedRecordService.getUsedRecords(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}