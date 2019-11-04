package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMPrecessStandardsCxfService;
import com.supcon.orchid.RM.services.RMPrecessStandardsService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_formula_PrecessStandards,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMPrecessStandardsCxfService")
@Transactional
public class RMPrecessStandardsCxfServiceImpl implements RMPrecessStandardsCxfService {
	
	@Resource
	private RMPrecessStandardsService precessStandardsService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMPrecessStandards getPrecessStandards(long id){
		RMPrecessStandards precessStandards = precessStandardsService.getPrecessStandards(id);
		return precessStandards;
	}
	
	@Override
	
	public void updatePrecessStandards(long id, RMPrecessStandards precessStandards) {
		// TODO Auto-generated method stub
		precessStandards.setId(id);
		precessStandardsService.savePrecessStandards(precessStandards,null,null,null);
	}

	@Override
	
	public void createPrecessStandards(RMPrecessStandards precessStandards) {
		// TODO Auto-generated method stub
		precessStandardsService.savePrecessStandards(precessStandards,null,null,null);
	}

	@Override
	
	public void deletePrecessStandards(long id) {
		// TODO Auto-generated method stub
		RMPrecessStandards precessStandards = precessStandardsService.getPrecessStandards(id);
		precessStandardsService.deletePrecessStandards(precessStandards);
	}
	
	@Override
	public ArrayList<RMPrecessStandards> getPrecessStandardsList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"precessStandards\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMPrecessStandards> list = precessStandardsService.getPrecessStandardss(customer, customerValue);
		 
		return (ArrayList<RMPrecessStandards>) list;
	}

	@Override
	
	public void PrecessStandardsList(ArrayList<RMPrecessStandards> precessStandardss) {
		// TODO Auto-generated method stub
		for(RMPrecessStandards precessStandards : precessStandardss){
			RMPrecessStandards old = precessStandardsService.loadPrecessStandardsByBussinessKey(precessStandards);
			if(old!=null){
				precessStandards.setId(old.getId());
				precessStandards.setVersion(old.getVersion());
			}
			precessStandardsService.mergePrecessStandards(precessStandards, null,null,null);
		}
	}
	
	@Override
	public Page<RMPrecessStandards> getPrecessStandardsPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"precessStandards\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMPrecessStandards> page = new Page<RMPrecessStandards>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMPrecessStandards> list = precessStandardsService.getPrecessStandardss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMPrecessStandards> getPrecessStandardsPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"precessStandards\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMPrecessStandards> page = new Page<RMPrecessStandards>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMPrecessStandards> list = precessStandardsService.getPrecessStandardss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_formula_PrecessStandards,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}