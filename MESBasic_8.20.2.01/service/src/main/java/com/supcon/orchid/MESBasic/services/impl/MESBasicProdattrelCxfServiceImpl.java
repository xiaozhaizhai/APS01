package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicProdattrelCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicProdattrelService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_prodatriel_Prodattrel,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicProdattrelCxfService")
@Transactional
public class MESBasicProdattrelCxfServiceImpl implements MESBasicProdattrelCxfService {
	
	@Resource
	private MESBasicProdattrelService prodattrelService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public MESBasicProdattrel getProdattrel(long id){
		MESBasicProdattrel prodattrel = prodattrelService.getProdattrel(id);
		return prodattrel;
	}
	
	@Override
	
	public void updateProdattrel(long id, MESBasicProdattrel prodattrel) {
		// TODO Auto-generated method stub
		prodattrel.setId(id);
		prodattrelService.saveProdattrel(prodattrel,null,null,null);
	}

	@Override
	
	public void createProdattrel(MESBasicProdattrel prodattrel) {
		// TODO Auto-generated method stub
		prodattrelService.saveProdattrel(prodattrel,null,null,null);
	}

	@Override
	
	public void deleteProdattrel(long id) {
		// TODO Auto-generated method stub
		MESBasicProdattrel prodattrel = prodattrelService.getProdattrel(id);
		prodattrelService.deleteProdattrel(prodattrel);
	}
	
	@Override
	public ArrayList<MESBasicProdattrel> getProdattrelList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodattrel\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicProdattrel> list = prodattrelService.getProdattrels(customer, customerValue);
		 
		return (ArrayList<MESBasicProdattrel>) list;
	}

	@Override
	
	public void ProdattrelList(ArrayList<MESBasicProdattrel> prodattrels) {
		// TODO Auto-generated method stub
		for(MESBasicProdattrel prodattrel : prodattrels){
			MESBasicProdattrel old = prodattrelService.loadProdattrelByBussinessKey(prodattrel);
			if(old!=null){
				prodattrel.setId(old.getId());
				prodattrel.setVersion(old.getVersion());
			}
			prodattrelService.mergeProdattrel(prodattrel, null,null,null);
		}
	}
	
	@Override
	public Page<MESBasicProdattrel> getProdattrelPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodattrel\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicProdattrel> page = new Page<MESBasicProdattrel>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicProdattrel> list = prodattrelService.getProdattrels(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicProdattrel> getProdattrelPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodattrel\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicProdattrel> page = new Page<MESBasicProdattrel>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicProdattrel> list = prodattrelService.getProdattrels(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_prodatriel_Prodattrel,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}