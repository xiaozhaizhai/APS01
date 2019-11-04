package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicServiceLoggerCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicServiceLoggerService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchData;
import com.supcon.orchid.MESBasic.entities.MESBasicQACheckIndex;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEamType;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicObjEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicObjPostion;
import com.supcon.orchid.MESBasic.entities.MESBasicObjProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicObjTeam;
import com.supcon.orchid.MESBasic.entities.MESBasicObjWareStore;
import com.supcon.orchid.MESBasic.entities.MESBasicPositionDeal;
import com.supcon.orchid.MESBasic.entities.MESBasicDepartmentWare;
import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicNodeType;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicPotData;
import com.supcon.orchid.MESBasic.entities.MESBasicProdAttribute;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.MESBasic.entities.MESBasicProdattrel;
import com.supcon.orchid.MESBasic.entities.MESBasicCommDealInfo;
import com.supcon.orchid.MESBasic.entities.MESBasicCprodAtt;
import com.supcon.orchid.MESBasic.entities.MESBasicProdDealInfo;
import com.supcon.orchid.MESBasic.entities.MESBasicProdLevel;
import com.supcon.orchid.MESBasic.entities.MESBasicProdResetDaily;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicProductCost;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroup;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroupMember;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
import com.supcon.orchid.MESBasic.entities.MESBasicWareClass;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_backgroundServiceMonitor_ServiceLogger,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicServiceLoggerCxfService")
@Transactional
public class MESBasicServiceLoggerCxfServiceImpl implements MESBasicServiceLoggerCxfService {
	
	@Resource
	private MESBasicServiceLoggerService serviceLoggerService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("MESBasic_1_backgroundServiceMonitor_logHistory")
	public MESBasicServiceLogger getServiceLogger(long id){
		MESBasicServiceLogger serviceLogger = serviceLoggerService.getServiceLogger(id);
		return serviceLogger;
	}
	
	@Override
	
	public void updateServiceLogger(long id, MESBasicServiceLogger serviceLogger) {
		// TODO Auto-generated method stub
		serviceLogger.setId(id);
		serviceLoggerService.saveServiceLogger(serviceLogger,null,null,null);
	}

	@Override
	
	public void createServiceLogger(MESBasicServiceLogger serviceLogger) {
		// TODO Auto-generated method stub
		serviceLoggerService.saveServiceLogger(serviceLogger,null,null,null);
	}

	@Override
	
	public void deleteServiceLogger(long id) {
		// TODO Auto-generated method stub
		MESBasicServiceLogger serviceLogger = serviceLoggerService.getServiceLogger(id);
		serviceLoggerService.deleteServiceLogger(serviceLogger);
	}
	
	@Override
	public ArrayList<MESBasicServiceLogger> getServiceLoggerList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"serviceLogger\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicServiceLogger> list = serviceLoggerService.getServiceLoggers(customer, customerValue);
		 
		return (ArrayList<MESBasicServiceLogger>) list;
	}

	@Override
	
	public void ServiceLoggerList(ArrayList<MESBasicServiceLogger> serviceLoggers) {
		// TODO Auto-generated method stub
		for(MESBasicServiceLogger serviceLogger : serviceLoggers){
			MESBasicServiceLogger old = serviceLoggerService.loadServiceLoggerByBussinessKey(serviceLogger);
			if(old!=null){
				serviceLogger.setId(old.getId());
				serviceLogger.setVersion(old.getVersion());
			}
			serviceLoggerService.mergeServiceLogger(serviceLogger, null,null,null);
		}
	}
	
	@Override
	public Page<MESBasicServiceLogger> getServiceLoggerPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"serviceLogger\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicServiceLogger> page = new Page<MESBasicServiceLogger>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicServiceLogger> list = serviceLoggerService.getServiceLoggers(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicServiceLogger> getServiceLoggerPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"serviceLogger\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicServiceLogger> page = new Page<MESBasicServiceLogger>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicServiceLogger> list = serviceLoggerService.getServiceLoggers(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_backgroundServiceMonitor_ServiceLogger,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}