package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMInterfaceSyncLogCxfService;
import com.supcon.orchid.RM.services.RMInterfaceSyncLogService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMInterfaceSyncLogCxfService")
@Transactional
public class RMInterfaceSyncLogCxfServiceImpl implements RMInterfaceSyncLogCxfService {
	
	@Resource
	private RMInterfaceSyncLogService interfaceSyncLogService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("RM_7.5.0.0_interfaceService_logList")
	public RMInterfaceSyncLog getInterfaceSyncLog(long id){
		RMInterfaceSyncLog interfaceSyncLog = interfaceSyncLogService.getInterfaceSyncLog(id);
		return interfaceSyncLog;
	}
	
	@Override
	
	public void updateInterfaceSyncLog(long id, RMInterfaceSyncLog interfaceSyncLog) {
		// TODO Auto-generated method stub
		interfaceSyncLog.setId(id);
		interfaceSyncLogService.saveInterfaceSyncLog(interfaceSyncLog,null,null,null);
	}

	@Override
	
	public void createInterfaceSyncLog(RMInterfaceSyncLog interfaceSyncLog) {
		// TODO Auto-generated method stub
		interfaceSyncLogService.saveInterfaceSyncLog(interfaceSyncLog,null,null,null);
	}

	@Override
	
	public void deleteInterfaceSyncLog(long id) {
		// TODO Auto-generated method stub
		RMInterfaceSyncLog interfaceSyncLog = interfaceSyncLogService.getInterfaceSyncLog(id);
		interfaceSyncLogService.deleteInterfaceSyncLog(interfaceSyncLog);
	}
	
	@Override
	public ArrayList<RMInterfaceSyncLog> getInterfaceSyncLogList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"interfaceSyncLog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMInterfaceSyncLog> list = interfaceSyncLogService.getInterfaceSyncLogs(customer, customerValue);
		 
		return (ArrayList<RMInterfaceSyncLog>) list;
	}

	@Override
	
	public void InterfaceSyncLogList(ArrayList<RMInterfaceSyncLog> interfaceSyncLogs) {
		// TODO Auto-generated method stub
		for(RMInterfaceSyncLog interfaceSyncLog : interfaceSyncLogs){
			RMInterfaceSyncLog old = interfaceSyncLogService.loadInterfaceSyncLogByBussinessKey(interfaceSyncLog);
			if(old!=null){
				interfaceSyncLog.setId(old.getId());
				interfaceSyncLog.setVersion(old.getVersion());
			}
			interfaceSyncLogService.mergeInterfaceSyncLog(interfaceSyncLog, null,null,null);
		}
	}
	
	@Override
	public Page<RMInterfaceSyncLog> getInterfaceSyncLogPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"interfaceSyncLog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMInterfaceSyncLog> page = new Page<RMInterfaceSyncLog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMInterfaceSyncLog> list = interfaceSyncLogService.getInterfaceSyncLogs(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMInterfaceSyncLog> getInterfaceSyncLogPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"interfaceSyncLog\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMInterfaceSyncLog> page = new Page<RMInterfaceSyncLog>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMInterfaceSyncLog> list = interfaceSyncLogService.getInterfaceSyncLogs(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}