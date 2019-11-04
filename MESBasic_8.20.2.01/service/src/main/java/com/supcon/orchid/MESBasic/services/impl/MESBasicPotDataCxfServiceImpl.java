package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicPotDataCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicPotDataService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_potDataHandler_PotData,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicPotDataCxfService")
@Transactional
public class MESBasicPotDataCxfServiceImpl implements MESBasicPotDataCxfService {
	
	@Resource
	private MESBasicPotDataService potDataService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("MESBasic_1_potDataHandler_dataList")
	public MESBasicPotData getPotData(long id){
		MESBasicPotData potData = potDataService.getPotData(id);
		return potData;
	}
	
	@Override
	@BAPPermission("MESBasic_1_potDataHandler_dataList_BUTTON_dataEdit")
	public void updatePotData(long id, MESBasicPotData potData) {
		// TODO Auto-generated method stub
		potData.setId(id);
		potDataService.savePotData(potData,null,null,null);
	}

	@Override
	@BAPPermission("MESBasic_1_potDataHandler_dataList_BUTTON_dataNew")
	public void createPotData(MESBasicPotData potData) {
		// TODO Auto-generated method stub
		potDataService.savePotData(potData,null,null,null);
	}

	@Override
	@BAPPermission("MESBasic_1_potDataHandler_dataList_BUTTON_dataDel")
	public void deletePotData(long id) {
		// TODO Auto-generated method stub
		MESBasicPotData potData = potDataService.getPotData(id);
		potDataService.deletePotData(potData);
	}
	
	@Override
	public ArrayList<MESBasicPotData> getPotDataList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"potData\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicPotData> list = potDataService.getPotDatas(customer, customerValue);
		 
		return (ArrayList<MESBasicPotData>) list;
	}

	@Override
	@BAPPermission("MESBasic_1_potDataHandler_dataList_BUTTON_dataNew")
	public void PotDataList(ArrayList<MESBasicPotData> potDatas) {
		// TODO Auto-generated method stub
		for(MESBasicPotData potData : potDatas){
			MESBasicPotData old = potDataService.loadPotDataByBussinessKey(potData);
			if(old!=null){
				potData.setId(old.getId());
				potData.setVersion(old.getVersion());
			}
			potDataService.mergePotData(potData, null,null,null);
		}
	}
	
	@Override
	public Page<MESBasicPotData> getPotDataPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"potData\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicPotData> page = new Page<MESBasicPotData>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicPotData> list = potDataService.getPotDatas(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicPotData> getPotDataPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"potData\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicPotData> page = new Page<MESBasicPotData>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicPotData> list = potDataService.getPotDatas(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_potDataHandler_PotData,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}