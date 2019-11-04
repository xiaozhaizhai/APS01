package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMFormulaProcessCxfService;
import com.supcon.orchid.RM.services.RMFormulaProcessService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMFormulaProcessCxfService")
@Transactional
public class RMFormulaProcessCxfServiceImpl implements RMFormulaProcessCxfService {
	
	@Resource
	private RMFormulaProcessService formulaProcessService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMFormulaProcess getFormulaProcess(long id){
		RMFormulaProcess formulaProcess = formulaProcessService.getFormulaProcess(id);
		return formulaProcess;
	}
	
	@Override
	
	public void updateFormulaProcess(long id, RMFormulaProcess formulaProcess) {
		// TODO Auto-generated method stub
		formulaProcess.setId(id);
		formulaProcessService.saveFormulaProcess(formulaProcess,null,null,null);
	}

	@Override
	
	public void createFormulaProcess(RMFormulaProcess formulaProcess) {
		// TODO Auto-generated method stub
		formulaProcessService.saveFormulaProcess(formulaProcess,null,null,null);
	}

	@Override
	
	public void deleteFormulaProcess(long id) {
		// TODO Auto-generated method stub
		RMFormulaProcess formulaProcess = formulaProcessService.getFormulaProcess(id);
		formulaProcessService.deleteFormulaProcess(formulaProcess);
	}
	
	@Override
	public ArrayList<RMFormulaProcess> getFormulaProcessList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMFormulaProcess> list = formulaProcessService.getFormulaProcesss(customer, customerValue);
		 
		return (ArrayList<RMFormulaProcess>) list;
	}

	@Override
	
	public void FormulaProcessList(ArrayList<RMFormulaProcess> formulaProcesss) {
		// TODO Auto-generated method stub
		for(RMFormulaProcess formulaProcess : formulaProcesss){
			RMFormulaProcess old = formulaProcessService.loadFormulaProcessByBussinessKey(formulaProcess);
			if(old!=null){
				formulaProcess.setId(old.getId());
				formulaProcess.setVersion(old.getVersion());
			}
			formulaProcessService.mergeFormulaProcess(formulaProcess, null,null,null);
		}
	}
	
	@Override
	public Page<RMFormulaProcess> getFormulaProcessPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaProcess> page = new Page<RMFormulaProcess>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaProcess> list = formulaProcessService.getFormulaProcesss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMFormulaProcess> getFormulaProcessPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaProcess> page = new Page<RMFormulaProcess>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaProcess> list = formulaProcessService.getFormulaProcesss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}