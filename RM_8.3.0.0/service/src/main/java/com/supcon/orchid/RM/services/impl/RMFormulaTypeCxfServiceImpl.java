package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMFormulaTypeCxfService;
import com.supcon.orchid.RM.services.RMFormulaTypeService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_formulaType_FormulaType,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMFormulaTypeCxfService")
@Transactional
public class RMFormulaTypeCxfServiceImpl implements RMFormulaTypeCxfService {
	
	@Resource
	private RMFormulaTypeService formulaTypeService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("RM_7.5.0.0_formulaType_typeLayOut")
	public RMFormulaType getFormulaType(long id){
		RMFormulaType formulaType = formulaTypeService.getFormulaType(id);
		return formulaType;
	}
	
	@Override
	
	public void updateFormulaType(long id, RMFormulaType formulaType) {
		// TODO Auto-generated method stub
		formulaType.setId(id);
		formulaTypeService.saveFormulaType(formulaType,null,null,null);
	}

	@Override
	
	public void createFormulaType(RMFormulaType formulaType) {
		// TODO Auto-generated method stub
		formulaTypeService.saveFormulaType(formulaType,null,null,null);
	}

	@Override
	
	public void deleteFormulaType(long id) {
		// TODO Auto-generated method stub
		RMFormulaType formulaType = formulaTypeService.getFormulaType(id);
		formulaTypeService.deleteFormulaType(formulaType);
	}
	
	@Override
	public ArrayList<RMFormulaType> getFormulaTypeList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaType\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMFormulaType> list = formulaTypeService.getFormulaTypes(customer, customerValue);
		 
		return (ArrayList<RMFormulaType>) list;
	}

	@Override
	
	public void FormulaTypeList(ArrayList<RMFormulaType> formulaTypes) {
		// TODO Auto-generated method stub
		for(RMFormulaType formulaType : formulaTypes){
			RMFormulaType old = formulaTypeService.loadFormulaTypeByBussinessKey(formulaType);
			if(old!=null){
				formulaType.setId(old.getId());
				formulaType.setVersion(old.getVersion());
			}
			formulaTypeService.mergeFormulaType(formulaType, null,null,null);
		}
	}
	
	@Override
	public Page<RMFormulaType> getFormulaTypePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaType\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaType> page = new Page<RMFormulaType>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaType> list = formulaTypeService.getFormulaTypes(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMFormulaType> getFormulaTypePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"formulaType\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFormulaType> page = new Page<RMFormulaType>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFormulaType> list = formulaTypeService.getFormulaTypes(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_formulaType_FormulaType,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}