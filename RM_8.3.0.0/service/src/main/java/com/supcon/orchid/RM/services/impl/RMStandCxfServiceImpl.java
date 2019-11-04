package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMStandCxfService;
import com.supcon.orchid.RM.services.RMStandService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_qualityStandard_Stand,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMStandCxfService")
@Transactional
public class RMStandCxfServiceImpl implements RMStandCxfService {
	
	@Resource
	private RMStandService standService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMStand getStand(long id){
		RMStand stand = standService.getStand(id);
		return stand;
	}
	
	@Override
	
	public void updateStand(long id, RMStand stand) {
		// TODO Auto-generated method stub
		stand.setId(id);
		standService.saveStand(stand,null,null,null);
	}

	@Override
	
	public void createStand(RMStand stand) {
		// TODO Auto-generated method stub
		standService.saveStand(stand,null,null,null);
	}

	@Override
	
	public void deleteStand(long id) {
		// TODO Auto-generated method stub
		RMStand stand = standService.getStand(id);
		standService.deleteStand(stand);
	}
	
	@Override
	public ArrayList<RMStand> getStandList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"stand\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMStand> list = standService.getStands(customer, customerValue);
		 
		return (ArrayList<RMStand>) list;
	}

	@Override
	
	public void StandList(ArrayList<RMStand> stands) {
		// TODO Auto-generated method stub
		for(RMStand stand : stands){
			RMStand old = standService.loadStandByBussinessKey(stand);
			if(old!=null){
				stand.setId(old.getId());
				stand.setVersion(old.getVersion());
			}
			standService.mergeStand(stand, null,null,null);
		}
	}
	
	@Override
	public Page<RMStand> getStandPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"stand\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMStand> page = new Page<RMStand>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMStand> list = standService.getStands(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMStand> getStandPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"stand\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMStand> page = new Page<RMStand>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMStand> list = standService.getStands(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_qualityStandard_Stand,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}