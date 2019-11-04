package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMTaskReportingPartCxfService;
import com.supcon.orchid.WOM.services.WOMTaskReportingPartService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_taskReporting_TaskReportingPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMTaskReportingPartCxfService")
@Transactional
public class WOMTaskReportingPartCxfServiceImpl implements WOMTaskReportingPartCxfService {
	
	@Resource
	private WOMTaskReportingPartService taskReportingPartService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_taskReporting_reportDetaliList")
	public WOMTaskReportingPart getTaskReportingPart(long id){
		WOMTaskReportingPart taskReportingPart = taskReportingPartService.getTaskReportingPart(id);
		return taskReportingPart;
	}
	
	@Override
	
	public void updateTaskReportingPart(long id, WOMTaskReportingPart taskReportingPart) {
		// TODO Auto-generated method stub
		taskReportingPart.setId(id);
		taskReportingPartService.saveTaskReportingPart(taskReportingPart,null,null,null);
	}

	@Override
	
	public void createTaskReportingPart(WOMTaskReportingPart taskReportingPart) {
		// TODO Auto-generated method stub
		taskReportingPartService.saveTaskReportingPart(taskReportingPart,null,null,null);
	}

	@Override
	
	public void deleteTaskReportingPart(long id) {
		// TODO Auto-generated method stub
		WOMTaskReportingPart taskReportingPart = taskReportingPartService.getTaskReportingPart(id);
		taskReportingPartService.deleteTaskReportingPart(taskReportingPart);
	}
	
	@Override
	public ArrayList<WOMTaskReportingPart> getTaskReportingPartList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskReportingPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMTaskReportingPart> list = taskReportingPartService.getTaskReportingParts(customer, customerValue);
		 
		return (ArrayList<WOMTaskReportingPart>) list;
	}

	@Override
	
	public void TaskReportingPartList(ArrayList<WOMTaskReportingPart> taskReportingParts) {
		// TODO Auto-generated method stub
		for(WOMTaskReportingPart taskReportingPart : taskReportingParts){
			WOMTaskReportingPart old = taskReportingPartService.loadTaskReportingPartByBussinessKey(taskReportingPart);
			if(old!=null){
				taskReportingPart.setId(old.getId());
				taskReportingPart.setVersion(old.getVersion());
			}
			taskReportingPartService.mergeTaskReportingPart(taskReportingPart, null,null,null);
		}
	}
	
	@Override
	public Page<WOMTaskReportingPart> getTaskReportingPartPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskReportingPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMTaskReportingPart> page = new Page<WOMTaskReportingPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMTaskReportingPart> list = taskReportingPartService.getTaskReportingParts(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMTaskReportingPart> getTaskReportingPartPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskReportingPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMTaskReportingPart> page = new Page<WOMTaskReportingPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMTaskReportingPart> list = taskReportingPartService.getTaskReportingParts(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_taskReporting_TaskReportingPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}