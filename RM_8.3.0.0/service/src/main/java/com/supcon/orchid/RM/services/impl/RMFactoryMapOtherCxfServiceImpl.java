package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMFactoryMapOtherCxfService;
import com.supcon.orchid.RM.services.RMFactoryMapOtherService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_interfaceService_FactoryMapOther,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMFactoryMapOtherCxfService")
@Transactional
public class RMFactoryMapOtherCxfServiceImpl implements RMFactoryMapOtherCxfService {
	
	@Resource
	private RMFactoryMapOtherService factoryMapOtherService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMFactoryMapOther getFactoryMapOther(long id){
		RMFactoryMapOther factoryMapOther = factoryMapOtherService.getFactoryMapOther(id);
		return factoryMapOther;
	}
	
	@Override
	
	public void updateFactoryMapOther(long id, RMFactoryMapOther factoryMapOther) {
		// TODO Auto-generated method stub
		factoryMapOther.setId(id);
		factoryMapOtherService.saveFactoryMapOther(factoryMapOther,null,null,null);
	}

	@Override
	
	public void createFactoryMapOther(RMFactoryMapOther factoryMapOther) {
		// TODO Auto-generated method stub
		factoryMapOtherService.saveFactoryMapOther(factoryMapOther,null,null,null);
	}

	@Override
	
	public void deleteFactoryMapOther(long id) {
		// TODO Auto-generated method stub
		RMFactoryMapOther factoryMapOther = factoryMapOtherService.getFactoryMapOther(id);
		factoryMapOtherService.deleteFactoryMapOther(factoryMapOther);
	}
	
	@Override
	public ArrayList<RMFactoryMapOther> getFactoryMapOtherList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"factoryMapOther\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMFactoryMapOther> list = factoryMapOtherService.getFactoryMapOthers(customer, customerValue);
		 
		return (ArrayList<RMFactoryMapOther>) list;
	}

	@Override
	
	public void FactoryMapOtherList(ArrayList<RMFactoryMapOther> factoryMapOthers) {
		// TODO Auto-generated method stub
		for(RMFactoryMapOther factoryMapOther : factoryMapOthers){
			RMFactoryMapOther old = factoryMapOtherService.loadFactoryMapOtherByBussinessKey(factoryMapOther);
			if(old!=null){
				factoryMapOther.setId(old.getId());
				factoryMapOther.setVersion(old.getVersion());
			}
			factoryMapOtherService.mergeFactoryMapOther(factoryMapOther, null,null,null);
		}
	}
	
	@Override
	public Page<RMFactoryMapOther> getFactoryMapOtherPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"factoryMapOther\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFactoryMapOther> page = new Page<RMFactoryMapOther>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFactoryMapOther> list = factoryMapOtherService.getFactoryMapOthers(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMFactoryMapOther> getFactoryMapOtherPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"factoryMapOther\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMFactoryMapOther> page = new Page<RMFactoryMapOther>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMFactoryMapOther> list = factoryMapOtherService.getFactoryMapOthers(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_interfaceService_FactoryMapOther,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}