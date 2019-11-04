package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicRangePlanCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicRangePlanService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_rangePlan_RangePlan,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicRangePlanCxfService")
@Transactional
public class X6BasicRangePlanCxfServiceImpl implements X6BasicRangePlanCxfService {
	
	@Resource
	private X6BasicRangePlanService rangePlanService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public X6BasicRangePlan getRangePlan(long id){
		X6BasicRangePlan rangePlan = rangePlanService.getRangePlan(id);
		return rangePlan;
	}
	
	@Override
	
	public void updateRangePlan(long id, X6BasicRangePlan rangePlan) {
		// TODO Auto-generated method stub
		rangePlan.setId(id);
		rangePlanService.saveRangePlan(rangePlan,null,null,null);
	}

	@Override
	
	public void createRangePlan(X6BasicRangePlan rangePlan) {
		// TODO Auto-generated method stub
		rangePlanService.saveRangePlan(rangePlan,null,null,null);
	}

	@Override
	
	public void deleteRangePlan(long id) {
		// TODO Auto-generated method stub
		X6BasicRangePlan rangePlan = rangePlanService.getRangePlan(id);
		rangePlanService.deleteRangePlan(rangePlan);
	}
	
	@Override
	public ArrayList<X6BasicRangePlan> getRangePlanList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"rangePlan\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicRangePlan> list = rangePlanService.getRangePlans(customer, customerValue);
		 
		return (ArrayList<X6BasicRangePlan>) list;
	}

	@Override
	
	public void RangePlanList(ArrayList<X6BasicRangePlan> rangePlans) {
		// TODO Auto-generated method stub
		for(X6BasicRangePlan rangePlan : rangePlans){
			X6BasicRangePlan old = rangePlanService.loadRangePlanByBussinessKey(rangePlan);
			if(old!=null){
				rangePlan.setId(old.getId());
				rangePlan.setVersion(old.getVersion());
			}
			rangePlanService.mergeRangePlan(rangePlan, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicRangePlan> getRangePlanPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"rangePlan\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicRangePlan> page = new Page<X6BasicRangePlan>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicRangePlan> list = rangePlanService.getRangePlans(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicRangePlan> getRangePlanPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"rangePlan\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicRangePlan> page = new Page<X6BasicRangePlan>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicRangePlan> list = rangePlanService.getRangePlans(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_rangePlan_RangePlan,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}