package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMFormulaBeforeProcessCxfService;
import com.supcon.orchid.RM.services.RMFormulaBeforeProcessService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_formula_FormulaBeforeProcess,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMFormulaBeforeProcessCxfService")
@Transactional
public class RMFormulaBeforeProcessCxfServiceImpl implements RMFormulaBeforeProcessCxfService {
	
	@Resource
	private RMFormulaBeforeProcessService formulaBeforeProcessService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMFormulaBeforeProcess getFormulaBeforeProcess(long id){
		RMFormulaBeforeProcess formulaBeforeProcess = formulaBeforeProcessService.getFormulaBeforeProcess(id);
		return formulaBeforeProcess;
	}
	
	@Override
	
	public void updateFormulaBeforeProcess(long id, RMFormulaBeforeProcess formulaBeforeProcess) {
		// TODO Auto-generated method stub
		formulaBeforeProcess.setId(id);
		formulaBeforeProcessService.saveFormulaBeforeProcess(formulaBeforeProcess,null,null,null);
	}

	@Override
	
	public void createFormulaBeforeProcess(RMFormulaBeforeProcess formulaBeforeProcess) {
		// TODO Auto-generated method stub
		formulaBeforeProcessService.saveFormulaBeforeProcess(formulaBeforeProcess,null,null,null);
	}

	@Override
	
	public void deleteFormulaBeforeProcess(long id) {
		// TODO Auto-generated method stub
		RMFormulaBeforeProcess formulaBeforeProcess = formulaBeforeProcessService.getFormulaBeforeProcess(id);
		formulaBeforeProcessService.deleteFormulaBeforeProcess(formulaBeforeProcess);
	}
	
	@Override
	public ArrayList<RMFormulaBeforeProcess> getFormulaBeforeProcessList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaBeforeProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMFormulaBeforeProcess> list = formulaBeforeProcessService.getFormulaBeforeProcesss(customer, customerValue);
		 
		return (ArrayList<RMFormulaBeforeProcess>) list;
	}

	@Override
	
	public void FormulaBeforeProcessList(ArrayList<RMFormulaBeforeProcess> formulaBeforeProcesss) {
		// TODO Auto-generated method stub
		for(RMFormulaBeforeProcess formulaBeforeProcess : formulaBeforeProcesss){
			RMFormulaBeforeProcess old = formulaBeforeProcessService.loadFormulaBeforeProcessByBussinessKey(formulaBeforeProcess);
			if(old!=null){
				formulaBeforeProcess.setId(old.getId());
				formulaBeforeProcess.setVersion(old.getVersion());
			}
			formulaBeforeProcessService.mergeFormulaBeforeProcess(formulaBeforeProcess, null,null,null);
		}
	}
	
	@Override
	public Page<RMFormulaBeforeProcess> getFormulaBeforeProcessPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaBeforeProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaBeforeProcess> page = new Page<RMFormulaBeforeProcess>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaBeforeProcess> list = formulaBeforeProcessService.getFormulaBeforeProcesss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMFormulaBeforeProcess> getFormulaBeforeProcessPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaBeforeProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaBeforeProcess> page = new Page<RMFormulaBeforeProcess>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaBeforeProcess> list = formulaBeforeProcessService.getFormulaBeforeProcesss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_formula_FormulaBeforeProcess,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}