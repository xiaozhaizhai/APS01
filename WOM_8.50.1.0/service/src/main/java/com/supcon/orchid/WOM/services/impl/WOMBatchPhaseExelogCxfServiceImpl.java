package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMBatchPhaseExelogCxfService;
import com.supcon.orchid.WOM.services.WOMBatchPhaseExelogService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_produceTask_BatchPhaseExelog,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMBatchPhaseExelogCxfService")
@Transactional
public class WOMBatchPhaseExelogCxfServiceImpl implements WOMBatchPhaseExelogCxfService {
	
	@Resource
	private WOMBatchPhaseExelogService batchPhaseExelogService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMBatchPhaseExelog getBatchPhaseExelog(long id){
		WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogService.getBatchPhaseExelog(id);
		return batchPhaseExelog;
	}
	
	@Override
	
	public void updateBatchPhaseExelog(long id, WOMBatchPhaseExelog batchPhaseExelog) {
		// TODO Auto-generated method stub
		batchPhaseExelog.setId(id);
		batchPhaseExelogService.saveBatchPhaseExelog(batchPhaseExelog,null,null,null);
	}

	@Override
	
	public void createBatchPhaseExelog(WOMBatchPhaseExelog batchPhaseExelog) {
		// TODO Auto-generated method stub
		batchPhaseExelogService.saveBatchPhaseExelog(batchPhaseExelog,null,null,null);
	}

	@Override
	
	public void deleteBatchPhaseExelog(long id) {
		// TODO Auto-generated method stub
		WOMBatchPhaseExelog batchPhaseExelog = batchPhaseExelogService.getBatchPhaseExelog(id);
		batchPhaseExelogService.deleteBatchPhaseExelog(batchPhaseExelog);
	}
	
	@Override
	public ArrayList<WOMBatchPhaseExelog> getBatchPhaseExelogList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchPhaseExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMBatchPhaseExelog> list = batchPhaseExelogService.getBatchPhaseExelogs(customer, customerValue);
		 
		return (ArrayList<WOMBatchPhaseExelog>) list;
	}

	@Override
	
	public void BatchPhaseExelogList(ArrayList<WOMBatchPhaseExelog> batchPhaseExelogs) {
		// TODO Auto-generated method stub
		for(WOMBatchPhaseExelog batchPhaseExelog : batchPhaseExelogs){
			WOMBatchPhaseExelog old = batchPhaseExelogService.loadBatchPhaseExelogByBussinessKey(batchPhaseExelog);
			if(old!=null){
				batchPhaseExelog.setId(old.getId());
				batchPhaseExelog.setVersion(old.getVersion());
			}
			batchPhaseExelogService.mergeBatchPhaseExelog(batchPhaseExelog, null,null,null);
		}
	}
	
	@Override
	public Page<WOMBatchPhaseExelog> getBatchPhaseExelogPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchPhaseExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchPhaseExelog> page = new Page<WOMBatchPhaseExelog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchPhaseExelog> list = batchPhaseExelogService.getBatchPhaseExelogs(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMBatchPhaseExelog> getBatchPhaseExelogPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"batchPhaseExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMBatchPhaseExelog> page = new Page<WOMBatchPhaseExelog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMBatchPhaseExelog> list = batchPhaseExelogService.getBatchPhaseExelogs(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_produceTask_BatchPhaseExelog,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}