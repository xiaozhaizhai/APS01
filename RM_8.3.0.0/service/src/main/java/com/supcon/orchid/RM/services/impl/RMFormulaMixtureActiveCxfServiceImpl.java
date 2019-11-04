package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMFormulaMixtureActiveCxfService;
import com.supcon.orchid.RM.services.RMFormulaMixtureActiveService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_formula_FormulaMixtureActive,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMFormulaMixtureActiveCxfService")
@Transactional
public class RMFormulaMixtureActiveCxfServiceImpl implements RMFormulaMixtureActiveCxfService {
	
	@Resource
	private RMFormulaMixtureActiveService formulaMixtureActiveService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMFormulaMixtureActive getFormulaMixtureActive(long id){
		RMFormulaMixtureActive formulaMixtureActive = formulaMixtureActiveService.getFormulaMixtureActive(id);
		return formulaMixtureActive;
	}
	
	@Override
	
	public void updateFormulaMixtureActive(long id, RMFormulaMixtureActive formulaMixtureActive) {
		// TODO Auto-generated method stub
		formulaMixtureActive.setId(id);
		formulaMixtureActiveService.saveFormulaMixtureActive(formulaMixtureActive,null,null,null);
	}

	@Override
	
	public void createFormulaMixtureActive(RMFormulaMixtureActive formulaMixtureActive) {
		// TODO Auto-generated method stub
		formulaMixtureActiveService.saveFormulaMixtureActive(formulaMixtureActive,null,null,null);
	}

	@Override
	
	public void deleteFormulaMixtureActive(long id) {
		// TODO Auto-generated method stub
		RMFormulaMixtureActive formulaMixtureActive = formulaMixtureActiveService.getFormulaMixtureActive(id);
		formulaMixtureActiveService.deleteFormulaMixtureActive(formulaMixtureActive);
	}
	
	@Override
	public ArrayList<RMFormulaMixtureActive> getFormulaMixtureActiveList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaMixtureActive\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMFormulaMixtureActive> list = formulaMixtureActiveService.getFormulaMixtureActives(customer, customerValue);
		 
		return (ArrayList<RMFormulaMixtureActive>) list;
	}

	@Override
	
	public void FormulaMixtureActiveList(ArrayList<RMFormulaMixtureActive> formulaMixtureActives) {
		// TODO Auto-generated method stub
		for(RMFormulaMixtureActive formulaMixtureActive : formulaMixtureActives){
			RMFormulaMixtureActive old = formulaMixtureActiveService.loadFormulaMixtureActiveByBussinessKey(formulaMixtureActive);
			if(old!=null){
				formulaMixtureActive.setId(old.getId());
				formulaMixtureActive.setVersion(old.getVersion());
			}
			formulaMixtureActiveService.mergeFormulaMixtureActive(formulaMixtureActive, null,null,null);
		}
	}
	
	@Override
	public Page<RMFormulaMixtureActive> getFormulaMixtureActivePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaMixtureActive\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaMixtureActive> page = new Page<RMFormulaMixtureActive>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaMixtureActive> list = formulaMixtureActiveService.getFormulaMixtureActives(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMFormulaMixtureActive> getFormulaMixtureActivePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaMixtureActive\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaMixtureActive> page = new Page<RMFormulaMixtureActive>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaMixtureActive> list = formulaMixtureActiveService.getFormulaMixtureActives(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_formula_FormulaMixtureActive,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}