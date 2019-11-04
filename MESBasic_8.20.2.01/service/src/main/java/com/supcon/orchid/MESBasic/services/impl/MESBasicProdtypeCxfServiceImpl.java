package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicProdtypeCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicProdtypeService;
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
import com.supcon.orchid.MESBasic.entities.MESBasicProdtype;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
@Service("mESBasicProdtypeCxfService")
@Transactional
public class MESBasicProdtypeCxfServiceImpl implements MESBasicProdtypeCxfService {
	
	@Resource
	private MESBasicProdtypeService prodtypeService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("MESBasic_1_prodtype_ptlist")
	public MESBasicProdtype getProdtype(long id){
		MESBasicProdtype prodtype = prodtypeService.getProdtype(id);
		return prodtype;
	}
	
	@Override
	@BAPPermission("MESBasic_1_prodtype_ptlist_BUTTON_btnupdate")
	public void updateProdtype(long id, MESBasicProdtype prodtype) {
		// TODO Auto-generated method stub
		prodtype.setId(id);
		prodtypeService.saveProdtype(prodtype, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	@BAPPermission("MESBasic_1_prodtype_ptlist_BUTTON_btnadd")
	public void createProdtype(MESBasicProdtype prodtype) {
		// TODO Auto-generated method stub
		prodtypeService.saveProdtype(prodtype, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	@BAPPermission("MESBasic_1_prodtype_ptlist_BUTTON_btndelete")
	public void deleteProdtype(long id) {
		// TODO Auto-generated method stub
		MESBasicProdtype prodtype = prodtypeService.getProdtype(id);
		prodtypeService.deleteProdtype(prodtype);
	}
	
	@Override
	public ArrayList<MESBasicProdtype> getProdtypeList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodtype\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicProdtype> list = prodtypeService.getProdtypes(customer, customerValue);
		 
		return (ArrayList<MESBasicProdtype>) list;
	}

	@Override
	@BAPPermission("MESBasic_1_prodtype_ptlist_BUTTON_btnadd")
	public void ProdtypeList(ArrayList<MESBasicProdtype> prodtypes) {
		// TODO Auto-generated method stub
		for(MESBasicProdtype prodtype : prodtypes){
			MESBasicProdtype old = prodtypeService.loadProdtypeByBussinessKey(prodtype);
			if(old!=null){
				prodtype.setId(old.getId());
				prodtype.setVersion(old.getVersion());
			}
			prodtypeService.mergeProdtype(prodtype, null);
		}
	}
	
	@Override
	public Page<MESBasicProdtype> getProdtypePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodtype\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicProdtype> page = new Page<MESBasicProdtype>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicProdtype> list = prodtypeService.getProdtypes(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicProdtype> getProdtypePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"prodtype\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicProdtype> page = new Page<MESBasicProdtype>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicProdtype> list = prodtypeService.getProdtypes(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}