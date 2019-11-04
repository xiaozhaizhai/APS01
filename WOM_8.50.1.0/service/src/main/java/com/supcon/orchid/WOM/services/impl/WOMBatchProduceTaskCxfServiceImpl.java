package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMBatchProduceTaskCxfService;
import com.supcon.orchid.WOM.services.WOMBatchProduceTaskService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMBatchProduceTaskCxfService")
@Transactional
public class WOMBatchProduceTaskCxfServiceImpl implements WOMBatchProduceTaskCxfService {
	
	@Resource
	private WOMBatchProduceTaskService batchProduceTaskService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_batchProduceTask_batchTaskList")
	public WOMBatchProduceTask getBatchProduceTask(long id){
		WOMBatchProduceTask batchProduceTask = batchProduceTaskService.getBatchProduceTask(id);
		return batchProduceTask;
	}
	
	@Override
	
	public void updateBatchProduceTask(long id, WOMBatchProduceTask batchProduceTask) {
		// TODO Auto-generated method stub
		batchProduceTask.setId(id);
		batchProduceTaskService.saveBatchProduceTask(batchProduceTask,null,null,null);
	}

	@Override
	
	public void createBatchProduceTask(WOMBatchProduceTask batchProduceTask) {
		// TODO Auto-generated method stub
		batchProduceTaskService.saveBatchProduceTask(batchProduceTask,null,null,null);
	}

	@Override
	
	public void deleteBatchProduceTask(long id) {
		// TODO Auto-generated method stub
		WOMBatchProduceTask batchProduceTask = batchProduceTaskService.getBatchProduceTask(id);
		batchProduceTaskService.deleteBatchProduceTask(batchProduceTask);
	}
	
	@Override
	public ArrayList<WOMBatchProduceTask> getBatchProduceTaskList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchProduceTask\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMBatchProduceTask> list = batchProduceTaskService.getBatchProduceTasks(customer, customerValue);
		 
		return (ArrayList<WOMBatchProduceTask>) list;
	}

	@Override
	
	public void BatchProduceTaskList(ArrayList<WOMBatchProduceTask> batchProduceTasks) {
		// TODO Auto-generated method stub
		for(WOMBatchProduceTask batchProduceTask : batchProduceTasks){
			WOMBatchProduceTask old = batchProduceTaskService.loadBatchProduceTaskByBussinessKey(batchProduceTask);
			if(old!=null){
				batchProduceTask.setId(old.getId());
				batchProduceTask.setVersion(old.getVersion());
			}
			batchProduceTaskService.mergeBatchProduceTask(batchProduceTask, null,null,null);
		}
	}
	
	@Override
	public Page<WOMBatchProduceTask> getBatchProduceTaskPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchProduceTask\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchProduceTask> page = new Page<WOMBatchProduceTask>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchProduceTask> list = batchProduceTaskService.getBatchProduceTasks(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMBatchProduceTask> getBatchProduceTaskPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchProduceTask\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchProduceTask> page = new Page<WOMBatchProduceTask>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchProduceTask> list = batchProduceTaskService.getBatchProduceTasks(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}