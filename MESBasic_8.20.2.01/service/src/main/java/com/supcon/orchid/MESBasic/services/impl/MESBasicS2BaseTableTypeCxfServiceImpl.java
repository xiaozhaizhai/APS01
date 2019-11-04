package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicS2BaseTableTypeCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicS2BaseTableTypeService;
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
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicS2BaseTableType;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_tableType_S2BaseTableType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
@Service("mESBasicS2BaseTableTypeCxfService")
@Transactional
public class MESBasicS2BaseTableTypeCxfServiceImpl implements MESBasicS2BaseTableTypeCxfService {
	
	@Resource
	private MESBasicS2BaseTableTypeService s2BaseTableTypeService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public MESBasicS2BaseTableType getS2BaseTableType(long id){
		MESBasicS2BaseTableType s2BaseTableType = s2BaseTableTypeService.getS2BaseTableType(id);
		return s2BaseTableType;
	}
	
	@Override
	
	public void updateS2BaseTableType(long id, MESBasicS2BaseTableType s2BaseTableType) {
		// TODO Auto-generated method stub
		s2BaseTableType.setId(id);
		s2BaseTableTypeService.saveS2BaseTableType(s2BaseTableType, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	
	public void createS2BaseTableType(MESBasicS2BaseTableType s2BaseTableType) {
		// TODO Auto-generated method stub
		s2BaseTableTypeService.saveS2BaseTableType(s2BaseTableType, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	
	public void deleteS2BaseTableType(long id) {
		// TODO Auto-generated method stub
		MESBasicS2BaseTableType s2BaseTableType = s2BaseTableTypeService.getS2BaseTableType(id);
		s2BaseTableTypeService.deleteS2BaseTableType(s2BaseTableType);
	}
	
	@Override
	public ArrayList<MESBasicS2BaseTableType> getS2BaseTableTypeList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"s2BaseTableType\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicS2BaseTableType> list = s2BaseTableTypeService.getS2BaseTableTypes(customer, customerValue);
		 
		return (ArrayList<MESBasicS2BaseTableType>) list;
	}

	@Override
	
	public void S2BaseTableTypeList(ArrayList<MESBasicS2BaseTableType> s2BaseTableTypes) {
		// TODO Auto-generated method stub
		for(MESBasicS2BaseTableType s2BaseTableType : s2BaseTableTypes){
			MESBasicS2BaseTableType old = s2BaseTableTypeService.loadS2BaseTableTypeByBussinessKey(s2BaseTableType);
			if(old!=null){
				s2BaseTableType.setId(old.getId());
				s2BaseTableType.setVersion(old.getVersion());
			}
			s2BaseTableTypeService.mergeS2BaseTableType(s2BaseTableType, null);
		}
	}
	
	@Override
	public Page<MESBasicS2BaseTableType> getS2BaseTableTypePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"s2BaseTableType\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicS2BaseTableType> page = new Page<MESBasicS2BaseTableType>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicS2BaseTableType> list = s2BaseTableTypeService.getS2BaseTableTypes(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicS2BaseTableType> getS2BaseTableTypePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"s2BaseTableType\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicS2BaseTableType> page = new Page<MESBasicS2BaseTableType>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicS2BaseTableType> list = s2BaseTableTypeService.getS2BaseTableTypes(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_tableType_S2BaseTableType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}