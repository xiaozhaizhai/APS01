package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicStoreSetCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicStoreSetService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_storeSet_StoreSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicStoreSetCxfService")
@Transactional
public class MESBasicStoreSetCxfServiceImpl implements MESBasicStoreSetCxfService {
	
	@Resource
	private MESBasicStoreSetService storeSetService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public MESBasicStoreSet getStoreSet(long id){
		MESBasicStoreSet storeSet = storeSetService.getStoreSet(id);
		return storeSet;
	}
	
	@Override
	
	public void updateStoreSet(long id, MESBasicStoreSet storeSet) {
		// TODO Auto-generated method stub
		storeSet.setId(id);
		storeSetService.saveStoreSet(storeSet,null,null,null);
	}

	@Override
	
	public void createStoreSet(MESBasicStoreSet storeSet) {
		// TODO Auto-generated method stub
		storeSetService.saveStoreSet(storeSet,null,null,null);
	}

	@Override
	
	public void deleteStoreSet(long id) {
		// TODO Auto-generated method stub
		MESBasicStoreSet storeSet = storeSetService.getStoreSet(id);
		storeSetService.deleteStoreSet(storeSet);
	}
	
	@Override
	public ArrayList<MESBasicStoreSet> getStoreSetList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"storeSet\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicStoreSet> list = storeSetService.getStoreSets(customer, customerValue);
		 
		return (ArrayList<MESBasicStoreSet>) list;
	}

	@Override
	
	public void StoreSetList(ArrayList<MESBasicStoreSet> storeSets) {
		// TODO Auto-generated method stub
		for(MESBasicStoreSet storeSet : storeSets){
			MESBasicStoreSet old = storeSetService.loadStoreSetByBussinessKey(storeSet);
			if(old!=null){
				storeSet.setId(old.getId());
				storeSet.setVersion(old.getVersion());
			}
			storeSetService.mergeStoreSet(storeSet, null,null,null);
		}
	}
	
	@Override
	public Page<MESBasicStoreSet> getStoreSetPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"storeSet\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicStoreSet> page = new Page<MESBasicStoreSet>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicStoreSet> list = storeSetService.getStoreSets(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicStoreSet> getStoreSetPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"storeSet\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicStoreSet> page = new Page<MESBasicStoreSet>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicStoreSet> list = storeSetService.getStoreSets(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_storeSet_StoreSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}