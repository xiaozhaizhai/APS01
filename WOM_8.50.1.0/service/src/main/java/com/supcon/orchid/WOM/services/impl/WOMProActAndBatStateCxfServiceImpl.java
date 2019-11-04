package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMProActAndBatStateCxfService;
import com.supcon.orchid.WOM.services.WOMProActAndBatStateService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.WOM.entities.WOMActiveExelog;
import com.supcon.orchid.WOM.entities.WOMBatchNumRule;
import com.supcon.orchid.WOM.entities.WOMBatchProdTaskPart;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTask;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderHead;
import com.supcon.orchid.WOM.entities.WOMMakeBatOrderPart;
import com.supcon.orchid.WOM.entities.WOMCheckManage;
import com.supcon.orchid.WOM.entities.WOMInspect;
import com.supcon.orchid.WOM.entities.WOMProduceTaskManage;
import com.supcon.orchid.WOM.entities.WOMPutInManage;
import com.supcon.orchid.WOM.entities.WOMTaskReportManage;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialPart;
import com.supcon.orchid.WOM.entities.WOMProActAndBatState;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;
import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_proActiveAndBatchState_ProActAndBatState,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMProActAndBatStateCxfService")
@Transactional
public class WOMProActAndBatStateCxfServiceImpl implements WOMProActAndBatStateCxfService {
	
	@Resource
	private WOMProActAndBatStateService proActAndBatStateService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_proActiveAndBatchState_stateList")
	public WOMProActAndBatState getProActAndBatState(long id){
		WOMProActAndBatState proActAndBatState = proActAndBatStateService.getProActAndBatState(id);
		return proActAndBatState;
	}
	
	@Override
	@BAPPermission("WOM_7.5.0.0_proActiveAndBatchState_stateList_BUTTON_edit")
	public void updateProActAndBatState(long id, WOMProActAndBatState proActAndBatState) {
		// TODO Auto-generated method stub
		proActAndBatState.setId(id);
		proActAndBatStateService.saveProActAndBatState(proActAndBatState,null,null,null);
	}

	@Override
	@BAPPermission("WOM_7.5.0.0_proActiveAndBatchState_stateList_BUTTON_add")
	public void createProActAndBatState(WOMProActAndBatState proActAndBatState) {
		// TODO Auto-generated method stub
		proActAndBatStateService.saveProActAndBatState(proActAndBatState,null,null,null);
	}

	@Override
	@BAPPermission("WOM_7.5.0.0_proActiveAndBatchState_stateList_BUTTON_del")
	public void deleteProActAndBatState(long id) {
		// TODO Auto-generated method stub
		WOMProActAndBatState proActAndBatState = proActAndBatStateService.getProActAndBatState(id);
		proActAndBatStateService.deleteProActAndBatState(proActAndBatState);
	}
	
	@Override
	public ArrayList<WOMProActAndBatState> getProActAndBatStateList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"proActAndBatState\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMProActAndBatState> list = proActAndBatStateService.getProActAndBatStates(customer, customerValue);
		 
		return (ArrayList<WOMProActAndBatState>) list;
	}

	@Override
	@BAPPermission("WOM_7.5.0.0_proActiveAndBatchState_stateList_BUTTON_add")
	public void ProActAndBatStateList(ArrayList<WOMProActAndBatState> proActAndBatStates) {
		// TODO Auto-generated method stub
		for(WOMProActAndBatState proActAndBatState : proActAndBatStates){
			WOMProActAndBatState old = proActAndBatStateService.loadProActAndBatStateByBussinessKey(proActAndBatState);
			if(old!=null){
				proActAndBatState.setId(old.getId());
				proActAndBatState.setVersion(old.getVersion());
			}
			proActAndBatStateService.mergeProActAndBatState(proActAndBatState, null,null,null);
		}
	}
	
	@Override
	public Page<WOMProActAndBatState> getProActAndBatStatePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"proActAndBatState\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProActAndBatState> page = new Page<WOMProActAndBatState>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProActAndBatState> list = proActAndBatStateService.getProActAndBatStates(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMProActAndBatState> getProActAndBatStatePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"proActAndBatState\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProActAndBatState> page = new Page<WOMProActAndBatState>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProActAndBatState> list = proActAndBatStateService.getProActAndBatStates(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_proActiveAndBatchState_ProActAndBatState,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}