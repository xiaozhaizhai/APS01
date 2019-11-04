package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMProdTaskProcExelogCxfService;
import com.supcon.orchid.WOM.services.WOMProdTaskProcExelogService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_produceTask_ProdTaskProcExelog,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMProdTaskProcExelogCxfService")
@Transactional
public class WOMProdTaskProcExelogCxfServiceImpl implements WOMProdTaskProcExelogCxfService {
	
	@Resource
	private WOMProdTaskProcExelogService prodTaskProcExelogService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMProdTaskProcExelog getProdTaskProcExelog(long id){
		WOMProdTaskProcExelog prodTaskProcExelog = prodTaskProcExelogService.getProdTaskProcExelog(id);
		return prodTaskProcExelog;
	}
	
	@Override
	
	public void updateProdTaskProcExelog(long id, WOMProdTaskProcExelog prodTaskProcExelog) {
		// TODO Auto-generated method stub
		prodTaskProcExelog.setId(id);
		prodTaskProcExelogService.saveProdTaskProcExelog(prodTaskProcExelog,null,null,null);
	}

	@Override
	
	public void createProdTaskProcExelog(WOMProdTaskProcExelog prodTaskProcExelog) {
		// TODO Auto-generated method stub
		prodTaskProcExelogService.saveProdTaskProcExelog(prodTaskProcExelog,null,null,null);
	}

	@Override
	
	public void deleteProdTaskProcExelog(long id) {
		// TODO Auto-generated method stub
		WOMProdTaskProcExelog prodTaskProcExelog = prodTaskProcExelogService.getProdTaskProcExelog(id);
		prodTaskProcExelogService.deleteProdTaskProcExelog(prodTaskProcExelog);
	}
	
	@Override
	public ArrayList<WOMProdTaskProcExelog> getProdTaskProcExelogList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodTaskProcExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMProdTaskProcExelog> list = prodTaskProcExelogService.getProdTaskProcExelogs(customer, customerValue);
		 
		return (ArrayList<WOMProdTaskProcExelog>) list;
	}

	@Override
	
	public void ProdTaskProcExelogList(ArrayList<WOMProdTaskProcExelog> prodTaskProcExelogs) {
		// TODO Auto-generated method stub
		for(WOMProdTaskProcExelog prodTaskProcExelog : prodTaskProcExelogs){
			WOMProdTaskProcExelog old = prodTaskProcExelogService.loadProdTaskProcExelogByBussinessKey(prodTaskProcExelog);
			if(old!=null){
				prodTaskProcExelog.setId(old.getId());
				prodTaskProcExelog.setVersion(old.getVersion());
			}
			prodTaskProcExelogService.mergeProdTaskProcExelog(prodTaskProcExelog, null,null,null);
		}
	}
	
	@Override
	public Page<WOMProdTaskProcExelog> getProdTaskProcExelogPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodTaskProcExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProdTaskProcExelog> page = new Page<WOMProdTaskProcExelog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProdTaskProcExelog> list = prodTaskProcExelogService.getProdTaskProcExelogs(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMProdTaskProcExelog> getProdTaskProcExelogPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodTaskProcExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMProdTaskProcExelog> page = new Page<WOMProdTaskProcExelog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMProdTaskProcExelog> list = prodTaskProcExelogService.getProdTaskProcExelogs(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_produceTask_ProdTaskProcExelog,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}