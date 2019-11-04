package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicTestCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicTestService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.ec.services.DataGridService;
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
import com.supcon.orchid.X6Basic.entities.X6BasicTest;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegion;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegionPar;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
import com.supcon.orchid.X6Basic.entities.X6BasicUnitGroups;
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_test_Test,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
@Service("x6BasicTestCxfService")
@Transactional
public class X6BasicTestCxfServiceImpl implements X6BasicTestCxfService {
	
	@Resource
	private X6BasicTestService testService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_test_list")
	public X6BasicTest getTest(long id){
		X6BasicTest test = testService.getTest(id);
		return test;
	}
	
	@Override
	
	public void updateTest(long id, X6BasicTest test) {
		// TODO Auto-generated method stub
		test.setId(id);
		testService.saveTest(test, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	
	public void createTest(X6BasicTest test) {
		// TODO Auto-generated method stub
		testService.saveTest(test, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	
	public void deleteTest(long id) {
		// TODO Auto-generated method stub
		X6BasicTest test = testService.getTest(id);
		testService.deleteTest(test);
	}
	
	@Override
	public ArrayList<X6BasicTest> getTestList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"test\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicTest> list = testService.getTests(customer, customerValue);
		 
		return (ArrayList<X6BasicTest>) list;
	}

	@Override
	
	public void TestList(ArrayList<X6BasicTest> tests) {
		// TODO Auto-generated method stub
		for(X6BasicTest test : tests){
			X6BasicTest old = testService.loadTestByBussinessKey(test);
			if(old!=null){
				test.setId(old.getId());
				test.setVersion(old.getVersion());
			}
			testService.mergeTest(test, null);
		}
	}
	
	@Override
	public Page<X6BasicTest> getTestPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"test\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicTest> page = new Page<X6BasicTest>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicTest> list = testService.getTests(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicTest> getTestPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"test\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicTest> page = new Page<X6BasicTest>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicTest> list = testService.getTests(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_test_Test,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}