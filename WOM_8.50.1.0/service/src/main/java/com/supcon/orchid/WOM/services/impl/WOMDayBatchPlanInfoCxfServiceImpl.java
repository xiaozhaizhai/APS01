package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMDayBatchPlanInfoCxfService;
import com.supcon.orchid.WOM.services.WOMDayBatchPlanInfoService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMDayBatchPlanInfoCxfService")
@Transactional
public class WOMDayBatchPlanInfoCxfServiceImpl implements WOMDayBatchPlanInfoCxfService {
	
	@Resource
	private WOMDayBatchPlanInfoService dayBatchPlanInfoService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMDayBatchPlanInfo getDayBatchPlanInfo(long id){
		WOMDayBatchPlanInfo dayBatchPlanInfo = dayBatchPlanInfoService.getDayBatchPlanInfo(id);
		return dayBatchPlanInfo;
	}
	
	@Override
	
	public void updateDayBatchPlanInfo(long id, WOMDayBatchPlanInfo dayBatchPlanInfo) {
		// TODO Auto-generated method stub
		dayBatchPlanInfo.setId(id);
		dayBatchPlanInfoService.saveDayBatchPlanInfo(dayBatchPlanInfo,null,null,null);
	}

	@Override
	
	public void createDayBatchPlanInfo(WOMDayBatchPlanInfo dayBatchPlanInfo) {
		// TODO Auto-generated method stub
		dayBatchPlanInfoService.saveDayBatchPlanInfo(dayBatchPlanInfo,null,null,null);
	}

	@Override
	
	public void deleteDayBatchPlanInfo(long id) {
		// TODO Auto-generated method stub
		WOMDayBatchPlanInfo dayBatchPlanInfo = dayBatchPlanInfoService.getDayBatchPlanInfo(id);
		dayBatchPlanInfoService.deleteDayBatchPlanInfo(dayBatchPlanInfo);
	}
	
	@Override
	public ArrayList<WOMDayBatchPlanInfo> getDayBatchPlanInfoList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"dayBatchPlanInfo\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMDayBatchPlanInfo> list = dayBatchPlanInfoService.getDayBatchPlanInfos(customer, customerValue);
		 
		return (ArrayList<WOMDayBatchPlanInfo>) list;
	}

	@Override
	
	public void DayBatchPlanInfoList(ArrayList<WOMDayBatchPlanInfo> dayBatchPlanInfos) {
		// TODO Auto-generated method stub
		for(WOMDayBatchPlanInfo dayBatchPlanInfo : dayBatchPlanInfos){
			WOMDayBatchPlanInfo old = dayBatchPlanInfoService.loadDayBatchPlanInfoByBussinessKey(dayBatchPlanInfo);
			if(old!=null){
				dayBatchPlanInfo.setId(old.getId());
				dayBatchPlanInfo.setVersion(old.getVersion());
			}
			dayBatchPlanInfoService.mergeDayBatchPlanInfo(dayBatchPlanInfo, null,null,null);
		}
	}
	
	@Override
	public Page<WOMDayBatchPlanInfo> getDayBatchPlanInfoPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"dayBatchPlanInfo\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMDayBatchPlanInfo> page = new Page<WOMDayBatchPlanInfo>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMDayBatchPlanInfo> list = dayBatchPlanInfoService.getDayBatchPlanInfos(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMDayBatchPlanInfo> getDayBatchPlanInfoPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"dayBatchPlanInfo\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMDayBatchPlanInfo> page = new Page<WOMDayBatchPlanInfo>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMDayBatchPlanInfo> list = dayBatchPlanInfoService.getDayBatchPlanInfos(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}