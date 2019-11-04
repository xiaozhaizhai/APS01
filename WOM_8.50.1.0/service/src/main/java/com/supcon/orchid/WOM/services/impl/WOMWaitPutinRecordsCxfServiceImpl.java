package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMWaitPutinRecordsCxfService;
import com.supcon.orchid.WOM.services.WOMWaitPutinRecordsService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_produceTask_WaitPutinRecords,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMWaitPutinRecordsCxfService")
@Transactional
public class WOMWaitPutinRecordsCxfServiceImpl implements WOMWaitPutinRecordsCxfService {
	
	@Resource
	private WOMWaitPutinRecordsService waitPutinRecordsService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMWaitPutinRecords getWaitPutinRecords(long id){
		WOMWaitPutinRecords waitPutinRecords = waitPutinRecordsService.getWaitPutinRecords(id);
		return waitPutinRecords;
	}
	
	@Override
	
	public void updateWaitPutinRecords(long id, WOMWaitPutinRecords waitPutinRecords) {
		// TODO Auto-generated method stub
		waitPutinRecords.setId(id);
		waitPutinRecordsService.saveWaitPutinRecords(waitPutinRecords,null,null,null);
	}

	@Override
	
	public void createWaitPutinRecords(WOMWaitPutinRecords waitPutinRecords) {
		// TODO Auto-generated method stub
		waitPutinRecordsService.saveWaitPutinRecords(waitPutinRecords,null,null,null);
	}

	@Override
	
	public void deleteWaitPutinRecords(long id) {
		// TODO Auto-generated method stub
		WOMWaitPutinRecords waitPutinRecords = waitPutinRecordsService.getWaitPutinRecords(id);
		waitPutinRecordsService.deleteWaitPutinRecords(waitPutinRecords);
	}
	
	@Override
	public ArrayList<WOMWaitPutinRecords> getWaitPutinRecordsList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"waitPutinRecords\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMWaitPutinRecords> list = waitPutinRecordsService.getWaitPutinRecordss(customer, customerValue);
		 
		return (ArrayList<WOMWaitPutinRecords>) list;
	}

	@Override
	
	public void WaitPutinRecordsList(ArrayList<WOMWaitPutinRecords> waitPutinRecordss) {
		// TODO Auto-generated method stub
		for(WOMWaitPutinRecords waitPutinRecords : waitPutinRecordss){
			WOMWaitPutinRecords old = waitPutinRecordsService.loadWaitPutinRecordsByBussinessKey(waitPutinRecords);
			if(old!=null){
				waitPutinRecords.setId(old.getId());
				waitPutinRecords.setVersion(old.getVersion());
			}
			waitPutinRecordsService.mergeWaitPutinRecords(waitPutinRecords, null,null,null);
		}
	}
	
	@Override
	public Page<WOMWaitPutinRecords> getWaitPutinRecordsPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"waitPutinRecords\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMWaitPutinRecords> page = new Page<WOMWaitPutinRecords>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMWaitPutinRecords> list = waitPutinRecordsService.getWaitPutinRecordss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMWaitPutinRecords> getWaitPutinRecordsPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"waitPutinRecords\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMWaitPutinRecords> page = new Page<WOMWaitPutinRecords>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMWaitPutinRecords> list = waitPutinRecordsService.getWaitPutinRecordss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_produceTask_WaitPutinRecords,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}