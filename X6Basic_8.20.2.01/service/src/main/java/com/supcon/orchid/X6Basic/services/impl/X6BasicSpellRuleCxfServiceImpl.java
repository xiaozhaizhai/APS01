package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicSpellRuleCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicSpellRuleService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicSpellRuleCxfService")
@Transactional
public class X6BasicSpellRuleCxfServiceImpl implements X6BasicSpellRuleCxfService {
	
	@Resource
	private X6BasicSpellRuleService spellRuleService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_spellRule_list")
	public X6BasicSpellRule getSpellRule(long id){
		X6BasicSpellRule spellRule = spellRuleService.getSpellRule(id);
		return spellRule;
	}
	
	@Override
	@BAPPermission("X6Basic_1.0_spellRule_list_BUTTON_modify")
	public void updateSpellRule(long id, X6BasicSpellRule spellRule) {
		// TODO Auto-generated method stub
		spellRule.setId(id);
		spellRuleService.saveSpellRule(spellRule,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_spellRule_list_BUTTON_add")
	public void createSpellRule(X6BasicSpellRule spellRule) {
		// TODO Auto-generated method stub
		spellRuleService.saveSpellRule(spellRule,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_spellRule_list_BUTTON_del")
	public void deleteSpellRule(long id) {
		// TODO Auto-generated method stub
		X6BasicSpellRule spellRule = spellRuleService.getSpellRule(id);
		spellRuleService.deleteSpellRule(spellRule);
	}
	
	@Override
	public ArrayList<X6BasicSpellRule> getSpellRuleList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"spellRule\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicSpellRule> list = spellRuleService.getSpellRules(customer, customerValue);
		 
		return (ArrayList<X6BasicSpellRule>) list;
	}

	@Override
	@BAPPermission("X6Basic_1.0_spellRule_list_BUTTON_add")
	public void SpellRuleList(ArrayList<X6BasicSpellRule> spellRules) {
		// TODO Auto-generated method stub
		for(X6BasicSpellRule spellRule : spellRules){
			X6BasicSpellRule old = spellRuleService.loadSpellRuleByBussinessKey(spellRule);
			if(old!=null){
				spellRule.setId(old.getId());
				spellRule.setVersion(old.getVersion());
			}
			spellRuleService.mergeSpellRule(spellRule, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicSpellRule> getSpellRulePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"spellRule\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicSpellRule> page = new Page<X6BasicSpellRule>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicSpellRule> list = spellRuleService.getSpellRules(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicSpellRule> getSpellRulePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"spellRule\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicSpellRule> page = new Page<X6BasicSpellRule>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicSpellRule> list = spellRuleService.getSpellRules(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_spellRule_SpellRule,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}