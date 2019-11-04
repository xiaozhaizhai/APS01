package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicUnitGroupsCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicUnitGroupsService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_unitGroup_UnitGroups,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicUnitGroupsCxfService")
@Transactional
public class X6BasicUnitGroupsCxfServiceImpl implements X6BasicUnitGroupsCxfService {
	
	@Resource
	private X6BasicUnitGroupsService unitGroupsService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_unitGroup_list")
	public X6BasicUnitGroups getUnitGroups(long id){
		X6BasicUnitGroups unitGroups = unitGroupsService.getUnitGroups(id);
		return unitGroups;
	}
	
	@Override
	@BAPPermission("X6Basic_1.0_unitGroup_list_BUTTON_edit")
	public void updateUnitGroups(long id, X6BasicUnitGroups unitGroups) {
		// TODO Auto-generated method stub
		unitGroups.setId(id);
		unitGroupsService.saveUnitGroups(unitGroups,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_unitGroup_list_BUTTON_add")
	public void createUnitGroups(X6BasicUnitGroups unitGroups) {
		// TODO Auto-generated method stub
		unitGroupsService.saveUnitGroups(unitGroups,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_unitGroup_list_BUTTON_delete")
	public void deleteUnitGroups(long id) {
		// TODO Auto-generated method stub
		X6BasicUnitGroups unitGroups = unitGroupsService.getUnitGroups(id);
		unitGroupsService.deleteUnitGroups(unitGroups);
	}
	
	@Override
	public ArrayList<X6BasicUnitGroups> getUnitGroupsList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"unitGroups\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicUnitGroups> list = unitGroupsService.getUnitGroupss(customer, customerValue);
		 
		return (ArrayList<X6BasicUnitGroups>) list;
	}

	@Override
	@BAPPermission("X6Basic_1.0_unitGroup_list_BUTTON_add")
	public void UnitGroupsList(ArrayList<X6BasicUnitGroups> unitGroupss) {
		// TODO Auto-generated method stub
		for(X6BasicUnitGroups unitGroups : unitGroupss){
			X6BasicUnitGroups old = unitGroupsService.loadUnitGroupsByBussinessKey(unitGroups);
			if(old!=null){
				unitGroups.setId(old.getId());
				unitGroups.setVersion(old.getVersion());
			}
			unitGroupsService.mergeUnitGroups(unitGroups, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicUnitGroups> getUnitGroupsPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"unitGroups\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicUnitGroups> page = new Page<X6BasicUnitGroups>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicUnitGroups> list = unitGroupsService.getUnitGroupss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicUnitGroups> getUnitGroupsPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"unitGroups\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicUnitGroups> page = new Page<X6BasicUnitGroups>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicUnitGroups> list = unitGroupsService.getUnitGroupss(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_unitGroup_UnitGroups,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}