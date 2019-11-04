package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMProcessTypeCxfService;
import com.supcon.orchid.RM.services.RMProcessTypeService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMProcessTypeCxfService")
@Transactional
public class RMProcessTypeCxfServiceImpl implements RMProcessTypeCxfService {
	
	@Resource
	private RMProcessTypeService processTypeService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("RM_7.5.0.0_processType_processTypeList")
	public RMProcessType getProcessType(long id){
		RMProcessType processType = processTypeService.getProcessType(id);
		return processType;
	}
	
	@Override
	@BAPPermission("RM_7.5.0.0_processType_processTypeList_BUTTON_modify")
	public void updateProcessType(long id, RMProcessType processType) {
		// TODO Auto-generated method stub
		processType.setId(id);
		processTypeService.saveProcessType(processType,null,null,null);
	}

	@Override
	@BAPPermission("RM_7.5.0.0_processType_processTypeList_BUTTON_add")
	public void createProcessType(RMProcessType processType) {
		// TODO Auto-generated method stub
		processTypeService.saveProcessType(processType,null,null,null);
	}

	@Override
	@BAPPermission("RM_7.5.0.0_processType_processTypeList_BUTTON_delete")
	public void deleteProcessType(long id) {
		// TODO Auto-generated method stub
		RMProcessType processType = processTypeService.getProcessType(id);
		processTypeService.deleteProcessType(processType);
	}
	
	@Override
	public ArrayList<RMProcessType> getProcessTypeList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processType\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMProcessType> list = processTypeService.getProcessTypes(customer, customerValue);
		 
		return (ArrayList<RMProcessType>) list;
	}

	@Override
	@BAPPermission("RM_7.5.0.0_processType_processTypeList_BUTTON_add")
	public void ProcessTypeList(ArrayList<RMProcessType> processTypes) {
		// TODO Auto-generated method stub
		for(RMProcessType processType : processTypes){
			RMProcessType old = processTypeService.loadProcessTypeByBussinessKey(processType);
			if(old!=null){
				processType.setId(old.getId());
				processType.setVersion(old.getVersion());
			}
			processTypeService.mergeProcessType(processType, null,null,null);
		}
	}
	
	@Override
	public Page<RMProcessType> getProcessTypePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processType\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMProcessType> page = new Page<RMProcessType>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMProcessType> list = processTypeService.getProcessTypes(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMProcessType> getProcessTypePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processType\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMProcessType> page = new Page<RMProcessType>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMProcessType> list = processTypeService.getProcessTypes(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}