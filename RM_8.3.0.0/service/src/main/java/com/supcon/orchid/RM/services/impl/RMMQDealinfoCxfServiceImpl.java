package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMMQDealinfoCxfService;
import com.supcon.orchid.RM.services.RMMQDealinfoService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_interfaceService_MQDealinfo,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMMQDealinfoCxfService")
@Transactional
public class RMMQDealinfoCxfServiceImpl implements RMMQDealinfoCxfService {
	
	@Resource
	private RMMQDealinfoService mQDealinfoService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMMQDealinfo getMQDealinfo(long id){
		RMMQDealinfo mQDealinfo = mQDealinfoService.getMQDealinfo(id);
		return mQDealinfo;
	}
	
	@Override
	
	public void updateMQDealinfo(long id, RMMQDealinfo mQDealinfo) {
		// TODO Auto-generated method stub
		mQDealinfo.setId(id);
		mQDealinfoService.saveMQDealinfo(mQDealinfo,null,null,null);
	}

	@Override
	
	public void createMQDealinfo(RMMQDealinfo mQDealinfo) {
		// TODO Auto-generated method stub
		mQDealinfoService.saveMQDealinfo(mQDealinfo,null,null,null);
	}

	@Override
	
	public void deleteMQDealinfo(long id) {
		// TODO Auto-generated method stub
		RMMQDealinfo mQDealinfo = mQDealinfoService.getMQDealinfo(id);
		mQDealinfoService.deleteMQDealinfo(mQDealinfo);
	}
	
	@Override
	public ArrayList<RMMQDealinfo> getMQDealinfoList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"mQDealinfo\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMMQDealinfo> list = mQDealinfoService.getMQDealinfos(customer, customerValue);
		 
		return (ArrayList<RMMQDealinfo>) list;
	}

	@Override
	
	public void MQDealinfoList(ArrayList<RMMQDealinfo> mQDealinfos) {
		// TODO Auto-generated method stub
		for(RMMQDealinfo mQDealinfo : mQDealinfos){
			RMMQDealinfo old = mQDealinfoService.loadMQDealinfoByBussinessKey(mQDealinfo);
			if(old!=null){
				mQDealinfo.setId(old.getId());
				mQDealinfo.setVersion(old.getVersion());
			}
			mQDealinfoService.mergeMQDealinfo(mQDealinfo, null,null,null);
		}
	}
	
	@Override
	public Page<RMMQDealinfo> getMQDealinfoPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"mQDealinfo\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMMQDealinfo> page = new Page<RMMQDealinfo>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMMQDealinfo> list = mQDealinfoService.getMQDealinfos(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMMQDealinfo> getMQDealinfoPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"mQDealinfo\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMMQDealinfo> page = new Page<RMMQDealinfo>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMMQDealinfo> list = mQDealinfoService.getMQDealinfos(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_interfaceService_MQDealinfo,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}