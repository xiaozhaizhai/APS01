package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMTestProjCxfService;
import com.supcon.orchid.RM.services.RMTestProjService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.RM.entities.RMFormulaChange;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.RMFormulaBeforeProcess;
import com.supcon.orchid.RM.entities.RMFormulaBom;
import com.supcon.orchid.RM.entities.RMFormulaMixtureActive;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.entities.RMFormulaType;
import com.supcon.orchid.RM.entities.RMFactoryMapOther;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.entities.RMPickSite;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.RM.entities.RMLineFormula;
import com.supcon.orchid.RM.entities.RMProcessPoint;
import com.supcon.orchid.RM.entities.RMProcessUnit;
import com.supcon.orchid.RM.entities.RMProcessUnitChoice;
import com.supcon.orchid.RM.entities.RMTestProj;
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_testProj_TestProj,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMTestProjCxfService")
@Transactional
public class RMTestProjCxfServiceImpl implements RMTestProjCxfService {
	
	@Resource
	private RMTestProjService testProjService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMTestProj getTestProj(long id){
		RMTestProj testProj = testProjService.getTestProj(id);
		return testProj;
	}
	
	@Override
	
	public void updateTestProj(long id, RMTestProj testProj) {
		// TODO Auto-generated method stub
		testProj.setId(id);
		testProjService.saveTestProj(testProj,null,null,null);
	}

	@Override
	
	public void createTestProj(RMTestProj testProj) {
		// TODO Auto-generated method stub
		testProjService.saveTestProj(testProj,null,null,null);
	}

	@Override
	
	public void deleteTestProj(long id) {
		// TODO Auto-generated method stub
		RMTestProj testProj = testProjService.getTestProj(id);
		testProjService.deleteTestProj(testProj);
	}
	
	@Override
	public ArrayList<RMTestProj> getTestProjList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"testProj\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMTestProj> list = testProjService.getTestProjs(customer, customerValue);
		 
		return (ArrayList<RMTestProj>) list;
	}

	@Override
	
	public void TestProjList(ArrayList<RMTestProj> testProjs) {
		// TODO Auto-generated method stub
		for(RMTestProj testProj : testProjs){
			RMTestProj old = testProjService.loadTestProjByBussinessKey(testProj);
			if(old!=null){
				testProj.setId(old.getId());
				testProj.setVersion(old.getVersion());
			}
			testProjService.mergeTestProj(testProj, null,null,null);
		}
	}
	
	@Override
	public Page<RMTestProj> getTestProjPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"testProj\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMTestProj> page = new Page<RMTestProj>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMTestProj> list = testProjService.getTestProjs(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMTestProj> getTestProjPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"testProj\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMTestProj> page = new Page<RMTestProj>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMTestProj> list = testProjService.getTestProjs(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_testProj_TestProj,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}