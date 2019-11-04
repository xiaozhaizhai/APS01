package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicTimeRegionCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicTimeRegionService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicTimeRegionCxfService")
@Transactional
public class X6BasicTimeRegionCxfServiceImpl implements X6BasicTimeRegionCxfService {
	
	@Resource
	private X6BasicTimeRegionService timeRegionService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_timeRegion_timeReginList")
	public X6BasicTimeRegion getTimeRegion(long id){
		X6BasicTimeRegion timeRegion = timeRegionService.getTimeRegion(id);
		return timeRegion;
	}
	
	@Override
	@BAPPermission("X6Basic_1.0_timeRegion_timeReginList_BUTTON_edit")
	public void updateTimeRegion(long id, X6BasicTimeRegion timeRegion) {
		// TODO Auto-generated method stub
		timeRegion.setId(id);
		timeRegionService.saveTimeRegion(timeRegion,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_timeRegion_timeReginList_BUTTON_new")
	public void createTimeRegion(X6BasicTimeRegion timeRegion) {
		// TODO Auto-generated method stub
		timeRegionService.saveTimeRegion(timeRegion,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_timeRegion_timeReginList_BUTTON_del")
	public void deleteTimeRegion(long id) {
		// TODO Auto-generated method stub
		X6BasicTimeRegion timeRegion = timeRegionService.getTimeRegion(id);
		timeRegionService.deleteTimeRegion(timeRegion);
	}
	
	@Override
	public ArrayList<X6BasicTimeRegion> getTimeRegionList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"timeRegion\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicTimeRegion> list = timeRegionService.getTimeRegions(customer, customerValue);
		 
		return (ArrayList<X6BasicTimeRegion>) list;
	}

	@Override
	@BAPPermission("X6Basic_1.0_timeRegion_timeReginList_BUTTON_new")
	public void TimeRegionList(ArrayList<X6BasicTimeRegion> timeRegions) {
		// TODO Auto-generated method stub
		for(X6BasicTimeRegion timeRegion : timeRegions){
			X6BasicTimeRegion old = timeRegionService.loadTimeRegionByBussinessKey(timeRegion);
			if(old!=null){
				timeRegion.setId(old.getId());
				timeRegion.setVersion(old.getVersion());
			}
			timeRegionService.mergeTimeRegion(timeRegion, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicTimeRegion> getTimeRegionPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"timeRegion\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicTimeRegion> page = new Page<X6BasicTimeRegion>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicTimeRegion> list = timeRegionService.getTimeRegions(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicTimeRegion> getTimeRegionPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"timeRegion\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicTimeRegion> page = new Page<X6BasicTimeRegion>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicTimeRegion> list = timeRegionService.getTimeRegions(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}