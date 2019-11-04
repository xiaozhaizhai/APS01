package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMProduceTaskActiveCxfService;
import com.supcon.orchid.WOM.services.WOMProduceTaskActiveService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_produceTask_ProduceTaskActive,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMProduceTaskActiveCxfService")
@Transactional
public class WOMProduceTaskActiveCxfServiceImpl implements WOMProduceTaskActiveCxfService {
	
	@Resource
	private WOMProduceTaskActiveService produceTaskActiveService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMProduceTaskActive getProduceTaskActive(long id){
		WOMProduceTaskActive produceTaskActive = produceTaskActiveService.getProduceTaskActive(id);
		return produceTaskActive;
	}
	
	@Override
	
	public void updateProduceTaskActive(long id, WOMProduceTaskActive produceTaskActive) {
		// TODO Auto-generated method stub
		produceTaskActive.setId(id);
		produceTaskActiveService.saveProduceTaskActive(produceTaskActive,null,null,null);
	}

	@Override
	
	public void createProduceTaskActive(WOMProduceTaskActive produceTaskActive) {
		// TODO Auto-generated method stub
		produceTaskActiveService.saveProduceTaskActive(produceTaskActive,null,null,null);
	}

	@Override
	
	public void deleteProduceTaskActive(long id) {
		// TODO Auto-generated method stub
		WOMProduceTaskActive produceTaskActive = produceTaskActiveService.getProduceTaskActive(id);
		produceTaskActiveService.deleteProduceTaskActive(produceTaskActive);
	}
	
	@Override
	public ArrayList<WOMProduceTaskActive> getProduceTaskActiveList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTaskActive\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMProduceTaskActive> list = produceTaskActiveService.getProduceTaskActives(customer, customerValue);
		 
		return (ArrayList<WOMProduceTaskActive>) list;
	}

	@Override
	
	public void ProduceTaskActiveList(ArrayList<WOMProduceTaskActive> produceTaskActives) {
		// TODO Auto-generated method stub
		for(WOMProduceTaskActive produceTaskActive : produceTaskActives){
			WOMProduceTaskActive old = produceTaskActiveService.loadProduceTaskActiveByBussinessKey(produceTaskActive);
			if(old!=null){
				produceTaskActive.setId(old.getId());
				produceTaskActive.setVersion(old.getVersion());
			}
			produceTaskActiveService.mergeProduceTaskActive(produceTaskActive, null,null,null);
		}
	}
	
	@Override
	public Page<WOMProduceTaskActive> getProduceTaskActivePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTaskActive\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProduceTaskActive> page = new Page<WOMProduceTaskActive>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProduceTaskActive> list = produceTaskActiveService.getProduceTaskActives(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMProduceTaskActive> getProduceTaskActivePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTaskActive\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProduceTaskActive> page = new Page<WOMProduceTaskActive>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProduceTaskActive> list = produceTaskActiveService.getProduceTaskActives(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_produceTask_ProduceTaskActive,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}