package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicPositionDealCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicPositionDealService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_factoryModel_PositionDeal,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicPositionDealCxfService")
@Transactional
public class MESBasicPositionDealCxfServiceImpl implements MESBasicPositionDealCxfService {
	
	@Resource
	private MESBasicPositionDealService positionDealService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public MESBasicPositionDeal getPositionDeal(long id){
		MESBasicPositionDeal positionDeal = positionDealService.getPositionDeal(id);
		return positionDeal;
	}
	
	@Override
	
	public void updatePositionDeal(long id, MESBasicPositionDeal positionDeal) {
		// TODO Auto-generated method stub
		positionDeal.setId(id);
		positionDealService.savePositionDeal(positionDeal,null,null,null);
	}

	@Override
	
	public void createPositionDeal(MESBasicPositionDeal positionDeal) {
		// TODO Auto-generated method stub
		positionDealService.savePositionDeal(positionDeal,null,null,null);
	}

	@Override
	
	public void deletePositionDeal(long id) {
		// TODO Auto-generated method stub
		MESBasicPositionDeal positionDeal = positionDealService.getPositionDeal(id);
		positionDealService.deletePositionDeal(positionDeal);
	}
	
	@Override
	public ArrayList<MESBasicPositionDeal> getPositionDealList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"positionDeal\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicPositionDeal> list = positionDealService.getPositionDeals(customer, customerValue);
		 
		return (ArrayList<MESBasicPositionDeal>) list;
	}

	@Override
	
	public void PositionDealList(ArrayList<MESBasicPositionDeal> positionDeals) {
		// TODO Auto-generated method stub
		for(MESBasicPositionDeal positionDeal : positionDeals){
			MESBasicPositionDeal old = positionDealService.loadPositionDealByBussinessKey(positionDeal);
			if(old!=null){
				positionDeal.setId(old.getId());
				positionDeal.setVersion(old.getVersion());
			}
			positionDealService.mergePositionDeal(positionDeal, null,null,null);
		}
	}
	
	@Override
	public Page<MESBasicPositionDeal> getPositionDealPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"positionDeal\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicPositionDeal> page = new Page<MESBasicPositionDeal>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicPositionDeal> list = positionDealService.getPositionDeals(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicPositionDeal> getPositionDealPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"positionDeal\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicPositionDeal> page = new Page<MESBasicPositionDeal>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicPositionDeal> list = positionDealService.getPositionDeals(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_factoryModel_PositionDeal,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}