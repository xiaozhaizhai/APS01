package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMFormulaChangeCxfService;
import com.supcon.orchid.RM.services.RMFormulaChangeService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMFormulaChangeCxfService")
@Transactional
public class RMFormulaChangeCxfServiceImpl implements RMFormulaChangeCxfService {
	
	@Resource
	private RMFormulaChangeService formulaChangeService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("RM_7.5.0.0_fomulaChange_fomulaStateList")
	public RMFormulaChange getFormulaChange(long id){
		RMFormulaChange formulaChange = formulaChangeService.getFormulaChange(id);
		return formulaChange;
	}
	
	@Override
	
	public void updateFormulaChange(long id, RMFormulaChange formulaChange) {
		// TODO Auto-generated method stub
		formulaChange.setId(id);
		formulaChangeService.saveFormulaChange(formulaChange,null,null,null);
	}

	@Override
	
	public void createFormulaChange(RMFormulaChange formulaChange) {
		// TODO Auto-generated method stub
		formulaChangeService.saveFormulaChange(formulaChange,null,null,null);
	}

	@Override
	
	public void deleteFormulaChange(long id) {
		// TODO Auto-generated method stub
		RMFormulaChange formulaChange = formulaChangeService.getFormulaChange(id);
		formulaChangeService.deleteFormulaChange(formulaChange);
	}
	
	@Override
	public ArrayList<RMFormulaChange> getFormulaChangeList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaChange\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMFormulaChange> list = formulaChangeService.getFormulaChanges(customer, customerValue);
		 
		return (ArrayList<RMFormulaChange>) list;
	}

	@Override
	
	public void FormulaChangeList(ArrayList<RMFormulaChange> formulaChanges) {
		// TODO Auto-generated method stub
		for(RMFormulaChange formulaChange : formulaChanges){
			RMFormulaChange old = formulaChangeService.loadFormulaChangeByBussinessKey(formulaChange);
			if(old!=null){
				formulaChange.setId(old.getId());
				formulaChange.setVersion(old.getVersion());
			}
			formulaChangeService.mergeFormulaChange(formulaChange, null,null,null);
		}
	}
	
	@Override
	public Page<RMFormulaChange> getFormulaChangePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaChange\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaChange> page = new Page<RMFormulaChange>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaChange> list = formulaChangeService.getFormulaChanges(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMFormulaChange> getFormulaChangePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaChange\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaChange> page = new Page<RMFormulaChange>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaChange> list = formulaChangeService.getFormulaChanges(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}