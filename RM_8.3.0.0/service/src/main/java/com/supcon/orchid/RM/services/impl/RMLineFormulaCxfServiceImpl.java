package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMLineFormulaCxfService;
import com.supcon.orchid.RM.services.RMLineFormulaService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_suitedLine_LineFormula,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMLineFormulaCxfService")
@Transactional
public class RMLineFormulaCxfServiceImpl implements RMLineFormulaCxfService {
	
	@Resource
	private RMLineFormulaService lineFormulaService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("RM_7.5.0.0_suitedLine_suitedLineList")
	public RMLineFormula getLineFormula(long id){
		RMLineFormula lineFormula = lineFormulaService.getLineFormula(id);
		return lineFormula;
	}
	
	@Override
	@BAPPermission("RM_7.5.0.0_suitedLine_suitedLineList_BUTTON_update")
	public void updateLineFormula(long id, RMLineFormula lineFormula) {
		// TODO Auto-generated method stub
		lineFormula.setId(id);
		lineFormulaService.saveLineFormula(lineFormula,null,null,null);
	}

	@Override
	@BAPPermission("RM_7.5.0.0_suitedLine_suitedLineList_BUTTON_add")
	public void createLineFormula(RMLineFormula lineFormula) {
		// TODO Auto-generated method stub
		lineFormulaService.saveLineFormula(lineFormula,null,null,null);
	}

	@Override
	@BAPPermission("RM_7.5.0.0_suitedLine_suitedLineList_BUTTON_delete")
	public void deleteLineFormula(long id) {
		// TODO Auto-generated method stub
		RMLineFormula lineFormula = lineFormulaService.getLineFormula(id);
		lineFormulaService.deleteLineFormula(lineFormula);
	}
	
	@Override
	public ArrayList<RMLineFormula> getLineFormulaList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"lineFormula\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMLineFormula> list = lineFormulaService.getLineFormulas(customer, customerValue);
		 
		return (ArrayList<RMLineFormula>) list;
	}

	@Override
	@BAPPermission("RM_7.5.0.0_suitedLine_suitedLineList_BUTTON_add")
	public void LineFormulaList(ArrayList<RMLineFormula> lineFormulas) {
		// TODO Auto-generated method stub
		for(RMLineFormula lineFormula : lineFormulas){
			RMLineFormula old = lineFormulaService.loadLineFormulaByBussinessKey(lineFormula);
			if(old!=null){
				lineFormula.setId(old.getId());
				lineFormula.setVersion(old.getVersion());
			}
			lineFormulaService.mergeLineFormula(lineFormula, null,null,null);
		}
	}
	
	@Override
	public Page<RMLineFormula> getLineFormulaPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"lineFormula\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMLineFormula> page = new Page<RMLineFormula>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMLineFormula> list = lineFormulaService.getLineFormulas(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMLineFormula> getLineFormulaPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"lineFormula\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMLineFormula> page = new Page<RMLineFormula>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMLineFormula> list = lineFormulaService.getLineFormulas(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_suitedLine_LineFormula,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}