package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMPickSiteCxfService;
import com.supcon.orchid.RM.services.RMPickSiteService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_pickSite_PickSite,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMPickSiteCxfService")
@Transactional
public class RMPickSiteCxfServiceImpl implements RMPickSiteCxfService {
	
	@Resource
	private RMPickSiteService pickSiteService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMPickSite getPickSite(long id){
		RMPickSite pickSite = pickSiteService.getPickSite(id);
		return pickSite;
	}
	
	@Override
	
	public void updatePickSite(long id, RMPickSite pickSite) {
		// TODO Auto-generated method stub
		pickSite.setId(id);
		pickSiteService.savePickSite(pickSite,null,null,null);
	}

	@Override
	
	public void createPickSite(RMPickSite pickSite) {
		// TODO Auto-generated method stub
		pickSiteService.savePickSite(pickSite,null,null,null);
	}

	@Override
	
	public void deletePickSite(long id) {
		// TODO Auto-generated method stub
		RMPickSite pickSite = pickSiteService.getPickSite(id);
		pickSiteService.deletePickSite(pickSite);
	}
	
	@Override
	public ArrayList<RMPickSite> getPickSiteList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"pickSite\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMPickSite> list = pickSiteService.getPickSites(customer, customerValue);
		 
		return (ArrayList<RMPickSite>) list;
	}

	@Override
	
	public void PickSiteList(ArrayList<RMPickSite> pickSites) {
		// TODO Auto-generated method stub
		for(RMPickSite pickSite : pickSites){
			RMPickSite old = pickSiteService.loadPickSiteByBussinessKey(pickSite);
			if(old!=null){
				pickSite.setId(old.getId());
				pickSite.setVersion(old.getVersion());
			}
			pickSiteService.mergePickSite(pickSite, null,null,null);
		}
	}
	
	@Override
	public Page<RMPickSite> getPickSitePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"pickSite\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMPickSite> page = new Page<RMPickSite>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMPickSite> list = pickSiteService.getPickSites(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMPickSite> getPickSitePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"pickSite\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMPickSite> page = new Page<RMPickSite>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMPickSite> list = pickSiteService.getPickSites(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_pickSite_PickSite,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}