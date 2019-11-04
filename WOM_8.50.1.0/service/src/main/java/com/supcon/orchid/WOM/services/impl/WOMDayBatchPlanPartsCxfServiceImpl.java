package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMDayBatchPlanPartsCxfService;
import com.supcon.orchid.WOM.services.WOMDayBatchPlanPartsService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_producePlanRef_DayBatchPlanParts,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMDayBatchPlanPartsCxfService")
@Transactional
public class WOMDayBatchPlanPartsCxfServiceImpl implements WOMDayBatchPlanPartsCxfService {
	
	@Resource
	private WOMDayBatchPlanPartsService dayBatchPlanPartsService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMDayBatchPlanParts getDayBatchPlanParts(long id){
		WOMDayBatchPlanParts dayBatchPlanParts = dayBatchPlanPartsService.getDayBatchPlanParts(id);
		return dayBatchPlanParts;
	}
	
	@Override
	
	public void updateDayBatchPlanParts(long id, WOMDayBatchPlanParts dayBatchPlanParts) {
		// TODO Auto-generated method stub
		dayBatchPlanParts.setId(id);
		dayBatchPlanPartsService.saveDayBatchPlanParts(dayBatchPlanParts,null,null,null);
	}

	@Override
	
	public void createDayBatchPlanParts(WOMDayBatchPlanParts dayBatchPlanParts) {
		// TODO Auto-generated method stub
		dayBatchPlanPartsService.saveDayBatchPlanParts(dayBatchPlanParts,null,null,null);
	}

	@Override
	
	public void deleteDayBatchPlanParts(long id) {
		// TODO Auto-generated method stub
		WOMDayBatchPlanParts dayBatchPlanParts = dayBatchPlanPartsService.getDayBatchPlanParts(id);
		dayBatchPlanPartsService.deleteDayBatchPlanParts(dayBatchPlanParts);
	}
	
	@Override
	public ArrayList<WOMDayBatchPlanParts> getDayBatchPlanPartsList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"dayBatchPlanParts\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMDayBatchPlanParts> list = dayBatchPlanPartsService.getDayBatchPlanPartss(customer, customerValue);
		 
		return (ArrayList<WOMDayBatchPlanParts>) list;
	}

	@Override
	
	public void DayBatchPlanPartsList(ArrayList<WOMDayBatchPlanParts> dayBatchPlanPartss) {
		// TODO Auto-generated method stub
		for(WOMDayBatchPlanParts dayBatchPlanParts : dayBatchPlanPartss){
			WOMDayBatchPlanParts old = dayBatchPlanPartsService.loadDayBatchPlanPartsByBussinessKey(dayBatchPlanParts);
			if(old!=null){
				dayBatchPlanParts.setId(old.getId());
				dayBatchPlanParts.setVersion(old.getVersion());
			}
			dayBatchPlanPartsService.mergeDayBatchPlanParts(dayBatchPlanParts, null,null,null);
		}
	}
	
	@Override
	public Page<WOMDayBatchPlanParts> getDayBatchPlanPartsPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"dayBatchPlanParts\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMDayBatchPlanParts> page = new Page<WOMDayBatchPlanParts>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMDayBatchPlanParts> list = dayBatchPlanPartsService.getDayBatchPlanPartss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMDayBatchPlanParts> getDayBatchPlanPartsPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"dayBatchPlanParts\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMDayBatchPlanParts> page = new Page<WOMDayBatchPlanParts>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMDayBatchPlanParts> list = dayBatchPlanPartsService.getDayBatchPlanPartss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_producePlanRef_DayBatchPlanParts,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}