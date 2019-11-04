package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicSyncLogCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicSyncLogService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_syncLog_SyncLog,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicSyncLogCxfService")
@Transactional
public class X6BasicSyncLogCxfServiceImpl implements X6BasicSyncLogCxfService {
	
	@Resource
	private X6BasicSyncLogService syncLogService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_syncLog_list")
	public X6BasicSyncLog getSyncLog(long id){
		X6BasicSyncLog syncLog = syncLogService.getSyncLog(id);
		return syncLog;
	}
	
	@Override
	
	public void updateSyncLog(long id, X6BasicSyncLog syncLog) {
		// TODO Auto-generated method stub
		syncLog.setId(id);
		syncLogService.saveSyncLog(syncLog,null,null,null);
	}

	@Override
	
	public void createSyncLog(X6BasicSyncLog syncLog) {
		// TODO Auto-generated method stub
		syncLogService.saveSyncLog(syncLog,null,null,null);
	}

	@Override
	
	public void deleteSyncLog(long id) {
		// TODO Auto-generated method stub
		X6BasicSyncLog syncLog = syncLogService.getSyncLog(id);
		syncLogService.deleteSyncLog(syncLog);
	}
	
	@Override
	public ArrayList<X6BasicSyncLog> getSyncLogList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"syncLog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicSyncLog> list = syncLogService.getSyncLogs(customer, customerValue);
		 
		return (ArrayList<X6BasicSyncLog>) list;
	}

	@Override
	
	public void SyncLogList(ArrayList<X6BasicSyncLog> syncLogs) {
		// TODO Auto-generated method stub
		for(X6BasicSyncLog syncLog : syncLogs){
			X6BasicSyncLog old = syncLogService.loadSyncLogByBussinessKey(syncLog);
			if(old!=null){
				syncLog.setId(old.getId());
				syncLog.setVersion(old.getVersion());
			}
			syncLogService.mergeSyncLog(syncLog, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicSyncLog> getSyncLogPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"syncLog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicSyncLog> page = new Page<X6BasicSyncLog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicSyncLog> list = syncLogService.getSyncLogs(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicSyncLog> getSyncLogPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"syncLog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicSyncLog> page = new Page<X6BasicSyncLog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicSyncLog> list = syncLogService.getSyncLogs(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_syncLog_SyncLog,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}