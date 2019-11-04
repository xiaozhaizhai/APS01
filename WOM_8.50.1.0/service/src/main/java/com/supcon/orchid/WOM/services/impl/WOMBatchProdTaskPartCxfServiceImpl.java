package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMBatchProdTaskPartCxfService;
import com.supcon.orchid.WOM.services.WOMBatchProdTaskPartService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMBatchProdTaskPartCxfService")
@Transactional
public class WOMBatchProdTaskPartCxfServiceImpl implements WOMBatchProdTaskPartCxfService {
	
	@Resource
	private WOMBatchProdTaskPartService batchProdTaskPartService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMBatchProdTaskPart getBatchProdTaskPart(long id){
		WOMBatchProdTaskPart batchProdTaskPart = batchProdTaskPartService.getBatchProdTaskPart(id);
		return batchProdTaskPart;
	}
	
	@Override
	
	public void updateBatchProdTaskPart(long id, WOMBatchProdTaskPart batchProdTaskPart) {
		// TODO Auto-generated method stub
		batchProdTaskPart.setId(id);
		batchProdTaskPartService.saveBatchProdTaskPart(batchProdTaskPart,null,null,null);
	}

	@Override
	
	public void createBatchProdTaskPart(WOMBatchProdTaskPart batchProdTaskPart) {
		// TODO Auto-generated method stub
		batchProdTaskPartService.saveBatchProdTaskPart(batchProdTaskPart,null,null,null);
	}

	@Override
	
	public void deleteBatchProdTaskPart(long id) {
		// TODO Auto-generated method stub
		WOMBatchProdTaskPart batchProdTaskPart = batchProdTaskPartService.getBatchProdTaskPart(id);
		batchProdTaskPartService.deleteBatchProdTaskPart(batchProdTaskPart);
	}
	
	@Override
	public ArrayList<WOMBatchProdTaskPart> getBatchProdTaskPartList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchProdTaskPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMBatchProdTaskPart> list = batchProdTaskPartService.getBatchProdTaskParts(customer, customerValue);
		 
		return (ArrayList<WOMBatchProdTaskPart>) list;
	}

	@Override
	
	public void BatchProdTaskPartList(ArrayList<WOMBatchProdTaskPart> batchProdTaskParts) {
		// TODO Auto-generated method stub
		for(WOMBatchProdTaskPart batchProdTaskPart : batchProdTaskParts){
			WOMBatchProdTaskPart old = batchProdTaskPartService.loadBatchProdTaskPartByBussinessKey(batchProdTaskPart);
			if(old!=null){
				batchProdTaskPart.setId(old.getId());
				batchProdTaskPart.setVersion(old.getVersion());
			}
			batchProdTaskPartService.mergeBatchProdTaskPart(batchProdTaskPart, null,null,null);
		}
	}
	
	@Override
	public Page<WOMBatchProdTaskPart> getBatchProdTaskPartPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchProdTaskPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchProdTaskPart> page = new Page<WOMBatchProdTaskPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchProdTaskPart> list = batchProdTaskPartService.getBatchProdTaskParts(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMBatchProdTaskPart> getBatchProdTaskPartPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchProdTaskPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchProdTaskPart> page = new Page<WOMBatchProdTaskPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchProdTaskPart> list = batchProdTaskPartService.getBatchProdTaskParts(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_batchProduceTask_BatchProdTaskPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}