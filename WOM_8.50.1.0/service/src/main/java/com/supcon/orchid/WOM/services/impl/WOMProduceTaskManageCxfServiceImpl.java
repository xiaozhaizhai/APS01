package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMProduceTaskManageCxfService;
import com.supcon.orchid.WOM.services.WOMProduceTaskManageService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMProduceTaskManageCxfService")
@Transactional
public class WOMProduceTaskManageCxfServiceImpl implements WOMProduceTaskManageCxfService {
	
	@Resource
	private WOMProduceTaskManageService produceTaskManageService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMProduceTaskManage getProduceTaskManage(long id){
		WOMProduceTaskManage produceTaskManage = produceTaskManageService.getProduceTaskManage(id);
		return produceTaskManage;
	}
	
	@Override
	
	public void updateProduceTaskManage(long id, WOMProduceTaskManage produceTaskManage) {
		// TODO Auto-generated method stub
		produceTaskManage.setId(id);
		produceTaskManageService.saveProduceTaskManage(produceTaskManage,null,null,null);
	}

	@Override
	
	public void createProduceTaskManage(WOMProduceTaskManage produceTaskManage) {
		// TODO Auto-generated method stub
		produceTaskManageService.saveProduceTaskManage(produceTaskManage,null,null,null);
	}

	@Override
	
	public void deleteProduceTaskManage(long id) {
		// TODO Auto-generated method stub
		WOMProduceTaskManage produceTaskManage = produceTaskManageService.getProduceTaskManage(id);
		produceTaskManageService.deleteProduceTaskManage(produceTaskManage);
	}
	
	@Override
	public ArrayList<WOMProduceTaskManage> getProduceTaskManageList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTaskManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMProduceTaskManage> list = produceTaskManageService.getProduceTaskManages(customer, customerValue);
		 
		return (ArrayList<WOMProduceTaskManage>) list;
	}

	@Override
	
	public void ProduceTaskManageList(ArrayList<WOMProduceTaskManage> produceTaskManages) {
		// TODO Auto-generated method stub
		for(WOMProduceTaskManage produceTaskManage : produceTaskManages){
			WOMProduceTaskManage old = produceTaskManageService.loadProduceTaskManageByBussinessKey(produceTaskManage);
			if(old!=null){
				produceTaskManage.setId(old.getId());
				produceTaskManage.setVersion(old.getVersion());
			}
			produceTaskManageService.mergeProduceTaskManage(produceTaskManage, null,null,null);
		}
	}
	
	@Override
	public Page<WOMProduceTaskManage> getProduceTaskManagePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTaskManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProduceTaskManage> page = new Page<WOMProduceTaskManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProduceTaskManage> list = produceTaskManageService.getProduceTaskManages(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMProduceTaskManage> getProduceTaskManagePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceTaskManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProduceTaskManage> page = new Page<WOMProduceTaskManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProduceTaskManage> list = produceTaskManageService.getProduceTaskManages(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}