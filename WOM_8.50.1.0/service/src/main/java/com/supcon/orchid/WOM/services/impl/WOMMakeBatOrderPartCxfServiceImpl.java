package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMMakeBatOrderPartCxfService;
import com.supcon.orchid.WOM.services.WOMMakeBatOrderPartService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMMakeBatOrderPartCxfService")
@Transactional
public class WOMMakeBatOrderPartCxfServiceImpl implements WOMMakeBatOrderPartCxfService {
	
	@Resource
	private WOMMakeBatOrderPartService makeBatOrderPartService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMMakeBatOrderPart getMakeBatOrderPart(long id){
		WOMMakeBatOrderPart makeBatOrderPart = makeBatOrderPartService.getMakeBatOrderPart(id);
		return makeBatOrderPart;
	}
	
	@Override
	
	public void updateMakeBatOrderPart(long id, WOMMakeBatOrderPart makeBatOrderPart) {
		// TODO Auto-generated method stub
		makeBatOrderPart.setId(id);
		makeBatOrderPartService.saveMakeBatOrderPart(makeBatOrderPart,null,null,null);
	}

	@Override
	
	public void createMakeBatOrderPart(WOMMakeBatOrderPart makeBatOrderPart) {
		// TODO Auto-generated method stub
		makeBatOrderPartService.saveMakeBatOrderPart(makeBatOrderPart,null,null,null);
	}

	@Override
	
	public void deleteMakeBatOrderPart(long id) {
		// TODO Auto-generated method stub
		WOMMakeBatOrderPart makeBatOrderPart = makeBatOrderPartService.getMakeBatOrderPart(id);
		makeBatOrderPartService.deleteMakeBatOrderPart(makeBatOrderPart);
	}
	
	@Override
	public ArrayList<WOMMakeBatOrderPart> getMakeBatOrderPartList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"makeBatOrderPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMMakeBatOrderPart> list = makeBatOrderPartService.getMakeBatOrderParts(customer, customerValue);
		 
		return (ArrayList<WOMMakeBatOrderPart>) list;
	}

	@Override
	
	public void MakeBatOrderPartList(ArrayList<WOMMakeBatOrderPart> makeBatOrderParts) {
		// TODO Auto-generated method stub
		for(WOMMakeBatOrderPart makeBatOrderPart : makeBatOrderParts){
			WOMMakeBatOrderPart old = makeBatOrderPartService.loadMakeBatOrderPartByBussinessKey(makeBatOrderPart);
			if(old!=null){
				makeBatOrderPart.setId(old.getId());
				makeBatOrderPart.setVersion(old.getVersion());
			}
			makeBatOrderPartService.mergeMakeBatOrderPart(makeBatOrderPart, null,null,null);
		}
	}
	
	@Override
	public Page<WOMMakeBatOrderPart> getMakeBatOrderPartPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"makeBatOrderPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMMakeBatOrderPart> page = new Page<WOMMakeBatOrderPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMMakeBatOrderPart> list = makeBatOrderPartService.getMakeBatOrderParts(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMMakeBatOrderPart> getMakeBatOrderPartPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"makeBatOrderPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMMakeBatOrderPart> page = new Page<WOMMakeBatOrderPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMMakeBatOrderPart> list = makeBatOrderPartService.getMakeBatOrderParts(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}