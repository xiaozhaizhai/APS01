package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMCheckManageCxfService;
import com.supcon.orchid.WOM.services.WOMCheckManageService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_generalManage_CheckManage,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMCheckManageCxfService")
@Transactional
public class WOMCheckManageCxfServiceImpl implements WOMCheckManageCxfService {
	
	@Resource
	private WOMCheckManageService checkManageService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMCheckManage getCheckManage(long id){
		WOMCheckManage checkManage = checkManageService.getCheckManage(id);
		return checkManage;
	}
	
	@Override
	
	public void updateCheckManage(long id, WOMCheckManage checkManage) {
		// TODO Auto-generated method stub
		checkManage.setId(id);
		checkManageService.saveCheckManage(checkManage,null,null,null);
	}

	@Override
	
	public void createCheckManage(WOMCheckManage checkManage) {
		// TODO Auto-generated method stub
		checkManageService.saveCheckManage(checkManage,null,null,null);
	}

	@Override
	
	public void deleteCheckManage(long id) {
		// TODO Auto-generated method stub
		WOMCheckManage checkManage = checkManageService.getCheckManage(id);
		checkManageService.deleteCheckManage(checkManage);
	}
	
	@Override
	public ArrayList<WOMCheckManage> getCheckManageList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"checkManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMCheckManage> list = checkManageService.getCheckManages(customer, customerValue);
		 
		return (ArrayList<WOMCheckManage>) list;
	}

	@Override
	
	public void CheckManageList(ArrayList<WOMCheckManage> checkManages) {
		// TODO Auto-generated method stub
		for(WOMCheckManage checkManage : checkManages){
			WOMCheckManage old = checkManageService.loadCheckManageByBussinessKey(checkManage);
			if(old!=null){
				checkManage.setId(old.getId());
				checkManage.setVersion(old.getVersion());
			}
			checkManageService.mergeCheckManage(checkManage, null,null,null);
		}
	}
	
	@Override
	public Page<WOMCheckManage> getCheckManagePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"checkManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMCheckManage> page = new Page<WOMCheckManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMCheckManage> list = checkManageService.getCheckManages(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMCheckManage> getCheckManagePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"checkManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMCheckManage> page = new Page<WOMCheckManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMCheckManage> list = checkManageService.getCheckManages(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_generalManage_CheckManage,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}