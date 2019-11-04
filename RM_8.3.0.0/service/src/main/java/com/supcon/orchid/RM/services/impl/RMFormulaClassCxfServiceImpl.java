package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMFormulaClassCxfService;
import com.supcon.orchid.RM.services.RMFormulaClassService;
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
import com.supcon.orchid.RM.entities.RMFormulaClass;
import com.supcon.orchid.RM.entities.RMFormulaMixtureActive;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.entities.RMFormulaType;
import com.supcon.orchid.RM.entities.RMFactoryMapOther;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.RM.entities.RMLineFormula;
import com.supcon.orchid.RM.entities.RMProcessPoint;
import com.supcon.orchid.RM.entities.RMProcessUnit;
import com.supcon.orchid.RM.entities.RMProcessUnitChoice;
import com.supcon.orchid.RM.entities.RMTestProj;
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMFormulaClassCxfService")
@Transactional
public class RMFormulaClassCxfServiceImpl implements RMFormulaClassCxfService {
	
	@Resource
	private RMFormulaClassService formulaClassService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMFormulaClass getFormulaClass(long id){
		RMFormulaClass formulaClass = formulaClassService.getFormulaClass(id);
		return formulaClass;
	}
	
	@Override
	
	public void updateFormulaClass(long id, RMFormulaClass formulaClass) {
		// TODO Auto-generated method stub
		formulaClass.setId(id);
		formulaClassService.saveFormulaClass(formulaClass,null,null,null);
	}

	@Override
	
	public void createFormulaClass(RMFormulaClass formulaClass) {
		// TODO Auto-generated method stub
		formulaClassService.saveFormulaClass(formulaClass,null,null,null);
	}

	@Override
	
	public void deleteFormulaClass(long id) {
		// TODO Auto-generated method stub
		RMFormulaClass formulaClass = formulaClassService.getFormulaClass(id);
		formulaClassService.deleteFormulaClass(formulaClass);
	}
	
	@Override
	public ArrayList<RMFormulaClass> getFormulaClassList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaClass\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMFormulaClass> list = formulaClassService.getFormulaClasss(customer, customerValue);
		 
		return (ArrayList<RMFormulaClass>) list;
	}

	@Override
	
	public void FormulaClassList(ArrayList<RMFormulaClass> formulaClasss) {
		// TODO Auto-generated method stub
		for(RMFormulaClass formulaClass : formulaClasss){
			RMFormulaClass old = formulaClassService.loadFormulaClassByBussinessKey(formulaClass);
			if(old!=null){
				formulaClass.setId(old.getId());
				formulaClass.setVersion(old.getVersion());
			}
			formulaClassService.mergeFormulaClass(formulaClass, null,null,null);
		}
	}
	
	@Override
	public Page<RMFormulaClass> getFormulaClassPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaClass\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaClass> page = new Page<RMFormulaClass>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaClass> list = formulaClassService.getFormulaClasss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMFormulaClass> getFormulaClassPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaClass\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaClass> page = new Page<RMFormulaClass>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaClass> list = formulaClassService.getFormulaClasss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_formula_FormulaClass,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}