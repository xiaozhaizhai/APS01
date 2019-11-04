package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMMakeBatOrderHeadCxfService;
import com.supcon.orchid.WOM.services.WOMMakeBatOrderHeadService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMMakeBatOrderHeadCxfService")
@Transactional
public class WOMMakeBatOrderHeadCxfServiceImpl implements WOMMakeBatOrderHeadCxfService {
	
	@Resource
	private WOMMakeBatOrderHeadService makeBatOrderHeadService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMMakeBatOrderHead getMakeBatOrderHead(long id){
		WOMMakeBatOrderHead makeBatOrderHead = makeBatOrderHeadService.getMakeBatOrderHead(id);
		return makeBatOrderHead;
	}
	
	@Override
	
	public void updateMakeBatOrderHead(long id, WOMMakeBatOrderHead makeBatOrderHead) {
		// TODO Auto-generated method stub
		makeBatOrderHead.setId(id);
		makeBatOrderHeadService.saveMakeBatOrderHead(makeBatOrderHead,null,null,null);
	}

	@Override
	
	public void createMakeBatOrderHead(WOMMakeBatOrderHead makeBatOrderHead) {
		// TODO Auto-generated method stub
		makeBatOrderHeadService.saveMakeBatOrderHead(makeBatOrderHead,null,null,null);
	}

	@Override
	
	public void deleteMakeBatOrderHead(long id) {
		// TODO Auto-generated method stub
		WOMMakeBatOrderHead makeBatOrderHead = makeBatOrderHeadService.getMakeBatOrderHead(id);
		makeBatOrderHeadService.deleteMakeBatOrderHead(makeBatOrderHead);
	}
	
	@Override
	public ArrayList<WOMMakeBatOrderHead> getMakeBatOrderHeadList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"makeBatOrderHead\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMMakeBatOrderHead> list = makeBatOrderHeadService.getMakeBatOrderHeads(customer, customerValue);
		 
		return (ArrayList<WOMMakeBatOrderHead>) list;
	}

	@Override
	
	public void MakeBatOrderHeadList(ArrayList<WOMMakeBatOrderHead> makeBatOrderHeads) {
		// TODO Auto-generated method stub
		for(WOMMakeBatOrderHead makeBatOrderHead : makeBatOrderHeads){
			WOMMakeBatOrderHead old = makeBatOrderHeadService.loadMakeBatOrderHeadByBussinessKey(makeBatOrderHead);
			if(old!=null){
				makeBatOrderHead.setId(old.getId());
				makeBatOrderHead.setVersion(old.getVersion());
			}
			makeBatOrderHeadService.mergeMakeBatOrderHead(makeBatOrderHead, null,null,null);
		}
	}
	
	@Override
	public Page<WOMMakeBatOrderHead> getMakeBatOrderHeadPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"makeBatOrderHead\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMMakeBatOrderHead> page = new Page<WOMMakeBatOrderHead>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMMakeBatOrderHead> list = makeBatOrderHeadService.getMakeBatOrderHeads(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMMakeBatOrderHead> getMakeBatOrderHeadPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"makeBatOrderHead\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMMakeBatOrderHead> page = new Page<WOMMakeBatOrderHead>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMMakeBatOrderHead> list = makeBatOrderHeadService.getMakeBatOrderHeads(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}