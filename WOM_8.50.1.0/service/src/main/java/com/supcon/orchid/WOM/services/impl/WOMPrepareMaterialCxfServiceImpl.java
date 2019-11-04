package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMPrepareMaterialCxfService;
import com.supcon.orchid.WOM.services.WOMPrepareMaterialService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMPrepareMaterialCxfService")
@Transactional
public class WOMPrepareMaterialCxfServiceImpl implements WOMPrepareMaterialCxfService {
	
	@Resource
	private WOMPrepareMaterialService prepareMaterialService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_prepareMaterial_prepareMaterialList")
	public WOMPrepareMaterial getPrepareMaterial(long id){
		WOMPrepareMaterial prepareMaterial = prepareMaterialService.getPrepareMaterial(id);
		return prepareMaterial;
	}
	
	@Override
	
	public void updatePrepareMaterial(long id, WOMPrepareMaterial prepareMaterial) {
		// TODO Auto-generated method stub
		prepareMaterial.setId(id);
		prepareMaterialService.savePrepareMaterial(prepareMaterial,null,null,null);
	}

	@Override
	
	public void createPrepareMaterial(WOMPrepareMaterial prepareMaterial) {
		// TODO Auto-generated method stub
		prepareMaterialService.savePrepareMaterial(prepareMaterial,null,null,null);
	}

	@Override
	
	public void deletePrepareMaterial(long id) {
		// TODO Auto-generated method stub
		WOMPrepareMaterial prepareMaterial = prepareMaterialService.getPrepareMaterial(id);
		prepareMaterialService.deletePrepareMaterial(prepareMaterial);
	}
	
	@Override
	public ArrayList<WOMPrepareMaterial> getPrepareMaterialList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prepareMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMPrepareMaterial> list = prepareMaterialService.getPrepareMaterials(customer, customerValue);
		 
		return (ArrayList<WOMPrepareMaterial>) list;
	}

	@Override
	
	public void PrepareMaterialList(ArrayList<WOMPrepareMaterial> prepareMaterials) {
		// TODO Auto-generated method stub
		for(WOMPrepareMaterial prepareMaterial : prepareMaterials){
			WOMPrepareMaterial old = prepareMaterialService.loadPrepareMaterialByBussinessKey(prepareMaterial);
			if(old!=null){
				prepareMaterial.setId(old.getId());
				prepareMaterial.setVersion(old.getVersion());
			}
			prepareMaterialService.mergePrepareMaterial(prepareMaterial, null,null,null);
		}
	}
	
	@Override
	public Page<WOMPrepareMaterial> getPrepareMaterialPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prepareMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMPrepareMaterial> page = new Page<WOMPrepareMaterial>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMPrepareMaterial> list = prepareMaterialService.getPrepareMaterials(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMPrepareMaterial> getPrepareMaterialPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prepareMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMPrepareMaterial> page = new Page<WOMPrepareMaterial>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMPrepareMaterial> list = prepareMaterialService.getPrepareMaterials(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_prepareMaterial_PrepareMaterial,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}