package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMProduceTaskProcessCxfService;
import com.supcon.orchid.WOM.services.WOMProduceTaskProcessService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_produceTask_ProduceTaskProcess,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMProduceTaskProcessCxfService")
@Transactional
public class WOMProduceTaskProcessCxfServiceImpl implements WOMProduceTaskProcessCxfService {
	
	@Resource
	private WOMProduceTaskProcessService produceTaskProcessService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMProduceTaskProcess getProduceTaskProcess(long id){
		WOMProduceTaskProcess produceTaskProcess = produceTaskProcessService.getProduceTaskProcess(id);
		return produceTaskProcess;
	}
	
	@Override
	
	public void updateProduceTaskProcess(long id, WOMProduceTaskProcess produceTaskProcess) {
		// TODO Auto-generated method stub
		produceTaskProcess.setId(id);
		produceTaskProcessService.saveProduceTaskProcess(produceTaskProcess,null,null,null);
	}

	@Override
	
	public void createProduceTaskProcess(WOMProduceTaskProcess produceTaskProcess) {
		// TODO Auto-generated method stub
		produceTaskProcessService.saveProduceTaskProcess(produceTaskProcess,null,null,null);
	}

	@Override
	
	public void deleteProduceTaskProcess(long id) {
		// TODO Auto-generated method stub
		WOMProduceTaskProcess produceTaskProcess = produceTaskProcessService.getProduceTaskProcess(id);
		produceTaskProcessService.deleteProduceTaskProcess(produceTaskProcess);
	}
	
	@Override
	public ArrayList<WOMProduceTaskProcess> getProduceTaskProcessList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTaskProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMProduceTaskProcess> list = produceTaskProcessService.getProduceTaskProcesss(customer, customerValue);
		 
		return (ArrayList<WOMProduceTaskProcess>) list;
	}

	@Override
	
	public void ProduceTaskProcessList(ArrayList<WOMProduceTaskProcess> produceTaskProcesss) {
		// TODO Auto-generated method stub
		for(WOMProduceTaskProcess produceTaskProcess : produceTaskProcesss){
			WOMProduceTaskProcess old = produceTaskProcessService.loadProduceTaskProcessByBussinessKey(produceTaskProcess);
			if(old!=null){
				produceTaskProcess.setId(old.getId());
				produceTaskProcess.setVersion(old.getVersion());
			}
			produceTaskProcessService.mergeProduceTaskProcess(produceTaskProcess, null,null,null);
		}
	}
	
	@Override
	public Page<WOMProduceTaskProcess> getProduceTaskProcessPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTaskProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProduceTaskProcess> page = new Page<WOMProduceTaskProcess>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProduceTaskProcess> list = produceTaskProcessService.getProduceTaskProcesss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMProduceTaskProcess> getProduceTaskProcessPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTaskProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProduceTaskProcess> page = new Page<WOMProduceTaskProcess>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProduceTaskProcess> list = produceTaskProcessService.getProduceTaskProcesss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_produceTask_ProduceTaskProcess,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}