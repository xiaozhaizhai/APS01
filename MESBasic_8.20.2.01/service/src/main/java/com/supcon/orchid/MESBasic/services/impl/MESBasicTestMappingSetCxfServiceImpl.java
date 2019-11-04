package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicTestMappingSetCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicTestMappingSetService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchData;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicPotData;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSet;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicTestMappingSetCxfService")
@Transactional
public class MESBasicTestMappingSetCxfServiceImpl implements MESBasicTestMappingSetCxfService {
	
	@Resource
	private MESBasicTestMappingSetService testMappingSetService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("MESBasic_1_testMapping_list")
	public MESBasicTestMappingSet getTestMappingSet(long id){
		MESBasicTestMappingSet testMappingSet = testMappingSetService.getTestMappingSet(id);
		return testMappingSet;
	}
	
	@Override
	@BAPPermission("MESBasic_1_testMapping_list_BUTTON_modify")
	public void updateTestMappingSet(long id, MESBasicTestMappingSet testMappingSet) {
		// TODO Auto-generated method stub
		testMappingSet.setId(id);
		testMappingSetService.saveTestMappingSet(testMappingSet, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	@BAPPermission("MESBasic_1_testMapping_list_BUTTON_add")
	public void createTestMappingSet(MESBasicTestMappingSet testMappingSet) {
		// TODO Auto-generated method stub
		testMappingSetService.saveTestMappingSet(testMappingSet, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	@BAPPermission("MESBasic_1_testMapping_list_BUTTON_删除")
	public void deleteTestMappingSet(long id) {
		// TODO Auto-generated method stub
		MESBasicTestMappingSet testMappingSet = testMappingSetService.getTestMappingSet(id);
		testMappingSetService.deleteTestMappingSet(testMappingSet);
	}
	
	@Override
	public ArrayList<MESBasicTestMappingSet> getTestMappingSetList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"testMappingSet\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicTestMappingSet> list = testMappingSetService.getTestMappingSets(customer, customerValue);
		 
		return (ArrayList<MESBasicTestMappingSet>) list;
	}

	@Override
	@BAPPermission("MESBasic_1_testMapping_list_BUTTON_add")
	public void TestMappingSetList(ArrayList<MESBasicTestMappingSet> testMappingSets) {
		// TODO Auto-generated method stub
		for(MESBasicTestMappingSet testMappingSet : testMappingSets){
			MESBasicTestMappingSet old = testMappingSetService.loadTestMappingSetByBussinessKey(testMappingSet);
			if(old!=null){
				testMappingSet.setId(old.getId());
				testMappingSet.setVersion(old.getVersion());
			}
			testMappingSetService.mergeTestMappingSet(testMappingSet, null);
		}
	}
	
	@Override
	public Page<MESBasicTestMappingSet> getTestMappingSetPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"testMappingSet\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicTestMappingSet> page = new Page<MESBasicTestMappingSet>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicTestMappingSet> list = testMappingSetService.getTestMappingSets(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicTestMappingSet> getTestMappingSetPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"testMappingSet\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicTestMappingSet> page = new Page<MESBasicTestMappingSet>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicTestMappingSet> list = testMappingSetService.getTestMappingSets(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}