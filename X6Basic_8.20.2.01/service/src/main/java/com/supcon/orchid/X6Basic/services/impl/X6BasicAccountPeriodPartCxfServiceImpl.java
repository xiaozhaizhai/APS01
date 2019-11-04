package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicAccountPeriodPartCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicAccountPeriodPartService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_accountingPeriod_AccountPeriodPart,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicAccountPeriodPartCxfService")
@Transactional
public class X6BasicAccountPeriodPartCxfServiceImpl implements X6BasicAccountPeriodPartCxfService {
	
	@Resource
	private X6BasicAccountPeriodPartService accountPeriodPartService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public X6BasicAccountPeriodPart getAccountPeriodPart(long id){
		X6BasicAccountPeriodPart accountPeriodPart = accountPeriodPartService.getAccountPeriodPart(id);
		return accountPeriodPart;
	}
	
	@Override
	
	public void updateAccountPeriodPart(long id, X6BasicAccountPeriodPart accountPeriodPart) {
		// TODO Auto-generated method stub
		accountPeriodPart.setId(id);
		accountPeriodPartService.saveAccountPeriodPart(accountPeriodPart,null,null,null);
	}

	@Override
	
	public void createAccountPeriodPart(X6BasicAccountPeriodPart accountPeriodPart) {
		// TODO Auto-generated method stub
		accountPeriodPartService.saveAccountPeriodPart(accountPeriodPart,null,null,null);
	}

	@Override
	
	public void deleteAccountPeriodPart(long id) {
		// TODO Auto-generated method stub
		X6BasicAccountPeriodPart accountPeriodPart = accountPeriodPartService.getAccountPeriodPart(id);
		accountPeriodPartService.deleteAccountPeriodPart(accountPeriodPart);
	}
	
	@Override
	public ArrayList<X6BasicAccountPeriodPart> getAccountPeriodPartList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"accountPeriodPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicAccountPeriodPart> list = accountPeriodPartService.getAccountPeriodParts(customer, customerValue);
		 
		return (ArrayList<X6BasicAccountPeriodPart>) list;
	}

	@Override
	
	public void AccountPeriodPartList(ArrayList<X6BasicAccountPeriodPart> accountPeriodParts) {
		// TODO Auto-generated method stub
		for(X6BasicAccountPeriodPart accountPeriodPart : accountPeriodParts){
			X6BasicAccountPeriodPart old = accountPeriodPartService.loadAccountPeriodPartByBussinessKey(accountPeriodPart);
			if(old!=null){
				accountPeriodPart.setId(old.getId());
				accountPeriodPart.setVersion(old.getVersion());
			}
			accountPeriodPartService.mergeAccountPeriodPart(accountPeriodPart, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicAccountPeriodPart> getAccountPeriodPartPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"accountPeriodPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicAccountPeriodPart> page = new Page<X6BasicAccountPeriodPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicAccountPeriodPart> list = accountPeriodPartService.getAccountPeriodParts(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicAccountPeriodPart> getAccountPeriodPartPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"accountPeriodPart\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicAccountPeriodPart> page = new Page<X6BasicAccountPeriodPart>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicAccountPeriodPart> list = accountPeriodPartService.getAccountPeriodParts(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_accountingPeriod_AccountPeriodPart,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}