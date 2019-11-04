package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicPlanDailyCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicPlanDailyService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_rangePlan_PlanDaily,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicPlanDailyCxfService")
@Transactional
public class X6BasicPlanDailyCxfServiceImpl implements X6BasicPlanDailyCxfService {
	
	@Resource
	private X6BasicPlanDailyService planDailyService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public X6BasicPlanDaily getPlanDaily(long id){
		X6BasicPlanDaily planDaily = planDailyService.getPlanDaily(id);
		return planDaily;
	}
	
	@Override
	
	public void updatePlanDaily(long id, X6BasicPlanDaily planDaily) {
		// TODO Auto-generated method stub
		planDaily.setId(id);
		planDailyService.savePlanDaily(planDaily,null,null,null);
	}

	@Override
	
	public void createPlanDaily(X6BasicPlanDaily planDaily) {
		// TODO Auto-generated method stub
		planDailyService.savePlanDaily(planDaily,null,null,null);
	}

	@Override
	
	public void deletePlanDaily(long id) {
		// TODO Auto-generated method stub
		X6BasicPlanDaily planDaily = planDailyService.getPlanDaily(id);
		planDailyService.deletePlanDaily(planDaily);
	}
	
	@Override
	public ArrayList<X6BasicPlanDaily> getPlanDailyList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"planDaily\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicPlanDaily> list = planDailyService.getPlanDailys(customer, customerValue);
		 
		return (ArrayList<X6BasicPlanDaily>) list;
	}

	@Override
	
	public void PlanDailyList(ArrayList<X6BasicPlanDaily> planDailys) {
		// TODO Auto-generated method stub
		for(X6BasicPlanDaily planDaily : planDailys){
			X6BasicPlanDaily old = planDailyService.loadPlanDailyByBussinessKey(planDaily);
			if(old!=null){
				planDaily.setId(old.getId());
				planDaily.setVersion(old.getVersion());
			}
			planDailyService.mergePlanDaily(planDaily, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicPlanDaily> getPlanDailyPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"planDaily\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicPlanDaily> page = new Page<X6BasicPlanDaily>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicPlanDaily> list = planDailyService.getPlanDailys(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicPlanDaily> getPlanDailyPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"planDaily\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicPlanDaily> page = new Page<X6BasicPlanDaily>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicPlanDaily> list = planDailyService.getPlanDailys(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_rangePlan_PlanDaily,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}