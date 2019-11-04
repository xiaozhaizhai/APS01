package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMTaskBeforeProcessCxfService;
import com.supcon.orchid.WOM.services.WOMTaskBeforeProcessService;
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
import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;
import com.supcon.orchid.WOM.entities.WOMPrepareMaterialPart;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;
import com.supcon.orchid.WOM.entities.WOMMaterialBatchNums;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMTaskActivePending;
import com.supcon.orchid.WOM.entities.WOMTaskBeforeProcess;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_produceTask_TaskBeforeProcess,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMTaskBeforeProcessCxfService")
@Transactional
public class WOMTaskBeforeProcessCxfServiceImpl implements WOMTaskBeforeProcessCxfService {
	
	@Resource
	private WOMTaskBeforeProcessService taskBeforeProcessService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMTaskBeforeProcess getTaskBeforeProcess(long id){
		WOMTaskBeforeProcess taskBeforeProcess = taskBeforeProcessService.getTaskBeforeProcess(id);
		return taskBeforeProcess;
	}
	
	@Override
	
	public void updateTaskBeforeProcess(long id, WOMTaskBeforeProcess taskBeforeProcess) {
		// TODO Auto-generated method stub
		taskBeforeProcess.setId(id);
		taskBeforeProcessService.saveTaskBeforeProcess(taskBeforeProcess,null,null,null);
	}

	@Override
	
	public void createTaskBeforeProcess(WOMTaskBeforeProcess taskBeforeProcess) {
		// TODO Auto-generated method stub
		taskBeforeProcessService.saveTaskBeforeProcess(taskBeforeProcess,null,null,null);
	}

	@Override
	
	public void deleteTaskBeforeProcess(long id) {
		// TODO Auto-generated method stub
		WOMTaskBeforeProcess taskBeforeProcess = taskBeforeProcessService.getTaskBeforeProcess(id);
		taskBeforeProcessService.deleteTaskBeforeProcess(taskBeforeProcess);
	}
	
	@Override
	public ArrayList<WOMTaskBeforeProcess> getTaskBeforeProcessList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskBeforeProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMTaskBeforeProcess> list = taskBeforeProcessService.getTaskBeforeProcesss(customer, customerValue);
		 
		return (ArrayList<WOMTaskBeforeProcess>) list;
	}

	@Override
	
	public void TaskBeforeProcessList(ArrayList<WOMTaskBeforeProcess> taskBeforeProcesss) {
		// TODO Auto-generated method stub
		for(WOMTaskBeforeProcess taskBeforeProcess : taskBeforeProcesss){
			WOMTaskBeforeProcess old = taskBeforeProcessService.loadTaskBeforeProcessByBussinessKey(taskBeforeProcess);
			if(old!=null){
				taskBeforeProcess.setId(old.getId());
				taskBeforeProcess.setVersion(old.getVersion());
			}
			taskBeforeProcessService.mergeTaskBeforeProcess(taskBeforeProcess, null,null,null);
		}
	}
	
	@Override
	public Page<WOMTaskBeforeProcess> getTaskBeforeProcessPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskBeforeProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMTaskBeforeProcess> page = new Page<WOMTaskBeforeProcess>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMTaskBeforeProcess> list = taskBeforeProcessService.getTaskBeforeProcesss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMTaskBeforeProcess> getTaskBeforeProcessPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskBeforeProcess\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMTaskBeforeProcess> page = new Page<WOMTaskBeforeProcess>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMTaskBeforeProcess> list = taskBeforeProcessService.getTaskBeforeProcesss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_produceTask_TaskBeforeProcess,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}