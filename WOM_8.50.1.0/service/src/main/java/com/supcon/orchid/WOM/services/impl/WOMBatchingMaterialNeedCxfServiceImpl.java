package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialNeedCxfService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialNeedService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMBatchingMaterialNeedCxfService")
@Transactional
public class WOMBatchingMaterialNeedCxfServiceImpl implements WOMBatchingMaterialNeedCxfService {
	
	@Resource
	private WOMBatchingMaterialNeedService batchingMaterialNeedService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_batchingMaterialNeed_batchNeedList")
	public WOMBatchingMaterialNeed getBatchingMaterialNeed(long id){
		WOMBatchingMaterialNeed batchingMaterialNeed = batchingMaterialNeedService.getBatchingMaterialNeed(id);
		return batchingMaterialNeed;
	}
	
	@Override
	
	public void updateBatchingMaterialNeed(long id, WOMBatchingMaterialNeed batchingMaterialNeed) {
		// TODO Auto-generated method stub
		batchingMaterialNeed.setId(id);
		batchingMaterialNeedService.saveBatchingMaterialNeed(batchingMaterialNeed,null,null,null);
	}

	@Override
	
	public void createBatchingMaterialNeed(WOMBatchingMaterialNeed batchingMaterialNeed) {
		// TODO Auto-generated method stub
		batchingMaterialNeedService.saveBatchingMaterialNeed(batchingMaterialNeed,null,null,null);
	}

	@Override
	
	public void deleteBatchingMaterialNeed(long id) {
		// TODO Auto-generated method stub
		WOMBatchingMaterialNeed batchingMaterialNeed = batchingMaterialNeedService.getBatchingMaterialNeed(id);
		batchingMaterialNeedService.deleteBatchingMaterialNeed(batchingMaterialNeed);
	}
	
	@Override
	public ArrayList<WOMBatchingMaterialNeed> getBatchingMaterialNeedList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchingMaterialNeed\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMBatchingMaterialNeed> list = batchingMaterialNeedService.getBatchingMaterialNeeds(customer, customerValue);
		 
		return (ArrayList<WOMBatchingMaterialNeed>) list;
	}

	@Override
	
	public void BatchingMaterialNeedList(ArrayList<WOMBatchingMaterialNeed> batchingMaterialNeeds) {
		// TODO Auto-generated method stub
		for(WOMBatchingMaterialNeed batchingMaterialNeed : batchingMaterialNeeds){
			WOMBatchingMaterialNeed old = batchingMaterialNeedService.loadBatchingMaterialNeedByBussinessKey(batchingMaterialNeed);
			if(old!=null){
				batchingMaterialNeed.setId(old.getId());
				batchingMaterialNeed.setVersion(old.getVersion());
			}
			batchingMaterialNeedService.mergeBatchingMaterialNeed(batchingMaterialNeed, null,null,null);
		}
	}
	
	@Override
	public Page<WOMBatchingMaterialNeed> getBatchingMaterialNeedPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchingMaterialNeed\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchingMaterialNeed> page = new Page<WOMBatchingMaterialNeed>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchingMaterialNeed> list = batchingMaterialNeedService.getBatchingMaterialNeeds(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMBatchingMaterialNeed> getBatchingMaterialNeedPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchingMaterialNeed\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchingMaterialNeed> page = new Page<WOMBatchingMaterialNeed>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchingMaterialNeed> list = batchingMaterialNeedService.getBatchingMaterialNeeds(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}