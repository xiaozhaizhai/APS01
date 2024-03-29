package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMActiveExelogCxfService;
import com.supcon.orchid.WOM.services.WOMActiveExelogService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_activeExelog_ActiveExelog,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMActiveExelogCxfService")
@Transactional
public class WOMActiveExelogCxfServiceImpl implements WOMActiveExelogCxfService {
	
	@Resource
	private WOMActiveExelogService activeExelogService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("WOM_7.5.0.0_activeExelog_activeExelogList")
	public WOMActiveExelog getActiveExelog(long id){
		WOMActiveExelog activeExelog = activeExelogService.getActiveExelog(id);
		return activeExelog;
	}
	
	@Override
	
	public void updateActiveExelog(long id, WOMActiveExelog activeExelog) {
		// TODO Auto-generated method stub
		activeExelog.setId(id);
		activeExelogService.saveActiveExelog(activeExelog,null,null,null);
	}

	@Override
	
	public void createActiveExelog(WOMActiveExelog activeExelog) {
		// TODO Auto-generated method stub
		activeExelogService.saveActiveExelog(activeExelog,null,null,null);
	}

	@Override
	
	public void deleteActiveExelog(long id) {
		// TODO Auto-generated method stub
		WOMActiveExelog activeExelog = activeExelogService.getActiveExelog(id);
		activeExelogService.deleteActiveExelog(activeExelog);
	}
	
	@Override
	public ArrayList<WOMActiveExelog> getActiveExelogList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"activeExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMActiveExelog> list = activeExelogService.getActiveExelogs(customer, customerValue);
		 
		return (ArrayList<WOMActiveExelog>) list;
	}

	@Override
	
	public void ActiveExelogList(ArrayList<WOMActiveExelog> activeExelogs) {
		// TODO Auto-generated method stub
		for(WOMActiveExelog activeExelog : activeExelogs){
			WOMActiveExelog old = activeExelogService.loadActiveExelogByBussinessKey(activeExelog);
			if(old!=null){
				activeExelog.setId(old.getId());
				activeExelog.setVersion(old.getVersion());
			}
			activeExelogService.mergeActiveExelog(activeExelog, null,null,null);
		}
	}
	
	@Override
	public Page<WOMActiveExelog> getActiveExelogPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"activeExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMActiveExelog> page = new Page<WOMActiveExelog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMActiveExelog> list = activeExelogService.getActiveExelogs(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMActiveExelog> getActiveExelogPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"activeExelog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMActiveExelog> page = new Page<WOMActiveExelog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMActiveExelog> list = activeExelogService.getActiveExelogs(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_activeExelog_ActiveExelog,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}