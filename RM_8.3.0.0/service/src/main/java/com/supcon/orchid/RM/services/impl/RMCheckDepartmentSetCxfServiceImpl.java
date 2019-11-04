package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMCheckDepartmentSetCxfService;
import com.supcon.orchid.RM.services.RMCheckDepartmentSetService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.RM.entities.RMFormulaChange;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.RMFormulaBeforeProcess;
import com.supcon.orchid.RM.entities.RMFormulaBom;
import com.supcon.orchid.RM.entities.RMFormulaMixtureActive;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.entities.RMFormulaType;
import com.supcon.orchid.RM.entities.RMFactoryMapOther;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.entities.RMPickSite;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.RM.entities.RMLineFormula;
import com.supcon.orchid.RM.entities.RMProcessPoint;
import com.supcon.orchid.RM.entities.RMProcessUnit;
import com.supcon.orchid.RM.entities.RMProcessUnitChoice;
import com.supcon.orchid.RM.entities.RMTestProj;
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_formula_CheckDepartmentSet,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMCheckDepartmentSetCxfService")
@Transactional
public class RMCheckDepartmentSetCxfServiceImpl implements RMCheckDepartmentSetCxfService {
	
	@Resource
	private RMCheckDepartmentSetService checkDepartmentSetService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMCheckDepartmentSet getCheckDepartmentSet(long id){
		RMCheckDepartmentSet checkDepartmentSet = checkDepartmentSetService.getCheckDepartmentSet(id);
		return checkDepartmentSet;
	}
	
	@Override
	
	public void updateCheckDepartmentSet(long id, RMCheckDepartmentSet checkDepartmentSet) {
		// TODO Auto-generated method stub
		checkDepartmentSet.setId(id);
		checkDepartmentSetService.saveCheckDepartmentSet(checkDepartmentSet,null,null,null);
	}

	@Override
	
	public void createCheckDepartmentSet(RMCheckDepartmentSet checkDepartmentSet) {
		// TODO Auto-generated method stub
		checkDepartmentSetService.saveCheckDepartmentSet(checkDepartmentSet,null,null,null);
	}

	@Override
	
	public void deleteCheckDepartmentSet(long id) {
		// TODO Auto-generated method stub
		RMCheckDepartmentSet checkDepartmentSet = checkDepartmentSetService.getCheckDepartmentSet(id);
		checkDepartmentSetService.deleteCheckDepartmentSet(checkDepartmentSet);
	}
	
	@Override
	public ArrayList<RMCheckDepartmentSet> getCheckDepartmentSetList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"checkDepartmentSet\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMCheckDepartmentSet> list = checkDepartmentSetService.getCheckDepartmentSets(customer, customerValue);
		 
		return (ArrayList<RMCheckDepartmentSet>) list;
	}

	@Override
	
	public void CheckDepartmentSetList(ArrayList<RMCheckDepartmentSet> checkDepartmentSets) {
		// TODO Auto-generated method stub
		for(RMCheckDepartmentSet checkDepartmentSet : checkDepartmentSets){
			RMCheckDepartmentSet old = checkDepartmentSetService.loadCheckDepartmentSetByBussinessKey(checkDepartmentSet);
			if(old!=null){
				checkDepartmentSet.setId(old.getId());
				checkDepartmentSet.setVersion(old.getVersion());
			}
			checkDepartmentSetService.mergeCheckDepartmentSet(checkDepartmentSet, null,null,null);
		}
	}
	
	@Override
	public Page<RMCheckDepartmentSet> getCheckDepartmentSetPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"checkDepartmentSet\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMCheckDepartmentSet> page = new Page<RMCheckDepartmentSet>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMCheckDepartmentSet> list = checkDepartmentSetService.getCheckDepartmentSets(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMCheckDepartmentSet> getCheckDepartmentSetPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"checkDepartmentSet\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMCheckDepartmentSet> page = new Page<RMCheckDepartmentSet>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMCheckDepartmentSet> list = checkDepartmentSetService.getCheckDepartmentSets(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_formula_CheckDepartmentSet,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}