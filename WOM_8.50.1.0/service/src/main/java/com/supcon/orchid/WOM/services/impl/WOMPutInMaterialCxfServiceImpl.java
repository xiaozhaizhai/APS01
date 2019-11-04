package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialCxfService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMPutInMaterialCxfService")
@Transactional
public class WOMPutInMaterialCxfServiceImpl implements WOMPutInMaterialCxfService {
	
	@Resource
	private WOMPutInMaterialService putInMaterialService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_putInMaterial_putinList")
	public WOMPutInMaterial getPutInMaterial(long id){
		WOMPutInMaterial putInMaterial = putInMaterialService.getPutInMaterial(id);
		return putInMaterial;
	}
	
	@Override
	@BAPPermission("WOM_7.5.0.0_putInMaterial_putinList_BUTTON_edit")
	public void updatePutInMaterial(long id, WOMPutInMaterial putInMaterial) {
		// TODO Auto-generated method stub
		putInMaterial.setId(id);
		putInMaterialService.savePutInMaterial(putInMaterial,null,null,null);
	}

	@Override
	
	public void createPutInMaterial(WOMPutInMaterial putInMaterial) {
		// TODO Auto-generated method stub
		putInMaterialService.savePutInMaterial(putInMaterial,null,null,null);
	}

	@Override
	
	public void deletePutInMaterial(long id) {
		// TODO Auto-generated method stub
		WOMPutInMaterial putInMaterial = putInMaterialService.getPutInMaterial(id);
		putInMaterialService.deletePutInMaterial(putInMaterial);
	}
	
	@Override
	public ArrayList<WOMPutInMaterial> getPutInMaterialList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"putInMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMPutInMaterial> list = putInMaterialService.getPutInMaterials(customer, customerValue);
		 
		return (ArrayList<WOMPutInMaterial>) list;
	}

	@Override
	
	public void PutInMaterialList(ArrayList<WOMPutInMaterial> putInMaterials) {
		// TODO Auto-generated method stub
		for(WOMPutInMaterial putInMaterial : putInMaterials){
			WOMPutInMaterial old = putInMaterialService.loadPutInMaterialByBussinessKey(putInMaterial);
			if(old!=null){
				putInMaterial.setId(old.getId());
				putInMaterial.setVersion(old.getVersion());
			}
			putInMaterialService.mergePutInMaterial(putInMaterial, null,null,null);
		}
	}
	
	@Override
	public Page<WOMPutInMaterial> getPutInMaterialPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"putInMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMPutInMaterial> page = new Page<WOMPutInMaterial>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMPutInMaterial> list = putInMaterialService.getPutInMaterials(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMPutInMaterial> getPutInMaterialPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"putInMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMPutInMaterial> page = new Page<WOMPutInMaterial>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMPutInMaterial> list = putInMaterialService.getPutInMaterials(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}