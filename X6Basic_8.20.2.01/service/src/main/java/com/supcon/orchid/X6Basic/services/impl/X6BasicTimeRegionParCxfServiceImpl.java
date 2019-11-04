package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicTimeRegionParCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicTimeRegionParService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_timeRegion_TimeRegionPar,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicTimeRegionParCxfService")
@Transactional
public class X6BasicTimeRegionParCxfServiceImpl implements X6BasicTimeRegionParCxfService {
	
	@Resource
	private X6BasicTimeRegionParService timeRegionParService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_timeRegion_partList")
	public X6BasicTimeRegionPar getTimeRegionPar(long id){
		X6BasicTimeRegionPar timeRegionPar = timeRegionParService.getTimeRegionPar(id);
		return timeRegionPar;
	}
	
	@Override
	
	public void updateTimeRegionPar(long id, X6BasicTimeRegionPar timeRegionPar) {
		// TODO Auto-generated method stub
		timeRegionPar.setId(id);
		timeRegionParService.saveTimeRegionPar(timeRegionPar,null,null,null);
	}

	@Override
	
	public void createTimeRegionPar(X6BasicTimeRegionPar timeRegionPar) {
		// TODO Auto-generated method stub
		timeRegionParService.saveTimeRegionPar(timeRegionPar,null,null,null);
	}

	@Override
	
	public void deleteTimeRegionPar(long id) {
		// TODO Auto-generated method stub
		X6BasicTimeRegionPar timeRegionPar = timeRegionParService.getTimeRegionPar(id);
		timeRegionParService.deleteTimeRegionPar(timeRegionPar);
	}
	
	@Override
	public ArrayList<X6BasicTimeRegionPar> getTimeRegionParList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"timeRegionPar\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicTimeRegionPar> list = timeRegionParService.getTimeRegionPars(customer, customerValue);
		 
		return (ArrayList<X6BasicTimeRegionPar>) list;
	}

	@Override
	
	public void TimeRegionParList(ArrayList<X6BasicTimeRegionPar> timeRegionPars) {
		// TODO Auto-generated method stub
		for(X6BasicTimeRegionPar timeRegionPar : timeRegionPars){
			X6BasicTimeRegionPar old = timeRegionParService.loadTimeRegionParByBussinessKey(timeRegionPar);
			if(old!=null){
				timeRegionPar.setId(old.getId());
				timeRegionPar.setVersion(old.getVersion());
			}
			timeRegionParService.mergeTimeRegionPar(timeRegionPar, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicTimeRegionPar> getTimeRegionParPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"timeRegionPar\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicTimeRegionPar> page = new Page<X6BasicTimeRegionPar>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicTimeRegionPar> list = timeRegionParService.getTimeRegionPars(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicTimeRegionPar> getTimeRegionParPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"timeRegionPar\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicTimeRegionPar> page = new Page<X6BasicTimeRegionPar>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicTimeRegionPar> list = timeRegionParService.getTimeRegionPars(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_timeRegion_TimeRegionPar,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}