package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMBatchNumRuleCxfService;
import com.supcon.orchid.WOM.services.WOMBatchNumRuleService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.WOM.entities.WOMActiveExelog;
import com.supcon.orchid.WOM.entities.WOMBatchNumRule;
import com.supcon.orchid.WOM.entities.WOMBatchProdTaskPart;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTask;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderHead;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderPart;
import com.supcon.orchid.WOM.entities.WOMCheckManage;
import com.supcon.orchid.WOM.entities.WOMInspect;
import com.supcon.orchid.WOM.entities.WOMProduceTaskManage;
import com.supcon.orchid.WOM.entities.WOMPutInManage;
import com.supcon.orchid.WOM.entities.WOMTaskReportManage;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialPart;
import com.supcon.orchid.WOM.entities.WOMProActAndBatState;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;
import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_batchNumRule_BatchNumRule,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMBatchNumRuleCxfService")
@Transactional
public class WOMBatchNumRuleCxfServiceImpl implements WOMBatchNumRuleCxfService {
	
	@Resource
	private WOMBatchNumRuleService batchNumRuleService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_batchNumRule_batchRuleList")
	public WOMBatchNumRule getBatchNumRule(long id){
		WOMBatchNumRule batchNumRule = batchNumRuleService.getBatchNumRule(id);
		return batchNumRule;
	}
	
	@Override
	@BAPPermission("WOM_7.5.0.0_batchNumRule_batchRuleList_BUTTON_edit")
	public void updateBatchNumRule(long id, WOMBatchNumRule batchNumRule) {
		// TODO Auto-generated method stub
		batchNumRule.setId(id);
		batchNumRuleService.saveBatchNumRule(batchNumRule,null,null,null);
	}

	@Override
	@BAPPermission("WOM_7.5.0.0_batchNumRule_batchRuleList_BUTTON_add")
	public void createBatchNumRule(WOMBatchNumRule batchNumRule) {
		// TODO Auto-generated method stub
		batchNumRuleService.saveBatchNumRule(batchNumRule,null,null,null);
	}

	@Override
	@BAPPermission("WOM_7.5.0.0_batchNumRule_batchRuleList_BUTTON_del")
	public void deleteBatchNumRule(long id) {
		// TODO Auto-generated method stub
		WOMBatchNumRule batchNumRule = batchNumRuleService.getBatchNumRule(id);
		batchNumRuleService.deleteBatchNumRule(batchNumRule);
	}
	
	@Override
	public ArrayList<WOMBatchNumRule> getBatchNumRuleList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchNumRule\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMBatchNumRule> list = batchNumRuleService.getBatchNumRules(customer, customerValue);
		 
		return (ArrayList<WOMBatchNumRule>) list;
	}

	@Override
	@BAPPermission("WOM_7.5.0.0_batchNumRule_batchRuleList_BUTTON_add")
	public void BatchNumRuleList(ArrayList<WOMBatchNumRule> batchNumRules) {
		// TODO Auto-generated method stub
		for(WOMBatchNumRule batchNumRule : batchNumRules){
			WOMBatchNumRule old = batchNumRuleService.loadBatchNumRuleByBussinessKey(batchNumRule);
			if(old!=null){
				batchNumRule.setId(old.getId());
				batchNumRule.setVersion(old.getVersion());
			}
			batchNumRuleService.mergeBatchNumRule(batchNumRule, null,null,null);
		}
	}
	
	@Override
	public Page<WOMBatchNumRule> getBatchNumRulePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchNumRule\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchNumRule> page = new Page<WOMBatchNumRule>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchNumRule> list = batchNumRuleService.getBatchNumRules(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMBatchNumRule> getBatchNumRulePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchNumRule\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchNumRule> page = new Page<WOMBatchNumRule>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchNumRule> list = batchNumRuleService.getBatchNumRules(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_batchNumRule_BatchNumRule,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}