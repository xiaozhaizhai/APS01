package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMTaskReportingCxfService;
import com.supcon.orchid.WOM.services.WOMTaskReportingService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMTaskReportingCxfService")
@Transactional
public class WOMTaskReportingCxfServiceImpl implements WOMTaskReportingCxfService {
	
	@Resource
	private WOMTaskReportingService taskReportingService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_taskReporting_taskReportingList")
	public WOMTaskReporting getTaskReporting(long id){
		WOMTaskReporting taskReporting = taskReportingService.getTaskReporting(id);
		return taskReporting;
	}
	
	@Override
	
	public void updateTaskReporting(long id, WOMTaskReporting taskReporting) {
		// TODO Auto-generated method stub
		taskReporting.setId(id);
		taskReportingService.saveTaskReporting(taskReporting,null,null,null);
	}

	@Override
	
	public void createTaskReporting(WOMTaskReporting taskReporting) {
		// TODO Auto-generated method stub
		taskReportingService.saveTaskReporting(taskReporting,null,null,null);
	}

	@Override
	
	public void deleteTaskReporting(long id) {
		// TODO Auto-generated method stub
		WOMTaskReporting taskReporting = taskReportingService.getTaskReporting(id);
		taskReportingService.deleteTaskReporting(taskReporting);
	}
	
	@Override
	public ArrayList<WOMTaskReporting> getTaskReportingList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskReporting\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMTaskReporting> list = taskReportingService.getTaskReportings(customer, customerValue);
		 
		return (ArrayList<WOMTaskReporting>) list;
	}

	@Override
	
	public void TaskReportingList(ArrayList<WOMTaskReporting> taskReportings) {
		// TODO Auto-generated method stub
		for(WOMTaskReporting taskReporting : taskReportings){
			WOMTaskReporting old = taskReportingService.loadTaskReportingByBussinessKey(taskReporting);
			if(old!=null){
				taskReporting.setId(old.getId());
				taskReporting.setVersion(old.getVersion());
			}
			taskReportingService.mergeTaskReporting(taskReporting, null,null,null);
		}
	}
	
	@Override
	public Page<WOMTaskReporting> getTaskReportingPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskReporting\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMTaskReporting> page = new Page<WOMTaskReporting>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMTaskReporting> list = taskReportingService.getTaskReportings(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMTaskReporting> getTaskReportingPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskReporting\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMTaskReporting> page = new Page<WOMTaskReporting>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMTaskReporting> list = taskReportingService.getTaskReportings(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}