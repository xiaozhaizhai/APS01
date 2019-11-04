package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMFormulaCxfService;
import com.supcon.orchid.RM.services.RMFormulaService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMFormulaCxfService")
@Transactional
public class RMFormulaCxfServiceImpl implements RMFormulaCxfService {
	
	@Resource
	private RMFormulaService formulaService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("RM_7.5.0.0_formula_formulaList")
	public RMFormula getFormula(long id){
		RMFormula formula = formulaService.getFormula(id);
		return formula;
	}
	
	@Override
	
	public void updateFormula(long id, RMFormula formula) {
		// TODO Auto-generated method stub
		formula.setId(id);
		formulaService.saveFormula(formula,null,null,null);
	}

	@Override
	
	public void createFormula(RMFormula formula) {
		// TODO Auto-generated method stub
		formulaService.saveFormula(formula,null,null,null);
	}

	@Override
	
	public void deleteFormula(long id) {
		// TODO Auto-generated method stub
		RMFormula formula = formulaService.getFormula(id);
		formulaService.deleteFormula(formula);
	}
	
	@Override
	public ArrayList<RMFormula> getFormulaList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formula\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMFormula> list = formulaService.getFormulas(customer, customerValue);
		 
		return (ArrayList<RMFormula>) list;
	}

	@Override
	
	public void FormulaList(ArrayList<RMFormula> formulas) {
		// TODO Auto-generated method stub
		for(RMFormula formula : formulas){
			RMFormula old = formulaService.loadFormulaByBussinessKey(formula);
			if(old!=null){
				formula.setId(old.getId());
				formula.setVersion(old.getVersion());
			}
			formulaService.mergeFormula(formula, null,null,null);
		}
	}
	
	@Override
	public Page<RMFormula> getFormulaPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formula\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormula> page = new Page<RMFormula>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormula> list = formulaService.getFormulas(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMFormula> getFormulaPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formula\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormula> page = new Page<RMFormula>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormula> list = formulaService.getFormulas(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}