package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicRangePlanPartCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicRangePlanPartService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriod;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriodPart;
import com.supcon.orchid.X6Basic.entities.X6BasicAbook;
import com.supcon.orchid.X6Basic.entities.AttMachine;
import com.supcon.orchid.X6Basic.entities.ProductManage;
import com.supcon.orchid.X6Basic.entities.X6BasicDocumentClasses;
import com.supcon.orchid.X6Basic.entities.X6BasicSignature;
import com.supcon.orchid.X6Basic.entities.X6BasicMailServer;
import com.supcon.orchid.X6Basic.entities.MeetingRoom;
import com.supcon.orchid.X6Basic.entities.UsedRecord;
import com.supcon.orchid.X6Basic.entities.MessageCenter;
import com.supcon.orchid.X6Basic.entities.X6BasicPlanDaily;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlan;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlanPart;
import com.supcon.orchid.X6Basic.entities.SignetSetting;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRule;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRulePart;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncConfigs;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncLog;
import com.supcon.orchid.X6Basic.entities.X6BasicTeamInfo;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegion;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegionPar;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
import com.supcon.orchid.X6Basic.entities.X6BasicUnitGroups;
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_rangePlan_RangePlanPart,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicRangePlanPartCxfService")
@Transactional
public class X6BasicRangePlanPartCxfServiceImpl implements X6BasicRangePlanPartCxfService {
	
	@Resource
	private X6BasicRangePlanPartService rangePlanPartService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public X6BasicRangePlanPart getRangePlanPart(long id){
		X6BasicRangePlanPart rangePlanPart = rangePlanPartService.getRangePlanPart(id);
		return rangePlanPart;
	}
	
	@Override
	
	public void updateRangePlanPart(long id, X6BasicRangePlanPart rangePlanPart) {
		// TODO Auto-generated method stub
		rangePlanPart.setId(id);
		rangePlanPartService.saveRangePlanPart(rangePlanPart,null,null,null);
	}

	@Override
	
	public void createRangePlanPart(X6BasicRangePlanPart rangePlanPart) {
		// TODO Auto-generated method stub
		rangePlanPartService.saveRangePlanPart(rangePlanPart,null,null,null);
	}

	@Override
	
	public void deleteRangePlanPart(long id) {
		// TODO Auto-generated method stub
		X6BasicRangePlanPart rangePlanPart = rangePlanPartService.getRangePlanPart(id);
		rangePlanPartService.deleteRangePlanPart(rangePlanPart);
	}
	
	@Override
	public ArrayList<X6BasicRangePlanPart> getRangePlanPartList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"rangePlanPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicRangePlanPart> list = rangePlanPartService.getRangePlanParts(customer, customerValue);
		 
		return (ArrayList<X6BasicRangePlanPart>) list;
	}

	@Override
	
	public void RangePlanPartList(ArrayList<X6BasicRangePlanPart> rangePlanParts) {
		// TODO Auto-generated method stub
		for(X6BasicRangePlanPart rangePlanPart : rangePlanParts){
			X6BasicRangePlanPart old = rangePlanPartService.loadRangePlanPartByBussinessKey(rangePlanPart);
			if(old!=null){
				rangePlanPart.setId(old.getId());
				rangePlanPart.setVersion(old.getVersion());
			}
			rangePlanPartService.mergeRangePlanPart(rangePlanPart, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicRangePlanPart> getRangePlanPartPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"rangePlanPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicRangePlanPart> page = new Page<X6BasicRangePlanPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicRangePlanPart> list = rangePlanPartService.getRangePlanParts(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicRangePlanPart> getRangePlanPartPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"rangePlanPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicRangePlanPart> page = new Page<X6BasicRangePlanPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicRangePlanPart> list = rangePlanPartService.getRangePlanParts(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_rangePlan_RangePlanPart,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}