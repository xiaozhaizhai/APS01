package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialPartCxfService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialPartService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMBatchingMaterialPartCxfService")
@Transactional
public class WOMBatchingMaterialPartCxfServiceImpl implements WOMBatchingMaterialPartCxfService {
	
	@Resource
	private WOMBatchingMaterialPartService batchingMaterialPartService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_batchingMaterial_batMaterialPartList")
	public WOMBatchingMaterialPart getBatchingMaterialPart(long id){
		WOMBatchingMaterialPart batchingMaterialPart = batchingMaterialPartService.getBatchingMaterialPart(id);
		return batchingMaterialPart;
	}
	
	@Override
	
	public void updateBatchingMaterialPart(long id, WOMBatchingMaterialPart batchingMaterialPart) {
		// TODO Auto-generated method stub
		batchingMaterialPart.setId(id);
		batchingMaterialPartService.saveBatchingMaterialPart(batchingMaterialPart,null,null,null);
	}

	@Override
	
	public void createBatchingMaterialPart(WOMBatchingMaterialPart batchingMaterialPart) {
		// TODO Auto-generated method stub
		batchingMaterialPartService.saveBatchingMaterialPart(batchingMaterialPart,null,null,null);
	}

	@Override
	
	public void deleteBatchingMaterialPart(long id) {
		// TODO Auto-generated method stub
		WOMBatchingMaterialPart batchingMaterialPart = batchingMaterialPartService.getBatchingMaterialPart(id);
		batchingMaterialPartService.deleteBatchingMaterialPart(batchingMaterialPart);
	}
	
	@Override
	public ArrayList<WOMBatchingMaterialPart> getBatchingMaterialPartList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchingMaterialPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMBatchingMaterialPart> list = batchingMaterialPartService.getBatchingMaterialParts(customer, customerValue);
		 
		return (ArrayList<WOMBatchingMaterialPart>) list;
	}

	@Override
	
	public void BatchingMaterialPartList(ArrayList<WOMBatchingMaterialPart> batchingMaterialParts) {
		// TODO Auto-generated method stub
		for(WOMBatchingMaterialPart batchingMaterialPart : batchingMaterialParts){
			WOMBatchingMaterialPart old = batchingMaterialPartService.loadBatchingMaterialPartByBussinessKey(batchingMaterialPart);
			if(old!=null){
				batchingMaterialPart.setId(old.getId());
				batchingMaterialPart.setVersion(old.getVersion());
			}
			batchingMaterialPartService.mergeBatchingMaterialPart(batchingMaterialPart, null,null,null);
		}
	}
	
	@Override
	public Page<WOMBatchingMaterialPart> getBatchingMaterialPartPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchingMaterialPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchingMaterialPart> page = new Page<WOMBatchingMaterialPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchingMaterialPart> list = batchingMaterialPartService.getBatchingMaterialParts(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMBatchingMaterialPart> getBatchingMaterialPartPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchingMaterialPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchingMaterialPart> page = new Page<WOMBatchingMaterialPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchingMaterialPart> list = batchingMaterialPartService.getBatchingMaterialParts(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}