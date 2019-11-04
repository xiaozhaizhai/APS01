package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMTaskReportManageCxfService;
import com.supcon.orchid.WOM.services.WOMTaskReportManageService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_generalManage_TaskReportManage,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMTaskReportManageCxfService")
@Transactional
public class WOMTaskReportManageCxfServiceImpl implements WOMTaskReportManageCxfService {
	
	@Resource
	private WOMTaskReportManageService taskReportManageService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMTaskReportManage getTaskReportManage(long id){
		WOMTaskReportManage taskReportManage = taskReportManageService.getTaskReportManage(id);
		return taskReportManage;
	}
	
	@Override
	
	public void updateTaskReportManage(long id, WOMTaskReportManage taskReportManage) {
		// TODO Auto-generated method stub
		taskReportManage.setId(id);
		taskReportManageService.saveTaskReportManage(taskReportManage,null,null,null);
	}

	@Override
	
	public void createTaskReportManage(WOMTaskReportManage taskReportManage) {
		// TODO Auto-generated method stub
		taskReportManageService.saveTaskReportManage(taskReportManage,null,null,null);
	}

	@Override
	
	public void deleteTaskReportManage(long id) {
		// TODO Auto-generated method stub
		WOMTaskReportManage taskReportManage = taskReportManageService.getTaskReportManage(id);
		taskReportManageService.deleteTaskReportManage(taskReportManage);
	}
	
	@Override
	public ArrayList<WOMTaskReportManage> getTaskReportManageList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskReportManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMTaskReportManage> list = taskReportManageService.getTaskReportManages(customer, customerValue);
		 
		return (ArrayList<WOMTaskReportManage>) list;
	}

	@Override
	
	public void TaskReportManageList(ArrayList<WOMTaskReportManage> taskReportManages) {
		// TODO Auto-generated method stub
		for(WOMTaskReportManage taskReportManage : taskReportManages){
			WOMTaskReportManage old = taskReportManageService.loadTaskReportManageByBussinessKey(taskReportManage);
			if(old!=null){
				taskReportManage.setId(old.getId());
				taskReportManage.setVersion(old.getVersion());
			}
			taskReportManageService.mergeTaskReportManage(taskReportManage, null,null,null);
		}
	}
	
	@Override
	public Page<WOMTaskReportManage> getTaskReportManagePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskReportManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMTaskReportManage> page = new Page<WOMTaskReportManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMTaskReportManage> list = taskReportManageService.getTaskReportManages(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMTaskReportManage> getTaskReportManagePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"taskReportManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMTaskReportManage> page = new Page<WOMTaskReportManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMTaskReportManage> list = taskReportManageService.getTaskReportManages(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_generalManage_TaskReportManage,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}