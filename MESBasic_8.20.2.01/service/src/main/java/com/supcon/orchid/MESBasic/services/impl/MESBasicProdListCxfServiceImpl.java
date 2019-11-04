package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicProdListCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicProdListService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.MESBasic.entities.MESBasicProdList;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSet;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_prodList_ProdList,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
@Service("mESBasicProdListCxfService")
@Transactional
public class MESBasicProdListCxfServiceImpl implements MESBasicProdListCxfService {
	
	@Resource
	private MESBasicProdListService prodListService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public MESBasicProdList getProdList(long id){
		MESBasicProdList prodList = prodListService.getProdList(id);
		return prodList;
	}
	
	@Override
	
	public void updateProdList(long id, MESBasicProdList prodList) {
		// TODO Auto-generated method stub
		prodList.setId(id);
		prodListService.saveProdList(prodList, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	
	public void createProdList(MESBasicProdList prodList) {
		// TODO Auto-generated method stub
		prodListService.saveProdList(prodList, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	
	public void deleteProdList(long id) {
		// TODO Auto-generated method stub
		MESBasicProdList prodList = prodListService.getProdList(id);
		prodListService.deleteProdList(prodList);
	}
	
	@Override
	public ArrayList<MESBasicProdList> getProdListList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodList\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicProdList> list = prodListService.getProdLists(customer, customerValue);
		 
		return (ArrayList<MESBasicProdList>) list;
	}

	@Override
	
	public void ProdListList(ArrayList<MESBasicProdList> prodLists) {
		// TODO Auto-generated method stub
		for(MESBasicProdList prodList : prodLists){
			MESBasicProdList old = prodListService.loadProdListByBussinessKey(prodList);
			if(old!=null){
				prodList.setId(old.getId());
				prodList.setVersion(old.getVersion());
			}
			prodListService.mergeProdList(prodList, null);
		}
	}
	
	@Override
	public Page<MESBasicProdList> getProdListPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodList\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicProdList> page = new Page<MESBasicProdList>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicProdList> list = prodListService.getProdLists(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicProdList> getProdListPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodList\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicProdList> page = new Page<MESBasicProdList>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicProdList> list = prodListService.getProdLists(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_prodList_ProdList,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}