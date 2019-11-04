package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMProduceTaskCxfService;
import com.supcon.orchid.WOM.services.WOMProduceTaskService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMProduceTaskCxfService")
@Transactional
public class WOMProduceTaskCxfServiceImpl implements WOMProduceTaskCxfService {
	
	@Resource
	private WOMProduceTaskService produceTaskService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_produceTask_makeTaskList")
	public WOMProduceTask getProduceTask(long id){
		WOMProduceTask produceTask = produceTaskService.getProduceTask(id);
		return produceTask;
	}
	
	@Override
	
	public void updateProduceTask(long id, WOMProduceTask produceTask) {
		// TODO Auto-generated method stub
		produceTask.setId(id);
		produceTaskService.saveProduceTask(produceTask,null,null,null);
	}

	@Override
	
	public void createProduceTask(WOMProduceTask produceTask) {
		// TODO Auto-generated method stub
		produceTaskService.saveProduceTask(produceTask,null,null,null);
	}

	@Override
	
	public void deleteProduceTask(long id) {
		// TODO Auto-generated method stub
		WOMProduceTask produceTask = produceTaskService.getProduceTask(id);
		produceTaskService.deleteProduceTask(produceTask);
	}
	
	@Override
	public ArrayList<WOMProduceTask> getProduceTaskList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTask\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMProduceTask> list = produceTaskService.getProduceTasks(customer, customerValue);
		 
		return (ArrayList<WOMProduceTask>) list;
	}

	@Override
	
	public void ProduceTaskList(ArrayList<WOMProduceTask> produceTasks) {
		// TODO Auto-generated method stub
		for(WOMProduceTask produceTask : produceTasks){
			WOMProduceTask old = produceTaskService.loadProduceTaskByBussinessKey(produceTask);
			if(old!=null){
				produceTask.setId(old.getId());
				produceTask.setVersion(old.getVersion());
			}
			produceTaskService.mergeProduceTask(produceTask, null,null,null);
		}
	}
	
	@Override
	public Page<WOMProduceTask> getProduceTaskPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTask\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProduceTask> page = new Page<WOMProduceTask>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProduceTask> list = produceTaskService.getProduceTasks(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMProduceTask> getProduceTaskPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTask\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProduceTask> page = new Page<WOMProduceTask>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProduceTask> list = produceTaskService.getProduceTasks(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}