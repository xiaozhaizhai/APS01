package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicProdLevelCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicProdLevelService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_product_ProdLevel,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicProdLevelCxfService")
@Transactional
public class MESBasicProdLevelCxfServiceImpl implements MESBasicProdLevelCxfService {
	
	@Resource
	private MESBasicProdLevelService prodLevelService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public MESBasicProdLevel getProdLevel(long id){
		MESBasicProdLevel prodLevel = prodLevelService.getProdLevel(id);
		return prodLevel;
	}
	
	@Override
	
	public void updateProdLevel(long id, MESBasicProdLevel prodLevel) {
		// TODO Auto-generated method stub
		prodLevel.setId(id);
		prodLevelService.saveProdLevel(prodLevel,null,null,null);
	}

	@Override
	
	public void createProdLevel(MESBasicProdLevel prodLevel) {
		// TODO Auto-generated method stub
		prodLevelService.saveProdLevel(prodLevel,null,null,null);
	}

	@Override
	
	public void deleteProdLevel(long id) {
		// TODO Auto-generated method stub
		MESBasicProdLevel prodLevel = prodLevelService.getProdLevel(id);
		prodLevelService.deleteProdLevel(prodLevel);
	}
	
	@Override
	public ArrayList<MESBasicProdLevel> getProdLevelList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodLevel\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicProdLevel> list = prodLevelService.getProdLevels(customer, customerValue);
		 
		return (ArrayList<MESBasicProdLevel>) list;
	}

	@Override
	
	public void ProdLevelList(ArrayList<MESBasicProdLevel> prodLevels) {
		// TODO Auto-generated method stub
		for(MESBasicProdLevel prodLevel : prodLevels){
			MESBasicProdLevel old = prodLevelService.loadProdLevelByBussinessKey(prodLevel);
			if(old!=null){
				prodLevel.setId(old.getId());
				prodLevel.setVersion(old.getVersion());
			}
			prodLevelService.mergeProdLevel(prodLevel, null,null,null);
		}
	}
	
	@Override
	public Page<MESBasicProdLevel> getProdLevelPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodLevel\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicProdLevel> page = new Page<MESBasicProdLevel>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicProdLevel> list = prodLevelService.getProdLevels(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicProdLevel> getProdLevelPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodLevel\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicProdLevel> page = new Page<MESBasicProdLevel>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicProdLevel> list = prodLevelService.getProdLevels(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_product_ProdLevel,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}