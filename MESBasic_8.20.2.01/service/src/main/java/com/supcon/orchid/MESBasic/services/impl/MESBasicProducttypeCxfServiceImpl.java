package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicProducttypeCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicProducttypeService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicProducttype;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_product_type_Producttype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
@Service("mESBasicProducttypeCxfService")
@Transactional
public class MESBasicProducttypeCxfServiceImpl implements MESBasicProducttypeCxfService {
	
	@Resource
	private MESBasicProducttypeService producttypeService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("MESBasic_1_product_type_list")
	public MESBasicProducttype getProducttype(long id){
		MESBasicProducttype producttype = producttypeService.getProducttype(id);
		return producttype;
	}
	
	@Override
	@BAPPermission("MESBasic_1_product_type_list_BUTTON_btnupdate")
	public void updateProducttype(long id, MESBasicProducttype producttype) {
		// TODO Auto-generated method stub
		producttype.setId(id);
		producttypeService.saveProducttype(producttype, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	@BAPPermission("MESBasic_1_product_type_list_BUTTON_addbtn")
	public void createProducttype(MESBasicProducttype producttype) {
		// TODO Auto-generated method stub
		producttypeService.saveProducttype(producttype, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	@BAPPermission("MESBasic_1_product_type_list_BUTTON_btndelete")
	public void deleteProducttype(long id) {
		// TODO Auto-generated method stub
		MESBasicProducttype producttype = producttypeService.getProducttype(id);
		producttypeService.deleteProducttype(producttype);
	}
	
	@Override
	public ArrayList<MESBasicProducttype> getProducttypeList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"producttype\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicProducttype> list = producttypeService.getProducttypes(customer, customerValue);
		 
		return (ArrayList<MESBasicProducttype>) list;
	}

	@Override
	@BAPPermission("MESBasic_1_product_type_list_BUTTON_addbtn")
	public void ProducttypeList(ArrayList<MESBasicProducttype> producttypes) {
		// TODO Auto-generated method stub
		for(MESBasicProducttype producttype : producttypes){
			MESBasicProducttype old = producttypeService.loadProducttypeByBussinessKey(producttype);
			if(old!=null){
				producttype.setId(old.getId());
				producttype.setVersion(old.getVersion());
			}
			producttypeService.mergeProducttype(producttype, null);
		}
	}
	
	@Override
	public Page<MESBasicProducttype> getProducttypePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"producttype\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicProducttype> page = new Page<MESBasicProducttype>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicProducttype> list = producttypeService.getProducttypes(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicProducttype> getProducttypePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"producttype\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicProducttype> page = new Page<MESBasicProducttype>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicProducttype> list = producttypeService.getProducttypes(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_product_type_Producttype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}