package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicVendorClassCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicVendorClassService;
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
import com.supcon.orchid.MESBasic.entities.MESBasicVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSet;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_baseVendor_VendorClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
@Service("mESBasicVendorClassCxfService")
@Transactional
public class MESBasicVendorClassCxfServiceImpl implements MESBasicVendorClassCxfService {
	
	@Resource
	private MESBasicVendorClassService vendorClassService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public MESBasicVendorClass getVendorClass(long id){
		MESBasicVendorClass vendorClass = vendorClassService.getVendorClass(id);
		return vendorClass;
	}
	
	@Override
	
	public void updateVendorClass(long id, MESBasicVendorClass vendorClass) {
		// TODO Auto-generated method stub
		vendorClass.setId(id);
		vendorClassService.saveVendorClass(vendorClass, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	
	public void createVendorClass(MESBasicVendorClass vendorClass) {
		// TODO Auto-generated method stub
		vendorClassService.saveVendorClass(vendorClass, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	
	public void deleteVendorClass(long id) {
		// TODO Auto-generated method stub
		MESBasicVendorClass vendorClass = vendorClassService.getVendorClass(id);
		vendorClassService.deleteVendorClass(vendorClass);
	}
	
	@Override
	public ArrayList<MESBasicVendorClass> getVendorClassList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"vendorClass\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicVendorClass> list = vendorClassService.getVendorClasss(customer, customerValue);
		 
		return (ArrayList<MESBasicVendorClass>) list;
	}

	@Override
	
	public void VendorClassList(ArrayList<MESBasicVendorClass> vendorClasss) {
		// TODO Auto-generated method stub
		for(MESBasicVendorClass vendorClass : vendorClasss){
			MESBasicVendorClass old = vendorClassService.loadVendorClassByBussinessKey(vendorClass);
			if(old!=null){
				vendorClass.setId(old.getId());
				vendorClass.setVersion(old.getVersion());
			}
			vendorClassService.mergeVendorClass(vendorClass, null);
		}
	}
	
	@Override
	public Page<MESBasicVendorClass> getVendorClassPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"vendorClass\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicVendorClass> page = new Page<MESBasicVendorClass>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicVendorClass> list = vendorClassService.getVendorClasss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicVendorClass> getVendorClassPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"vendorClass\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicVendorClass> page = new Page<MESBasicVendorClass>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicVendorClass> list = vendorClassService.getVendorClasss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_baseVendor_VendorClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}