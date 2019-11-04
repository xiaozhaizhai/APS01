package com.supcon.orchid.WOM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.WOM.services.WOMStandingcropRefCxfService;
import com.supcon.orchid.WOM.services.WOMStandingcropRefService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,WOM_7.5.0.0_standingcropRef_StandingcropRef,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("wOMStandingcropRefCxfService")
@Transactional
public class WOMStandingcropRefCxfServiceImpl implements WOMStandingcropRefCxfService {
	
	@Resource
	private WOMStandingcropRefService standingcropRefService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public WOMStandingcropRef getStandingcropRef(long id){
		WOMStandingcropRef standingcropRef = standingcropRefService.getStandingcropRef(id);
		return standingcropRef;
	}
	
	@Override
	
	public void updateStandingcropRef(long id, WOMStandingcropRef standingcropRef) {
		// TODO Auto-generated method stub
		standingcropRef.setId(id);
		standingcropRefService.saveStandingcropRef(standingcropRef,null,null,null);
	}

	@Override
	
	public void createStandingcropRef(WOMStandingcropRef standingcropRef) {
		// TODO Auto-generated method stub
		standingcropRefService.saveStandingcropRef(standingcropRef,null,null,null);
	}

	@Override
	
	public void deleteStandingcropRef(long id) {
		// TODO Auto-generated method stub
		WOMStandingcropRef standingcropRef = standingcropRefService.getStandingcropRef(id);
		standingcropRefService.deleteStandingcropRef(standingcropRef);
	}
	
	@Override
	public ArrayList<WOMStandingcropRef> getStandingcropRefList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"standingcropRef\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<WOMStandingcropRef> list = standingcropRefService.getStandingcropRefs(customer, customerValue);
		 
		return (ArrayList<WOMStandingcropRef>) list;
	}

	@Override
	
	public void StandingcropRefList(ArrayList<WOMStandingcropRef> standingcropRefs) {
		// TODO Auto-generated method stub
		for(WOMStandingcropRef standingcropRef : standingcropRefs){
			WOMStandingcropRef old = standingcropRefService.loadStandingcropRefByBussinessKey(standingcropRef);
			if(old!=null){
				standingcropRef.setId(old.getId());
				standingcropRef.setVersion(old.getVersion());
			}
			standingcropRefService.mergeStandingcropRef(standingcropRef, null,null,null);
		}
	}
	
	@Override
	public Page<WOMStandingcropRef> getStandingcropRefPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"standingcropRef\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMStandingcropRef> page = new Page<WOMStandingcropRef>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMStandingcropRef> list = standingcropRefService.getStandingcropRefs(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<WOMStandingcropRef> getStandingcropRefPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"standingcropRef\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<WOMStandingcropRef> page = new Page<WOMStandingcropRef>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<WOMStandingcropRef> list = standingcropRefService.getStandingcropRefs(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,WOM_7.5.0.0_standingcropRef_StandingcropRef,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}