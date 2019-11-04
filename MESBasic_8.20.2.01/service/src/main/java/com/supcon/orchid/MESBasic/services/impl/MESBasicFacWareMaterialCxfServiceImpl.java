package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicFacWareMaterialCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicFacWareMaterialService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_factoryWare_FacWareMaterial,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicFacWareMaterialCxfService")
@Transactional
public class MESBasicFacWareMaterialCxfServiceImpl implements MESBasicFacWareMaterialCxfService {
	
	@Resource
	private MESBasicFacWareMaterialService facWareMaterialService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public MESBasicFacWareMaterial getFacWareMaterial(long id){
		MESBasicFacWareMaterial facWareMaterial = facWareMaterialService.getFacWareMaterial(id);
		return facWareMaterial;
	}
	
	@Override
	
	public void updateFacWareMaterial(long id, MESBasicFacWareMaterial facWareMaterial) {
		// TODO Auto-generated method stub
		facWareMaterial.setId(id);
		facWareMaterialService.saveFacWareMaterial(facWareMaterial,null,null,null);
	}

	@Override
	
	public void createFacWareMaterial(MESBasicFacWareMaterial facWareMaterial) {
		// TODO Auto-generated method stub
		facWareMaterialService.saveFacWareMaterial(facWareMaterial,null,null,null);
	}

	@Override
	
	public void deleteFacWareMaterial(long id) {
		// TODO Auto-generated method stub
		MESBasicFacWareMaterial facWareMaterial = facWareMaterialService.getFacWareMaterial(id);
		facWareMaterialService.deleteFacWareMaterial(facWareMaterial);
	}
	
	@Override
	public ArrayList<MESBasicFacWareMaterial> getFacWareMaterialList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"facWareMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicFacWareMaterial> list = facWareMaterialService.getFacWareMaterials(customer, customerValue);
		 
		return (ArrayList<MESBasicFacWareMaterial>) list;
	}

	@Override
	
	public void FacWareMaterialList(ArrayList<MESBasicFacWareMaterial> facWareMaterials) {
		// TODO Auto-generated method stub
		for(MESBasicFacWareMaterial facWareMaterial : facWareMaterials){
			MESBasicFacWareMaterial old = facWareMaterialService.loadFacWareMaterialByBussinessKey(facWareMaterial);
			if(old!=null){
				facWareMaterial.setId(old.getId());
				facWareMaterial.setVersion(old.getVersion());
			}
			facWareMaterialService.mergeFacWareMaterial(facWareMaterial, null,null,null);
		}
	}
	
	@Override
	public Page<MESBasicFacWareMaterial> getFacWareMaterialPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"facWareMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicFacWareMaterial> page = new Page<MESBasicFacWareMaterial>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicFacWareMaterial> list = facWareMaterialService.getFacWareMaterials(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicFacWareMaterial> getFacWareMaterialPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"facWareMaterial\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicFacWareMaterial> page = new Page<MESBasicFacWareMaterial>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicFacWareMaterial> list = facWareMaterialService.getFacWareMaterials(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_factoryWare_FacWareMaterial,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}