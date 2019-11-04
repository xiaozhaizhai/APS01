package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialPartCxfService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialPartService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_putInMaterial_PutInMaterialPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMPutInMaterialPartCxfService")
@Transactional
public class WOMPutInMaterialPartCxfServiceImpl implements WOMPutInMaterialPartCxfService {
	
	@Resource
	private WOMPutInMaterialPartService putInMaterialPartService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_putInMaterial_putInPartList")
	public WOMPutInMaterialPart getPutInMaterialPart(long id){
		WOMPutInMaterialPart putInMaterialPart = putInMaterialPartService.getPutInMaterialPart(id);
		return putInMaterialPart;
	}
	
	@Override
	
	public void updatePutInMaterialPart(long id, WOMPutInMaterialPart putInMaterialPart) {
		// TODO Auto-generated method stub
		putInMaterialPart.setId(id);
		putInMaterialPartService.savePutInMaterialPart(putInMaterialPart,null,null,null);
	}

	@Override
	
	public void createPutInMaterialPart(WOMPutInMaterialPart putInMaterialPart) {
		// TODO Auto-generated method stub
		putInMaterialPartService.savePutInMaterialPart(putInMaterialPart,null,null,null);
	}

	@Override
	
	public void deletePutInMaterialPart(long id) {
		// TODO Auto-generated method stub
		WOMPutInMaterialPart putInMaterialPart = putInMaterialPartService.getPutInMaterialPart(id);
		putInMaterialPartService.deletePutInMaterialPart(putInMaterialPart);
	}
	
	@Override
	public ArrayList<WOMPutInMaterialPart> getPutInMaterialPartList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"putInMaterialPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMPutInMaterialPart> list = putInMaterialPartService.getPutInMaterialParts(customer, customerValue);
		 
		return (ArrayList<WOMPutInMaterialPart>) list;
	}

	@Override
	
	public void PutInMaterialPartList(ArrayList<WOMPutInMaterialPart> putInMaterialParts) {
		// TODO Auto-generated method stub
		for(WOMPutInMaterialPart putInMaterialPart : putInMaterialParts){
			WOMPutInMaterialPart old = putInMaterialPartService.loadPutInMaterialPartByBussinessKey(putInMaterialPart);
			if(old!=null){
				putInMaterialPart.setId(old.getId());
				putInMaterialPart.setVersion(old.getVersion());
			}
			putInMaterialPartService.mergePutInMaterialPart(putInMaterialPart, null,null,null);
		}
	}
	
	@Override
	public Page<WOMPutInMaterialPart> getPutInMaterialPartPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"putInMaterialPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMPutInMaterialPart> page = new Page<WOMPutInMaterialPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMPutInMaterialPart> list = putInMaterialPartService.getPutInMaterialParts(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMPutInMaterialPart> getPutInMaterialPartPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"putInMaterialPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMPutInMaterialPart> page = new Page<WOMPutInMaterialPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMPutInMaterialPart> list = putInMaterialPartService.getPutInMaterialParts(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_putInMaterial_PutInMaterialPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}