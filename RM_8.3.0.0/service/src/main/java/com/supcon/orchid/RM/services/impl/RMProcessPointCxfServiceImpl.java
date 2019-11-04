package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMProcessPointCxfService;
import com.supcon.orchid.RM.services.RMProcessPointService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_suitedLine_ProcessPoint,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMProcessPointCxfService")
@Transactional
public class RMProcessPointCxfServiceImpl implements RMProcessPointCxfService {
	
	@Resource
	private RMProcessPointService processPointService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMProcessPoint getProcessPoint(long id){
		RMProcessPoint processPoint = processPointService.getProcessPoint(id);
		return processPoint;
	}
	
	@Override
	
	public void updateProcessPoint(long id, RMProcessPoint processPoint) {
		// TODO Auto-generated method stub
		processPoint.setId(id);
		processPointService.saveProcessPoint(processPoint,null,null,null);
	}

	@Override
	
	public void createProcessPoint(RMProcessPoint processPoint) {
		// TODO Auto-generated method stub
		processPointService.saveProcessPoint(processPoint,null,null,null);
	}

	@Override
	
	public void deleteProcessPoint(long id) {
		// TODO Auto-generated method stub
		RMProcessPoint processPoint = processPointService.getProcessPoint(id);
		processPointService.deleteProcessPoint(processPoint);
	}
	
	@Override
	public ArrayList<RMProcessPoint> getProcessPointList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processPoint\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMProcessPoint> list = processPointService.getProcessPoints(customer, customerValue);
		 
		return (ArrayList<RMProcessPoint>) list;
	}

	@Override
	
	public void ProcessPointList(ArrayList<RMProcessPoint> processPoints) {
		// TODO Auto-generated method stub
		for(RMProcessPoint processPoint : processPoints){
			RMProcessPoint old = processPointService.loadProcessPointByBussinessKey(processPoint);
			if(old!=null){
				processPoint.setId(old.getId());
				processPoint.setVersion(old.getVersion());
			}
			processPointService.mergeProcessPoint(processPoint, null,null,null);
		}
	}
	
	@Override
	public Page<RMProcessPoint> getProcessPointPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processPoint\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMProcessPoint> page = new Page<RMProcessPoint>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMProcessPoint> list = processPointService.getProcessPoints(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMProcessPoint> getProcessPointPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processPoint\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMProcessPoint> page = new Page<RMProcessPoint>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMProcessPoint> list = processPointService.getProcessPoints(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_suitedLine_ProcessPoint,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}