package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMProcessUnitCxfService;
import com.supcon.orchid.RM.services.RMProcessUnitService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_suitedLine_ProcessUnit,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMProcessUnitCxfService")
@Transactional
public class RMProcessUnitCxfServiceImpl implements RMProcessUnitCxfService {
	
	@Resource
	private RMProcessUnitService processUnitService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMProcessUnit getProcessUnit(long id){
		RMProcessUnit processUnit = processUnitService.getProcessUnit(id);
		return processUnit;
	}
	
	@Override
	
	public void updateProcessUnit(long id, RMProcessUnit processUnit) {
		// TODO Auto-generated method stub
		processUnit.setId(id);
		processUnitService.saveProcessUnit(processUnit,null,null,null);
	}

	@Override
	
	public void createProcessUnit(RMProcessUnit processUnit) {
		// TODO Auto-generated method stub
		processUnitService.saveProcessUnit(processUnit,null,null,null);
	}

	@Override
	
	public void deleteProcessUnit(long id) {
		// TODO Auto-generated method stub
		RMProcessUnit processUnit = processUnitService.getProcessUnit(id);
		processUnitService.deleteProcessUnit(processUnit);
	}
	
	@Override
	public ArrayList<RMProcessUnit> getProcessUnitList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processUnit\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMProcessUnit> list = processUnitService.getProcessUnits(customer, customerValue);
		 
		return (ArrayList<RMProcessUnit>) list;
	}

	@Override
	
	public void ProcessUnitList(ArrayList<RMProcessUnit> processUnits) {
		// TODO Auto-generated method stub
		for(RMProcessUnit processUnit : processUnits){
			RMProcessUnit old = processUnitService.loadProcessUnitByBussinessKey(processUnit);
			if(old!=null){
				processUnit.setId(old.getId());
				processUnit.setVersion(old.getVersion());
			}
			processUnitService.mergeProcessUnit(processUnit, null,null,null);
		}
	}
	
	@Override
	public Page<RMProcessUnit> getProcessUnitPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processUnit\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMProcessUnit> page = new Page<RMProcessUnit>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMProcessUnit> list = processUnitService.getProcessUnits(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMProcessUnit> getProcessUnitPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processUnit\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMProcessUnit> page = new Page<RMProcessUnit>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMProcessUnit> list = processUnitService.getProcessUnits(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_suitedLine_ProcessUnit,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}