package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMFormulaBomCxfService;
import com.supcon.orchid.RM.services.RMFormulaBomService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_formula_FormulaBom,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMFormulaBomCxfService")
@Transactional
public class RMFormulaBomCxfServiceImpl implements RMFormulaBomCxfService {
	
	@Resource
	private RMFormulaBomService formulaBomService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMFormulaBom getFormulaBom(long id){
		RMFormulaBom formulaBom = formulaBomService.getFormulaBom(id);
		return formulaBom;
	}
	
	@Override
	
	public void updateFormulaBom(long id, RMFormulaBom formulaBom) {
		// TODO Auto-generated method stub
		formulaBom.setId(id);
		formulaBomService.saveFormulaBom(formulaBom,null,null,null);
	}

	@Override
	
	public void createFormulaBom(RMFormulaBom formulaBom) {
		// TODO Auto-generated method stub
		formulaBomService.saveFormulaBom(formulaBom,null,null,null);
	}

	@Override
	
	public void deleteFormulaBom(long id) {
		// TODO Auto-generated method stub
		RMFormulaBom formulaBom = formulaBomService.getFormulaBom(id);
		formulaBomService.deleteFormulaBom(formulaBom);
	}
	
	@Override
	public ArrayList<RMFormulaBom> getFormulaBomList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaBom\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMFormulaBom> list = formulaBomService.getFormulaBoms(customer, customerValue);
		 
		return (ArrayList<RMFormulaBom>) list;
	}

	@Override
	
	public void FormulaBomList(ArrayList<RMFormulaBom> formulaBoms) {
		// TODO Auto-generated method stub
		for(RMFormulaBom formulaBom : formulaBoms){
			RMFormulaBom old = formulaBomService.loadFormulaBomByBussinessKey(formulaBom);
			if(old!=null){
				formulaBom.setId(old.getId());
				formulaBom.setVersion(old.getVersion());
			}
			formulaBomService.mergeFormulaBom(formulaBom, null,null,null);
		}
	}
	
	@Override
	public Page<RMFormulaBom> getFormulaBomPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaBom\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaBom> page = new Page<RMFormulaBom>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaBom> list = formulaBomService.getFormulaBoms(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMFormulaBom> getFormulaBomPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaBom\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaBom> page = new Page<RMFormulaBom>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaBom> list = formulaBomService.getFormulaBoms(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_formula_FormulaBom,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}