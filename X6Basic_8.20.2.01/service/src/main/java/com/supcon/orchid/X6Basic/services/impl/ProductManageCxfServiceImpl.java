package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.ProductManageCxfService;
import com.supcon.orchid.X6Basic.services.ProductManageService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriod;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriodPart;
import com.supcon.orchid.X6Basic.entities.X6BasicAbook;
import com.supcon.orchid.X6Basic.entities.AttMachine;
import com.supcon.orchid.X6Basic.entities.ProductManage;
import com.supcon.orchid.X6Basic.entities.X6BasicDocumentClasses;
import com.supcon.orchid.X6Basic.entities.X6BasicSignature;
import com.supcon.orchid.X6Basic.entities.X6BasicMailServer;
import com.supcon.orchid.X6Basic.entities.MeetingRoom;
import com.supcon.orchid.X6Basic.entities.UsedRecord;
import com.supcon.orchid.X6Basic.entities.MessageCenter;
import com.supcon.orchid.X6Basic.entities.X6BasicPlanDaily;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlan;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlanPart;
import com.supcon.orchid.X6Basic.entities.SignetSetting;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRule;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRulePart;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncConfigs;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncLog;
import com.supcon.orchid.X6Basic.entities.X6BasicTeamInfo;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegion;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegionPar;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
import com.supcon.orchid.X6Basic.entities.X6BasicUnitGroups;
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_baseProduct_ProductManage,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("productManageCxfService")
@Transactional
public class ProductManageCxfServiceImpl implements ProductManageCxfService {
	
	@Resource
	private ProductManageService productManageService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_baseProduct_list")
	public ProductManage getProductManage(long id){
		ProductManage productManage = productManageService.getProductManage(id);
		return productManage;
	}
	
	@Override
	@BAPPermission("X6Basic_1.0_baseProduct_list_BUTTON_modify")
	public void updateProductManage(long id, ProductManage productManage) {
		// TODO Auto-generated method stub
		productManage.setId(id);
		productManageService.saveProductManage(productManage,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_baseProduct_list_BUTTON_add")
	public void createProductManage(ProductManage productManage) {
		// TODO Auto-generated method stub
		productManageService.saveProductManage(productManage,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_baseProduct_list_BUTTON_delete")
	public void deleteProductManage(long id) {
		// TODO Auto-generated method stub
		ProductManage productManage = productManageService.getProductManage(id);
		productManageService.deleteProductManage(productManage);
	}
	
	@Override
	public ArrayList<ProductManage> getProductManageList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"productManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<ProductManage> list = productManageService.getProductManages(customer, customerValue);
		 
		return (ArrayList<ProductManage>) list;
	}

	@Override
	@BAPPermission("X6Basic_1.0_baseProduct_list_BUTTON_add")
	public void ProductManageList(ArrayList<ProductManage> productManages) {
		// TODO Auto-generated method stub
		for(ProductManage productManage : productManages){
			ProductManage old = productManageService.loadProductManageByBussinessKey(productManage);
			if(old!=null){
				productManage.setId(old.getId());
				productManage.setVersion(old.getVersion());
			}
			productManageService.mergeProductManage(productManage, null,null,null);
		}
	}
	
	@Override
	public Page<ProductManage> getProductManagePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"productManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<ProductManage> page = new Page<ProductManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<ProductManage> list = productManageService.getProductManages(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<ProductManage> getProductManagePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"productManage\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<ProductManage> page = new Page<ProductManage>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<ProductManage> list = productManageService.getProductManages(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_baseProduct_ProductManage,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}