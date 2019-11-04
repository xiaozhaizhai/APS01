package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMFormulaProcessActiveCxfService;
import com.supcon.orchid.RM.services.RMFormulaProcessActiveService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMFormulaProcessActiveCxfService")
@Transactional
public class RMFormulaProcessActiveCxfServiceImpl implements RMFormulaProcessActiveCxfService {
	
	@Resource
	private RMFormulaProcessActiveService formulaProcessActiveService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMFormulaProcessActive getFormulaProcessActive(long id){
		RMFormulaProcessActive formulaProcessActive = formulaProcessActiveService.getFormulaProcessActive(id);
		return formulaProcessActive;
	}
	
	@Override
	
	public void updateFormulaProcessActive(long id, RMFormulaProcessActive formulaProcessActive) {
		// TODO Auto-generated method stub
		formulaProcessActive.setId(id);
		formulaProcessActiveService.saveFormulaProcessActive(formulaProcessActive,null,null,null);
	}

	@Override
	
	public void createFormulaProcessActive(RMFormulaProcessActive formulaProcessActive) {
		// TODO Auto-generated method stub
		formulaProcessActiveService.saveFormulaProcessActive(formulaProcessActive,null,null,null);
	}

	@Override
	
	public void deleteFormulaProcessActive(long id) {
		// TODO Auto-generated method stub
		RMFormulaProcessActive formulaProcessActive = formulaProcessActiveService.getFormulaProcessActive(id);
		formulaProcessActiveService.deleteFormulaProcessActive(formulaProcessActive);
	}
	
	@Override
	public ArrayList<RMFormulaProcessActive> getFormulaProcessActiveList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaProcessActive\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMFormulaProcessActive> list = formulaProcessActiveService.getFormulaProcessActives(customer, customerValue);
		 
		return (ArrayList<RMFormulaProcessActive>) list;
	}

	@Override
	
	public void FormulaProcessActiveList(ArrayList<RMFormulaProcessActive> formulaProcessActives) {
		// TODO Auto-generated method stub
		for(RMFormulaProcessActive formulaProcessActive : formulaProcessActives){
			RMFormulaProcessActive old = formulaProcessActiveService.loadFormulaProcessActiveByBussinessKey(formulaProcessActive);
			if(old!=null){
				formulaProcessActive.setId(old.getId());
				formulaProcessActive.setVersion(old.getVersion());
			}
			formulaProcessActiveService.mergeFormulaProcessActive(formulaProcessActive, null,null,null);
		}
	}
	
	@Override
	public Page<RMFormulaProcessActive> getFormulaProcessActivePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaProcessActive\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaProcessActive> page = new Page<RMFormulaProcessActive>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaProcessActive> list = formulaProcessActiveService.getFormulaProcessActives(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMFormulaProcessActive> getFormulaProcessActivePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaProcessActive\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaProcessActive> page = new Page<RMFormulaProcessActive>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaProcessActive> list = formulaProcessActiveService.getFormulaProcessActives(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}