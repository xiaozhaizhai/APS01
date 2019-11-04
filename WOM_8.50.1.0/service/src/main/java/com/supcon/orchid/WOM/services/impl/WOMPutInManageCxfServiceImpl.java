package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMPutInManageCxfService;
import com.supcon.orchid.WOM.services.WOMPutInManageService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_generalManage_PutInManage,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMPutInManageCxfService")
@Transactional
public class WOMPutInManageCxfServiceImpl implements WOMPutInManageCxfService {
	
	@Resource
	private WOMPutInManageService putInManageService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMPutInManage getPutInManage(long id){
		WOMPutInManage putInManage = putInManageService.getPutInManage(id);
		return putInManage;
	}
	
	@Override
	
	public void updatePutInManage(long id, WOMPutInManage putInManage) {
		// TODO Auto-generated method stub
		putInManage.setId(id);
		putInManageService.savePutInManage(putInManage,null,null,null);
	}

	@Override
	
	public void createPutInManage(WOMPutInManage putInManage) {
		// TODO Auto-generated method stub
		putInManageService.savePutInManage(putInManage,null,null,null);
	}

	@Override
	
	public void deletePutInManage(long id) {
		// TODO Auto-generated method stub
		WOMPutInManage putInManage = putInManageService.getPutInManage(id);
		putInManageService.deletePutInManage(putInManage);
	}
	
	@Override
	public ArrayList<WOMPutInManage> getPutInManageList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"putInManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMPutInManage> list = putInManageService.getPutInManages(customer, customerValue);
		 
		return (ArrayList<WOMPutInManage>) list;
	}

	@Override
	
	public void PutInManageList(ArrayList<WOMPutInManage> putInManages) {
		// TODO Auto-generated method stub
		for(WOMPutInManage putInManage : putInManages){
			WOMPutInManage old = putInManageService.loadPutInManageByBussinessKey(putInManage);
			if(old!=null){
				putInManage.setId(old.getId());
				putInManage.setVersion(old.getVersion());
			}
			putInManageService.mergePutInManage(putInManage, null,null,null);
		}
	}
	
	@Override
	public Page<WOMPutInManage> getPutInManagePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"putInManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMPutInManage> page = new Page<WOMPutInManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMPutInManage> list = putInManageService.getPutInManages(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMPutInManage> getPutInManagePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"putInManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMPutInManage> page = new Page<WOMPutInManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMPutInManage> list = putInManageService.getPutInManages(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_generalManage_PutInManage,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}