package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMSampleProjCxfService;
import com.supcon.orchid.RM.services.RMSampleProjService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_sampleProj_SampleProj,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMSampleProjCxfService")
@Transactional
public class RMSampleProjCxfServiceImpl implements RMSampleProjCxfService {
	
	@Resource
	private RMSampleProjService sampleProjService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMSampleProj getSampleProj(long id){
		RMSampleProj sampleProj = sampleProjService.getSampleProj(id);
		return sampleProj;
	}
	
	@Override
	
	public void updateSampleProj(long id, RMSampleProj sampleProj) {
		// TODO Auto-generated method stub
		sampleProj.setId(id);
		sampleProjService.saveSampleProj(sampleProj,null,null,null);
	}

	@Override
	
	public void createSampleProj(RMSampleProj sampleProj) {
		// TODO Auto-generated method stub
		sampleProjService.saveSampleProj(sampleProj,null,null,null);
	}

	@Override
	
	public void deleteSampleProj(long id) {
		// TODO Auto-generated method stub
		RMSampleProj sampleProj = sampleProjService.getSampleProj(id);
		sampleProjService.deleteSampleProj(sampleProj);
	}
	
	@Override
	public ArrayList<RMSampleProj> getSampleProjList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"sampleProj\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMSampleProj> list = sampleProjService.getSampleProjs(customer, customerValue);
		 
		return (ArrayList<RMSampleProj>) list;
	}

	@Override
	
	public void SampleProjList(ArrayList<RMSampleProj> sampleProjs) {
		// TODO Auto-generated method stub
		for(RMSampleProj sampleProj : sampleProjs){
			RMSampleProj old = sampleProjService.loadSampleProjByBussinessKey(sampleProj);
			if(old!=null){
				sampleProj.setId(old.getId());
				sampleProj.setVersion(old.getVersion());
			}
			sampleProjService.mergeSampleProj(sampleProj, null,null,null);
		}
	}
	
	@Override
	public Page<RMSampleProj> getSampleProjPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"sampleProj\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMSampleProj> page = new Page<RMSampleProj>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMSampleProj> list = sampleProjService.getSampleProjs(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMSampleProj> getSampleProjPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"sampleProj\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMSampleProj> page = new Page<RMSampleProj>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMSampleProj> list = sampleProjService.getSampleProjs(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_sampleProj_SampleProj,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}