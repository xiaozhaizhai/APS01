package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicAccountPeriodCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicAccountPeriodService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_accountingPeriod_AccountPeriod,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicAccountPeriodCxfService")
@Transactional
public class X6BasicAccountPeriodCxfServiceImpl implements X6BasicAccountPeriodCxfService {
	
	@Resource
	private X6BasicAccountPeriodService accountPeriodService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_accountingPeriod_list")
	public X6BasicAccountPeriod getAccountPeriod(long id){
		X6BasicAccountPeriod accountPeriod = accountPeriodService.getAccountPeriod(id);
		return accountPeriod;
	}
	
	@Override
	@BAPPermission("X6Basic_1.0_accountingPeriod_list_BUTTON_modify")
	public void updateAccountPeriod(long id, X6BasicAccountPeriod accountPeriod) {
		// TODO Auto-generated method stub
		accountPeriod.setId(id);
		accountPeriodService.saveAccountPeriod(accountPeriod,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_accountingPeriod_list_BUTTON_add")
	public void createAccountPeriod(X6BasicAccountPeriod accountPeriod) {
		// TODO Auto-generated method stub
		accountPeriodService.saveAccountPeriod(accountPeriod,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_accountingPeriod_list_BUTTON_del")
	public void deleteAccountPeriod(long id) {
		// TODO Auto-generated method stub
		X6BasicAccountPeriod accountPeriod = accountPeriodService.getAccountPeriod(id);
		accountPeriodService.deleteAccountPeriod(accountPeriod);
	}
	
	@Override
	public ArrayList<X6BasicAccountPeriod> getAccountPeriodList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"accountPeriod\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicAccountPeriod> list = accountPeriodService.getAccountPeriods(customer, customerValue);
		 
		return (ArrayList<X6BasicAccountPeriod>) list;
	}

	@Override
	@BAPPermission("X6Basic_1.0_accountingPeriod_list_BUTTON_add")
	public void AccountPeriodList(ArrayList<X6BasicAccountPeriod> accountPeriods) {
		// TODO Auto-generated method stub
		for(X6BasicAccountPeriod accountPeriod : accountPeriods){
			X6BasicAccountPeriod old = accountPeriodService.loadAccountPeriodByBussinessKey(accountPeriod);
			if(old!=null){
				accountPeriod.setId(old.getId());
				accountPeriod.setVersion(old.getVersion());
			}
			accountPeriodService.mergeAccountPeriod(accountPeriod, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicAccountPeriod> getAccountPeriodPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"accountPeriod\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicAccountPeriod> page = new Page<X6BasicAccountPeriod>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicAccountPeriod> list = accountPeriodService.getAccountPeriods(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicAccountPeriod> getAccountPeriodPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"accountPeriod\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicAccountPeriod> page = new Page<X6BasicAccountPeriod>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicAccountPeriod> list = accountPeriodService.getAccountPeriods(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_accountingPeriod_AccountPeriod,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}