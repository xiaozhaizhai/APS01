package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMTaskActivePendingCxfService;
import com.supcon.orchid.WOM.services.WOMTaskActivePendingService;
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
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.entities.WOMPutMaterialException;
import com.supcon.orchid.WOM.entities.WOMStandingcropRef;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_produceTask_TaskActivePending,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
@Service("wOMTaskActivePendingCxfService")
@Transactional
public class WOMTaskActivePendingCxfServiceImpl implements WOMTaskActivePendingCxfService {
	
	@Resource
	private WOMTaskActivePendingService taskActivePendingService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMTaskActivePending getTaskActivePending(long id){
		WOMTaskActivePending taskActivePending = taskActivePendingService.getTaskActivePending(id);
		return taskActivePending;
	}
	
	@Override
	
	public void updateTaskActivePending(long id, WOMTaskActivePending taskActivePending) {
		// TODO Auto-generated method stub
		taskActivePending.setId(id);
		taskActivePendingService.saveTaskActivePending(taskActivePending,null,null,null);
	}

	@Override
	
	public void createTaskActivePending(WOMTaskActivePending taskActivePending) {
		// TODO Auto-generated method stub
		taskActivePendingService.saveTaskActivePending(taskActivePending,null,null,null);
	}

	@Override
	
	public void deleteTaskActivePending(long id) {
		// TODO Auto-generated method stub
		WOMTaskActivePending taskActivePending = taskActivePendingService.getTaskActivePending(id);
		taskActivePendingService.deleteTaskActivePending(taskActivePending);
	}
	
	@Override
	public ArrayList<WOMTaskActivePending> getTaskActivePendingList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskActivePending\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMTaskActivePending> list = taskActivePendingService.getTaskActivePendings(customer, customerValue);
		 
		return (ArrayList<WOMTaskActivePending>) list;
	}

	@Override
	
	public void TaskActivePendingList(ArrayList<WOMTaskActivePending> taskActivePendings) {
		// TODO Auto-generated method stub
		for(WOMTaskActivePending taskActivePending : taskActivePendings){
			WOMTaskActivePending old = taskActivePendingService.loadTaskActivePendingByBussinessKey(taskActivePending);
			if(old!=null){
				taskActivePending.setId(old.getId());
				taskActivePending.setVersion(old.getVersion());
			}
			taskActivePendingService.mergeTaskActivePending(taskActivePending, null,null,null);
		}
	}
	
	@Override
	public Page<WOMTaskActivePending> getTaskActivePendingPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskActivePending\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMTaskActivePending> page = new Page<WOMTaskActivePending>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMTaskActivePending> list = taskActivePendingService.getTaskActivePendings(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMTaskActivePending> getTaskActivePendingPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskActivePending\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMTaskActivePending> page = new Page<WOMTaskActivePending>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMTaskActivePending> list = taskActivePendingService.getTaskActivePendings(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_produceTask_TaskActivePending,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}