package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicPlaceManageCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicPlaceManageService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_placeManage_PlaceManage,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicPlaceManageCxfService")
@Transactional
public class MESBasicPlaceManageCxfServiceImpl implements MESBasicPlaceManageCxfService {
	
	@Resource
	private MESBasicPlaceManageService placeManageService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("MESBasic_1_placeManage_list")
	public MESBasicPlaceManage getPlaceManage(long id){
		MESBasicPlaceManage placeManage = placeManageService.getPlaceManage(id);
		return placeManage;
	}
	
	@Override
	@BAPPermission("MESBasic_1_placeManage_list_BUTTON_change")
	public void updatePlaceManage(long id, MESBasicPlaceManage placeManage) {
		// TODO Auto-generated method stub
		placeManage.setId(id);
		placeManageService.savePlaceManage(placeManage,null,null,null);
	}

	@Override
	@BAPPermission("MESBasic_1_placeManage_list_BUTTON_add")
	public void createPlaceManage(MESBasicPlaceManage placeManage) {
		// TODO Auto-generated method stub
		placeManageService.savePlaceManage(placeManage,null,null,null);
	}

	@Override
	@BAPPermission("MESBasic_1_placeManage_list_BUTTON_delete")
	public void deletePlaceManage(long id) {
		// TODO Auto-generated method stub
		MESBasicPlaceManage placeManage = placeManageService.getPlaceManage(id);
		placeManageService.deletePlaceManage(placeManage);
	}
	
	@Override
	public ArrayList<MESBasicPlaceManage> getPlaceManageList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"placeManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicPlaceManage> list = placeManageService.getPlaceManages(customer, customerValue);
		 
		return (ArrayList<MESBasicPlaceManage>) list;
	}

	@Override
	@BAPPermission("MESBasic_1_placeManage_list_BUTTON_add")
	public void PlaceManageList(ArrayList<MESBasicPlaceManage> placeManages) {
		// TODO Auto-generated method stub
		for(MESBasicPlaceManage placeManage : placeManages){
			MESBasicPlaceManage old = placeManageService.loadPlaceManageByBussinessKey(placeManage);
			if(old!=null){
				placeManage.setId(old.getId());
				placeManage.setVersion(old.getVersion());
			}
			placeManageService.mergePlaceManage(placeManage, null,null,null);
		}
	}
	
	@Override
	public Page<MESBasicPlaceManage> getPlaceManagePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"placeManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicPlaceManage> page = new Page<MESBasicPlaceManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicPlaceManage> list = placeManageService.getPlaceManages(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicPlaceManage> getPlaceManagePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"placeManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicPlaceManage> page = new Page<MESBasicPlaceManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicPlaceManage> list = placeManageService.getPlaceManages(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_placeManage_PlaceManage,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}