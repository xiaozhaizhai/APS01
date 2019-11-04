package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialCxfService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMBatchingMaterialCxfService")
@Transactional
public class WOMBatchingMaterialCxfServiceImpl implements WOMBatchingMaterialCxfService {
	
	@Resource
	private WOMBatchingMaterialService batchingMaterialService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_batchingMaterial_batMaterialList")
	public WOMBatchingMaterial getBatchingMaterial(long id){
		WOMBatchingMaterial batchingMaterial = batchingMaterialService.getBatchingMaterial(id);
		return batchingMaterial;
	}
	
	@Override
	
	public void updateBatchingMaterial(long id, WOMBatchingMaterial batchingMaterial) {
		// TODO Auto-generated method stub
		batchingMaterial.setId(id);
		batchingMaterialService.saveBatchingMaterial(batchingMaterial,null,null,null);
	}

	@Override
	
	public void createBatchingMaterial(WOMBatchingMaterial batchingMaterial) {
		// TODO Auto-generated method stub
		batchingMaterialService.saveBatchingMaterial(batchingMaterial,null,null,null);
	}

	@Override
	
	public void deleteBatchingMaterial(long id) {
		// TODO Auto-generated method stub
		WOMBatchingMaterial batchingMaterial = batchingMaterialService.getBatchingMaterial(id);
		batchingMaterialService.deleteBatchingMaterial(batchingMaterial);
	}
	
	@Override
	public ArrayList<WOMBatchingMaterial> getBatchingMaterialList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchingMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMBatchingMaterial> list = batchingMaterialService.getBatchingMaterials(customer, customerValue);
		 
		return (ArrayList<WOMBatchingMaterial>) list;
	}

	@Override
	
	public void BatchingMaterialList(ArrayList<WOMBatchingMaterial> batchingMaterials) {
		// TODO Auto-generated method stub
		for(WOMBatchingMaterial batchingMaterial : batchingMaterials){
			WOMBatchingMaterial old = batchingMaterialService.loadBatchingMaterialByBussinessKey(batchingMaterial);
			if(old!=null){
				batchingMaterial.setId(old.getId());
				batchingMaterial.setVersion(old.getVersion());
			}
			batchingMaterialService.mergeBatchingMaterial(batchingMaterial, null,null,null);
		}
	}
	
	@Override
	public Page<WOMBatchingMaterial> getBatchingMaterialPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchingMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchingMaterial> page = new Page<WOMBatchingMaterial>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchingMaterial> list = batchingMaterialService.getBatchingMaterials(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMBatchingMaterial> getBatchingMaterialPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchingMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchingMaterial> page = new Page<WOMBatchingMaterial>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchingMaterial> list = batchingMaterialService.getBatchingMaterials(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}