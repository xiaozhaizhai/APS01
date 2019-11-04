package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicEquipmentCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicEquipmentService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_equipManage_Equipment,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicEquipmentCxfService")
@Transactional
public class MESBasicEquipmentCxfServiceImpl implements MESBasicEquipmentCxfService {
	
	@Resource
	private MESBasicEquipmentService equipmentService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("MESBasic_1_equipManage_list")
	public MESBasicEquipment getEquipment(long id){
		MESBasicEquipment equipment = equipmentService.getEquipment(id);
		return equipment;
	}
	
	@Override
	@BAPPermission("MESBasic_1_equipManage_list_BUTTON_modify")
	public void updateEquipment(long id, MESBasicEquipment equipment) {
		// TODO Auto-generated method stub
		equipment.setId(id);
		equipmentService.saveEquipment(equipment,null,null,null);
	}

	@Override
	@BAPPermission("MESBasic_1_equipManage_list_BUTTON_add")
	public void createEquipment(MESBasicEquipment equipment) {
		// TODO Auto-generated method stub
		equipmentService.saveEquipment(equipment,null,null,null);
	}

	@Override
	@BAPPermission("MESBasic_1_equipManage_list_BUTTON_delete")
	public void deleteEquipment(long id) {
		// TODO Auto-generated method stub
		MESBasicEquipment equipment = equipmentService.getEquipment(id);
		equipmentService.deleteEquipment(equipment);
	}
	
	@Override
	public ArrayList<MESBasicEquipment> getEquipmentList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"equipment\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicEquipment> list = equipmentService.getEquipments(customer, customerValue);
		 
		return (ArrayList<MESBasicEquipment>) list;
	}

	@Override
	@BAPPermission("MESBasic_1_equipManage_list_BUTTON_add")
	public void EquipmentList(ArrayList<MESBasicEquipment> equipments) {
		// TODO Auto-generated method stub
		for(MESBasicEquipment equipment : equipments){
			MESBasicEquipment old = equipmentService.loadEquipmentByBussinessKey(equipment);
			if(old!=null){
				equipment.setId(old.getId());
				equipment.setVersion(old.getVersion());
			}
			equipmentService.mergeEquipment(equipment, null,null,null);
		}
	}
	
	@Override
	public Page<MESBasicEquipment> getEquipmentPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"equipment\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicEquipment> page = new Page<MESBasicEquipment>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicEquipment> list = equipmentService.getEquipments(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicEquipment> getEquipmentPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"equipment\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicEquipment> page = new Page<MESBasicEquipment>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicEquipment> list = equipmentService.getEquipments(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_equipManage_Equipment,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}