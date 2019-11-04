package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicSyncConfigsCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicSyncConfigsService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_syncConfig_SyncConfigs,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicSyncConfigsCxfService")
@Transactional
public class X6BasicSyncConfigsCxfServiceImpl implements X6BasicSyncConfigsCxfService {
	
	@Resource
	private X6BasicSyncConfigsService syncConfigsService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_syncConfig_list")
	public X6BasicSyncConfigs getSyncConfigs(long id){
		X6BasicSyncConfigs syncConfigs = syncConfigsService.getSyncConfigs(id);
		return syncConfigs;
	}
	
	@Override
	@BAPPermission("X6Basic_1.0_syncConfig_list_BUTTON_modify")
	public void updateSyncConfigs(long id, X6BasicSyncConfigs syncConfigs) {
		// TODO Auto-generated method stub
		syncConfigs.setId(id);
		syncConfigsService.saveSyncConfigs(syncConfigs,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_syncConfig_list_BUTTON_add")
	public void createSyncConfigs(X6BasicSyncConfigs syncConfigs) {
		// TODO Auto-generated method stub
		syncConfigsService.saveSyncConfigs(syncConfigs,null,null,null);
	}

	@Override
	
	public void deleteSyncConfigs(long id) {
		// TODO Auto-generated method stub
		X6BasicSyncConfigs syncConfigs = syncConfigsService.getSyncConfigs(id);
		syncConfigsService.deleteSyncConfigs(syncConfigs);
	}
	
	@Override
	public ArrayList<X6BasicSyncConfigs> getSyncConfigsList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"syncConfigs\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicSyncConfigs> list = syncConfigsService.getSyncConfigss(customer, customerValue);
		 
		return (ArrayList<X6BasicSyncConfigs>) list;
	}

	@Override
	@BAPPermission("X6Basic_1.0_syncConfig_list_BUTTON_add")
	public void SyncConfigsList(ArrayList<X6BasicSyncConfigs> syncConfigss) {
		// TODO Auto-generated method stub
		for(X6BasicSyncConfigs syncConfigs : syncConfigss){
			X6BasicSyncConfigs old = syncConfigsService.loadSyncConfigsByBussinessKey(syncConfigs);
			if(old!=null){
				syncConfigs.setId(old.getId());
				syncConfigs.setVersion(old.getVersion());
			}
			syncConfigsService.mergeSyncConfigs(syncConfigs, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicSyncConfigs> getSyncConfigsPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"syncConfigs\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicSyncConfigs> page = new Page<X6BasicSyncConfigs>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicSyncConfigs> list = syncConfigsService.getSyncConfigss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicSyncConfigs> getSyncConfigsPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"syncConfigs\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicSyncConfigs> page = new Page<X6BasicSyncConfigs>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicSyncConfigs> list = syncConfigsService.getSyncConfigss(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_syncConfig_SyncConfigs,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}