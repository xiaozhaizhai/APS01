package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMProdTaskActiExelogCxfService;
import com.supcon.orchid.WOM.services.WOMProdTaskActiExelogService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_produceTask_ProdTaskActiExelog,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMProdTaskActiExelogCxfService")
@Transactional
public class WOMProdTaskActiExelogCxfServiceImpl implements WOMProdTaskActiExelogCxfService {
	
	@Resource
	private WOMProdTaskActiExelogService prodTaskActiExelogService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_produceTask_activeExeLogList")
	public WOMProdTaskActiExelog getProdTaskActiExelog(long id){
		WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogService.getProdTaskActiExelog(id);
		return prodTaskActiExelog;
	}
	
	@Override
	
	public void updateProdTaskActiExelog(long id, WOMProdTaskActiExelog prodTaskActiExelog) {
		// TODO Auto-generated method stub
		prodTaskActiExelog.setId(id);
		prodTaskActiExelogService.saveProdTaskActiExelog(prodTaskActiExelog,null,null,null);
	}

	@Override
	
	public void createProdTaskActiExelog(WOMProdTaskActiExelog prodTaskActiExelog) {
		// TODO Auto-generated method stub
		prodTaskActiExelogService.saveProdTaskActiExelog(prodTaskActiExelog,null,null,null);
	}

	@Override
	
	public void deleteProdTaskActiExelog(long id) {
		// TODO Auto-generated method stub
		WOMProdTaskActiExelog prodTaskActiExelog = prodTaskActiExelogService.getProdTaskActiExelog(id);
		prodTaskActiExelogService.deleteProdTaskActiExelog(prodTaskActiExelog);
	}
	
	@Override
	public ArrayList<WOMProdTaskActiExelog> getProdTaskActiExelogList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodTaskActiExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMProdTaskActiExelog> list = prodTaskActiExelogService.getProdTaskActiExelogs(customer, customerValue);
		 
		return (ArrayList<WOMProdTaskActiExelog>) list;
	}

	@Override
	
	public void ProdTaskActiExelogList(ArrayList<WOMProdTaskActiExelog> prodTaskActiExelogs) {
		// TODO Auto-generated method stub
		for(WOMProdTaskActiExelog prodTaskActiExelog : prodTaskActiExelogs){
			WOMProdTaskActiExelog old = prodTaskActiExelogService.loadProdTaskActiExelogByBussinessKey(prodTaskActiExelog);
			if(old!=null){
				prodTaskActiExelog.setId(old.getId());
				prodTaskActiExelog.setVersion(old.getVersion());
			}
			prodTaskActiExelogService.mergeProdTaskActiExelog(prodTaskActiExelog, null,null,null);
		}
	}
	
	@Override
	public Page<WOMProdTaskActiExelog> getProdTaskActiExelogPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodTaskActiExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProdTaskActiExelog> page = new Page<WOMProdTaskActiExelog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProdTaskActiExelog> list = prodTaskActiExelogService.getProdTaskActiExelogs(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMProdTaskActiExelog> getProdTaskActiExelogPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodTaskActiExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProdTaskActiExelog> page = new Page<WOMProdTaskActiExelog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProdTaskActiExelog> list = prodTaskActiExelogService.getProdTaskActiExelogs(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_produceTask_ProdTaskActiExelog,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}