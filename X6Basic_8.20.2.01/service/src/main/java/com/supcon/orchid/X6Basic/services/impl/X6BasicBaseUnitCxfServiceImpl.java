package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicBaseUnitCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicBaseUnitService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_unitGroup_BaseUnit,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicBaseUnitCxfService")
@Transactional
public class X6BasicBaseUnitCxfServiceImpl implements X6BasicBaseUnitCxfService {
	
	@Resource
	private X6BasicBaseUnitService baseUnitService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_unitGroup_unitList")
	public X6BasicBaseUnit getBaseUnit(long id){
		X6BasicBaseUnit baseUnit = baseUnitService.getBaseUnit(id);
		return baseUnit;
	}
	
	@Override
	
	public void updateBaseUnit(long id, X6BasicBaseUnit baseUnit) {
		// TODO Auto-generated method stub
		baseUnit.setId(id);
		baseUnitService.saveBaseUnit(baseUnit,null,null,null);
	}

	@Override
	
	public void createBaseUnit(X6BasicBaseUnit baseUnit) {
		// TODO Auto-generated method stub
		baseUnitService.saveBaseUnit(baseUnit,null,null,null);
	}

	@Override
	
	public void deleteBaseUnit(long id) {
		// TODO Auto-generated method stub
		X6BasicBaseUnit baseUnit = baseUnitService.getBaseUnit(id);
		baseUnitService.deleteBaseUnit(baseUnit);
	}
	
	@Override
	public ArrayList<X6BasicBaseUnit> getBaseUnitList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"baseUnit\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicBaseUnit> list = baseUnitService.getBaseUnits(customer, customerValue);
		 
		return (ArrayList<X6BasicBaseUnit>) list;
	}

	@Override
	
	public void BaseUnitList(ArrayList<X6BasicBaseUnit> baseUnits) {
		// TODO Auto-generated method stub
		for(X6BasicBaseUnit baseUnit : baseUnits){
			X6BasicBaseUnit old = baseUnitService.loadBaseUnitByBussinessKey(baseUnit);
			if(old!=null){
				baseUnit.setId(old.getId());
				baseUnit.setVersion(old.getVersion());
			}
			baseUnitService.mergeBaseUnit(baseUnit, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicBaseUnit> getBaseUnitPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"baseUnit\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicBaseUnit> page = new Page<X6BasicBaseUnit>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicBaseUnit> list = baseUnitService.getBaseUnits(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicBaseUnit> getBaseUnitPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"baseUnit\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicBaseUnit> page = new Page<X6BasicBaseUnit>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicBaseUnit> list = baseUnitService.getBaseUnits(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_unitGroup_BaseUnit,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}