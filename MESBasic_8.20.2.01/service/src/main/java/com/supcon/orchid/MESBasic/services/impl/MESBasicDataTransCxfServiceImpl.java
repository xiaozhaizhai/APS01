package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicDataTransCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicDataTransService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_thirdDataHandler_DataTrans,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicDataTransCxfService")
@Transactional
public class MESBasicDataTransCxfServiceImpl implements MESBasicDataTransCxfService {
	
	@Resource
	private MESBasicDataTransService dataTransService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("MESBasic_1_thirdDataHandler_dataList")
	public MESBasicDataTrans getDataTrans(long id){
		MESBasicDataTrans dataTrans = dataTransService.getDataTrans(id);
		return dataTrans;
	}
	
	@Override
	@BAPPermission("MESBasic_1_thirdDataHandler_dataList_BUTTON_dataEdit")
	public void updateDataTrans(long id, MESBasicDataTrans dataTrans) {
		// TODO Auto-generated method stub
		dataTrans.setId(id);
		dataTransService.saveDataTrans(dataTrans,null,null,null);
	}

	@Override
	@BAPPermission("MESBasic_1_thirdDataHandler_dataList_BUTTON_dataNew")
	public void createDataTrans(MESBasicDataTrans dataTrans) {
		// TODO Auto-generated method stub
		dataTransService.saveDataTrans(dataTrans,null,null,null);
	}

	@Override
	@BAPPermission("MESBasic_1_thirdDataHandler_dataList_BUTTON_dataDel")
	public void deleteDataTrans(long id) {
		// TODO Auto-generated method stub
		MESBasicDataTrans dataTrans = dataTransService.getDataTrans(id);
		dataTransService.deleteDataTrans(dataTrans);
	}
	
	@Override
	public ArrayList<MESBasicDataTrans> getDataTransList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"dataTrans\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicDataTrans> list = dataTransService.getDataTranss(customer, customerValue);
		 
		return (ArrayList<MESBasicDataTrans>) list;
	}

	@Override
	@BAPPermission("MESBasic_1_thirdDataHandler_dataList_BUTTON_dataNew")
	public void DataTransList(ArrayList<MESBasicDataTrans> dataTranss) {
		// TODO Auto-generated method stub
		for(MESBasicDataTrans dataTrans : dataTranss){
			MESBasicDataTrans old = dataTransService.loadDataTransByBussinessKey(dataTrans);
			if(old!=null){
				dataTrans.setId(old.getId());
				dataTrans.setVersion(old.getVersion());
			}
			dataTransService.mergeDataTrans(dataTrans, null,null,null);
		}
	}
	
	@Override
	public Page<MESBasicDataTrans> getDataTransPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"dataTrans\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicDataTrans> page = new Page<MESBasicDataTrans>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicDataTrans> list = dataTransService.getDataTranss(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicDataTrans> getDataTransPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"dataTrans\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicDataTrans> page = new Page<MESBasicDataTrans>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicDataTrans> list = dataTransService.getDataTranss(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_thirdDataHandler_DataTrans,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}