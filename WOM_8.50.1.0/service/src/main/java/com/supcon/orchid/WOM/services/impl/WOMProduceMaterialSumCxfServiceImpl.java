package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMProduceMaterialSumCxfService;
import com.supcon.orchid.WOM.services.WOMProduceMaterialSumService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_produceTask_ProduceMaterialSum,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMProduceMaterialSumCxfService")
@Transactional
public class WOMProduceMaterialSumCxfServiceImpl implements WOMProduceMaterialSumCxfService {
	
	@Resource
	private WOMProduceMaterialSumService produceMaterialSumService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMProduceMaterialSum getProduceMaterialSum(long id){
		WOMProduceMaterialSum produceMaterialSum = produceMaterialSumService.getProduceMaterialSum(id);
		return produceMaterialSum;
	}
	
	@Override
	
	public void updateProduceMaterialSum(long id, WOMProduceMaterialSum produceMaterialSum) {
		// TODO Auto-generated method stub
		produceMaterialSum.setId(id);
		produceMaterialSumService.saveProduceMaterialSum(produceMaterialSum,null,null,null);
	}

	@Override
	
	public void createProduceMaterialSum(WOMProduceMaterialSum produceMaterialSum) {
		// TODO Auto-generated method stub
		produceMaterialSumService.saveProduceMaterialSum(produceMaterialSum,null,null,null);
	}

	@Override
	
	public void deleteProduceMaterialSum(long id) {
		// TODO Auto-generated method stub
		WOMProduceMaterialSum produceMaterialSum = produceMaterialSumService.getProduceMaterialSum(id);
		produceMaterialSumService.deleteProduceMaterialSum(produceMaterialSum);
	}
	
	@Override
	public ArrayList<WOMProduceMaterialSum> getProduceMaterialSumList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceMaterialSum\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMProduceMaterialSum> list = produceMaterialSumService.getProduceMaterialSums(customer, customerValue);
		 
		return (ArrayList<WOMProduceMaterialSum>) list;
	}

	@Override
	
	public void ProduceMaterialSumList(ArrayList<WOMProduceMaterialSum> produceMaterialSums) {
		// TODO Auto-generated method stub
		for(WOMProduceMaterialSum produceMaterialSum : produceMaterialSums){
			WOMProduceMaterialSum old = produceMaterialSumService.loadProduceMaterialSumByBussinessKey(produceMaterialSum);
			if(old!=null){
				produceMaterialSum.setId(old.getId());
				produceMaterialSum.setVersion(old.getVersion());
			}
			produceMaterialSumService.mergeProduceMaterialSum(produceMaterialSum, null,null,null);
		}
	}
	
	@Override
	public Page<WOMProduceMaterialSum> getProduceMaterialSumPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceMaterialSum\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProduceMaterialSum> page = new Page<WOMProduceMaterialSum>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProduceMaterialSum> list = produceMaterialSumService.getProduceMaterialSums(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMProduceMaterialSum> getProduceMaterialSumPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"produceMaterialSum\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProduceMaterialSum> page = new Page<WOMProduceMaterialSum>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProduceMaterialSum> list = produceMaterialSumService.getProduceMaterialSums(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_produceTask_ProduceMaterialSum,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}