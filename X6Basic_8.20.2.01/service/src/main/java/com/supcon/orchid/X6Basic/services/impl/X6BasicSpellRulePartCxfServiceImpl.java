package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicSpellRulePartCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicSpellRulePartService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_spellRule_SpellRulePart,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicSpellRulePartCxfService")
@Transactional
public class X6BasicSpellRulePartCxfServiceImpl implements X6BasicSpellRulePartCxfService {
	
	@Resource
	private X6BasicSpellRulePartService spellRulePartService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public X6BasicSpellRulePart getSpellRulePart(long id){
		X6BasicSpellRulePart spellRulePart = spellRulePartService.getSpellRulePart(id);
		return spellRulePart;
	}
	
	@Override
	
	public void updateSpellRulePart(long id, X6BasicSpellRulePart spellRulePart) {
		// TODO Auto-generated method stub
		spellRulePart.setId(id);
		spellRulePartService.saveSpellRulePart(spellRulePart,null,null,null);
	}

	@Override
	
	public void createSpellRulePart(X6BasicSpellRulePart spellRulePart) {
		// TODO Auto-generated method stub
		spellRulePartService.saveSpellRulePart(spellRulePart,null,null,null);
	}

	@Override
	
	public void deleteSpellRulePart(long id) {
		// TODO Auto-generated method stub
		X6BasicSpellRulePart spellRulePart = spellRulePartService.getSpellRulePart(id);
		spellRulePartService.deleteSpellRulePart(spellRulePart);
	}
	
	@Override
	public ArrayList<X6BasicSpellRulePart> getSpellRulePartList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"spellRulePart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicSpellRulePart> list = spellRulePartService.getSpellRuleParts(customer, customerValue);
		 
		return (ArrayList<X6BasicSpellRulePart>) list;
	}

	@Override
	
	public void SpellRulePartList(ArrayList<X6BasicSpellRulePart> spellRuleParts) {
		// TODO Auto-generated method stub
		for(X6BasicSpellRulePart spellRulePart : spellRuleParts){
			X6BasicSpellRulePart old = spellRulePartService.loadSpellRulePartByBussinessKey(spellRulePart);
			if(old!=null){
				spellRulePart.setId(old.getId());
				spellRulePart.setVersion(old.getVersion());
			}
			spellRulePartService.mergeSpellRulePart(spellRulePart, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicSpellRulePart> getSpellRulePartPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"spellRulePart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicSpellRulePart> page = new Page<X6BasicSpellRulePart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicSpellRulePart> list = spellRulePartService.getSpellRuleParts(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicSpellRulePart> getSpellRulePartPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"spellRulePart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicSpellRulePart> page = new Page<X6BasicSpellRulePart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicSpellRulePart> list = spellRulePartService.getSpellRuleParts(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_spellRule_SpellRulePart,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}