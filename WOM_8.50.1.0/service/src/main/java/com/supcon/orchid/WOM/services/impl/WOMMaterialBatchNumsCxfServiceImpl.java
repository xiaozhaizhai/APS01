package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMMaterialBatchNumsCxfService;
import com.supcon.orchid.WOM.services.WOMMaterialBatchNumsService;
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
import com.supcon.orchid.WOM.entities.WOMMaterialBatchNums;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_produceTask_MaterialBatchNums,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMMaterialBatchNumsCxfService")
@Transactional
public class WOMMaterialBatchNumsCxfServiceImpl implements WOMMaterialBatchNumsCxfService {
	
	@Resource
	private WOMMaterialBatchNumsService materialBatchNumsService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMMaterialBatchNums getMaterialBatchNums(long id){
		WOMMaterialBatchNums materialBatchNums = materialBatchNumsService.getMaterialBatchNums(id);
		return materialBatchNums;
	}
	
	@Override
	
	public void updateMaterialBatchNums(long id, WOMMaterialBatchNums materialBatchNums) {
		// TODO Auto-generated method stub
		materialBatchNums.setId(id);
		materialBatchNumsService.saveMaterialBatchNums(materialBatchNums,null,null,null);
	}

	@Override
	
	public void createMaterialBatchNums(WOMMaterialBatchNums materialBatchNums) {
		// TODO Auto-generated method stub
		materialBatchNumsService.saveMaterialBatchNums(materialBatchNums,null,null,null);
	}

	@Override
	
	public void deleteMaterialBatchNums(long id) {
		// TODO Auto-generated method stub
		WOMMaterialBatchNums materialBatchNums = materialBatchNumsService.getMaterialBatchNums(id);
		materialBatchNumsService.deleteMaterialBatchNums(materialBatchNums);
	}
	
	@Override
	public ArrayList<WOMMaterialBatchNums> getMaterialBatchNumsList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"materialBatchNums\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMMaterialBatchNums> list = materialBatchNumsService.getMaterialBatchNumss(customer, customerValue);
		 
		return (ArrayList<WOMMaterialBatchNums>) list;
	}

	@Override
	
	public void MaterialBatchNumsList(ArrayList<WOMMaterialBatchNums> materialBatchNumss) {
		// TODO Auto-generated method stub
		for(WOMMaterialBatchNums materialBatchNums : materialBatchNumss){
			WOMMaterialBatchNums old = materialBatchNumsService.loadMaterialBatchNumsByBussinessKey(materialBatchNums);
			if(old!=null){
				materialBatchNums.setId(old.getId());
				materialBatchNums.setVersion(old.getVersion());
			}
			materialBatchNumsService.mergeMaterialBatchNums(materialBatchNums, null,null,null);
		}
	}
	
	@Override
	public Page<WOMMaterialBatchNums> getMaterialBatchNumsPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"materialBatchNums\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMMaterialBatchNums> page = new Page<WOMMaterialBatchNums>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMMaterialBatchNums> list = materialBatchNumsService.getMaterialBatchNumss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMMaterialBatchNums> getMaterialBatchNumsPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"materialBatchNums\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMMaterialBatchNums> page = new Page<WOMMaterialBatchNums>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMMaterialBatchNums> list = materialBatchNumsService.getMaterialBatchNumss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_produceTask_MaterialBatchNums,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}