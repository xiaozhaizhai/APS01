package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMPrepareMaterialPartCxfService;
import com.supcon.orchid.WOM.services.WOMPrepareMaterialPartService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMPrepareMaterialPartCxfService")
@Transactional
public class WOMPrepareMaterialPartCxfServiceImpl implements WOMPrepareMaterialPartCxfService {
	
	@Resource
	private WOMPrepareMaterialPartService prepareMaterialPartService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_prepareMaterial_prepareDetailsList")
	public WOMPrepareMaterialPart getPrepareMaterialPart(long id){
		WOMPrepareMaterialPart prepareMaterialPart = prepareMaterialPartService.getPrepareMaterialPart(id);
		return prepareMaterialPart;
	}
	
	@Override
	
	public void updatePrepareMaterialPart(long id, WOMPrepareMaterialPart prepareMaterialPart) {
		// TODO Auto-generated method stub
		prepareMaterialPart.setId(id);
		prepareMaterialPartService.savePrepareMaterialPart(prepareMaterialPart,null,null,null);
	}

	@Override
	
	public void createPrepareMaterialPart(WOMPrepareMaterialPart prepareMaterialPart) {
		// TODO Auto-generated method stub
		prepareMaterialPartService.savePrepareMaterialPart(prepareMaterialPart,null,null,null);
	}

	@Override
	
	public void deletePrepareMaterialPart(long id) {
		// TODO Auto-generated method stub
		WOMPrepareMaterialPart prepareMaterialPart = prepareMaterialPartService.getPrepareMaterialPart(id);
		prepareMaterialPartService.deletePrepareMaterialPart(prepareMaterialPart);
	}
	
	@Override
	public ArrayList<WOMPrepareMaterialPart> getPrepareMaterialPartList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prepareMaterialPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMPrepareMaterialPart> list = prepareMaterialPartService.getPrepareMaterialParts(customer, customerValue);
		 
		return (ArrayList<WOMPrepareMaterialPart>) list;
	}

	@Override
	
	public void PrepareMaterialPartList(ArrayList<WOMPrepareMaterialPart> prepareMaterialParts) {
		// TODO Auto-generated method stub
		for(WOMPrepareMaterialPart prepareMaterialPart : prepareMaterialParts){
			WOMPrepareMaterialPart old = prepareMaterialPartService.loadPrepareMaterialPartByBussinessKey(prepareMaterialPart);
			if(old!=null){
				prepareMaterialPart.setId(old.getId());
				prepareMaterialPart.setVersion(old.getVersion());
			}
			prepareMaterialPartService.mergePrepareMaterialPart(prepareMaterialPart, null,null,null);
		}
	}
	
	@Override
	public Page<WOMPrepareMaterialPart> getPrepareMaterialPartPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prepareMaterialPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMPrepareMaterialPart> page = new Page<WOMPrepareMaterialPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMPrepareMaterialPart> list = prepareMaterialPartService.getPrepareMaterialParts(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMPrepareMaterialPart> getPrepareMaterialPartPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prepareMaterialPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMPrepareMaterialPart> page = new Page<WOMPrepareMaterialPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMPrepareMaterialPart> list = prepareMaterialPartService.getPrepareMaterialParts(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}