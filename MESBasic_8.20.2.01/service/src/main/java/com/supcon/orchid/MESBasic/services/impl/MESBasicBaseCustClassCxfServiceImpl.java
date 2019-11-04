package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicBaseCustClassCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicBaseCustClassService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
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
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicBaseCustClassCxfService")
@Transactional
public class MESBasicBaseCustClassCxfServiceImpl implements MESBasicBaseCustClassCxfService {
	
	@Resource
	private MESBasicBaseCustClassService baseCustClassService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public MESBasicBaseCustClass getBaseCustClass(long id){
		MESBasicBaseCustClass baseCustClass = baseCustClassService.getBaseCustClass(id);
		return baseCustClass;
	}
	
	@Override
	
	public void updateBaseCustClass(long id, MESBasicBaseCustClass baseCustClass) {
		// TODO Auto-generated method stub
		baseCustClass.setId(id);
		baseCustClassService.saveBaseCustClass(baseCustClass, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	
	public void createBaseCustClass(MESBasicBaseCustClass baseCustClass) {
		// TODO Auto-generated method stub
		baseCustClassService.saveBaseCustClass(baseCustClass, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	
	public void deleteBaseCustClass(long id) {
		// TODO Auto-generated method stub
		MESBasicBaseCustClass baseCustClass = baseCustClassService.getBaseCustClass(id);
		baseCustClassService.deleteBaseCustClass(baseCustClass);
	}
	
	@Override
	public ArrayList<MESBasicBaseCustClass> getBaseCustClassList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"baseCustClass\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicBaseCustClass> list = baseCustClassService.getBaseCustClasss(customer, customerValue);
		 
		return (ArrayList<MESBasicBaseCustClass>) list;
	}

	@Override
	
	public void BaseCustClassList(ArrayList<MESBasicBaseCustClass> baseCustClasss) {
		// TODO Auto-generated method stub
		for(MESBasicBaseCustClass baseCustClass : baseCustClasss){
			MESBasicBaseCustClass old = baseCustClassService.loadBaseCustClassByBussinessKey(baseCustClass);
			if(old!=null){
				baseCustClass.setId(old.getId());
				baseCustClass.setVersion(old.getVersion());
			}
			baseCustClassService.mergeBaseCustClass(baseCustClass, null);
		}
	}
	
	@Override
	public Page<MESBasicBaseCustClass> getBaseCustClassPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"baseCustClass\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicBaseCustClass> page = new Page<MESBasicBaseCustClass>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicBaseCustClass> list = baseCustClassService.getBaseCustClasss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicBaseCustClass> getBaseCustClassPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"baseCustClass\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicBaseCustClass> page = new Page<MESBasicBaseCustClass>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicBaseCustClass> list = baseCustClassService.getBaseCustClasss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_baseCustomer_BaseCustClass,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}