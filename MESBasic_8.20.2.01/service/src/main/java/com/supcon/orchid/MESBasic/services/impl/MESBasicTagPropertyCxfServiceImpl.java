package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicTagPropertyCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicTagPropertyService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicTagProperty;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_tagProperty_TagProperty,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicTagPropertyCxfService")
@Transactional
public class MESBasicTagPropertyCxfServiceImpl implements MESBasicTagPropertyCxfService {
	
	@Resource
	private MESBasicTagPropertyService tagPropertyService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("MESBasic_1_tagProperty_tagList")
	public MESBasicTagProperty getTagProperty(long id){
		MESBasicTagProperty tagProperty = tagPropertyService.getTagProperty(id);
		return tagProperty;
	}
	
	@Override
	@BAPPermission("MESBasic_1_tagProperty_tagList_BUTTON_tagEdit")
	public void updateTagProperty(long id, MESBasicTagProperty tagProperty) {
		// TODO Auto-generated method stub
		tagProperty.setId(id);
		tagPropertyService.saveTagProperty(tagProperty, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	@BAPPermission("MESBasic_1_tagProperty_tagList_BUTTON_tagNew")
	public void createTagProperty(MESBasicTagProperty tagProperty) {
		// TODO Auto-generated method stub
		tagPropertyService.saveTagProperty(tagProperty, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	@BAPPermission("MESBasic_1_tagProperty_tagList_BUTTON_tagDel")
	public void deleteTagProperty(long id) {
		// TODO Auto-generated method stub
		MESBasicTagProperty tagProperty = tagPropertyService.getTagProperty(id);
		tagPropertyService.deleteTagProperty(tagProperty);
	}
	
	@Override
	public ArrayList<MESBasicTagProperty> getTagPropertyList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"tagProperty\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicTagProperty> list = tagPropertyService.getTagPropertys(customer, customerValue);
		 
		return (ArrayList<MESBasicTagProperty>) list;
	}

	@Override
	@BAPPermission("MESBasic_1_tagProperty_tagList_BUTTON_tagNew")
	public void TagPropertyList(ArrayList<MESBasicTagProperty> tagPropertys) {
		// TODO Auto-generated method stub
		for(MESBasicTagProperty tagProperty : tagPropertys){
			MESBasicTagProperty old = tagPropertyService.loadTagPropertyByBussinessKey(tagProperty);
			if(old!=null){
				tagProperty.setId(old.getId());
				tagProperty.setVersion(old.getVersion());
			}
			tagPropertyService.mergeTagProperty(tagProperty, null);
		}
	}
	
	@Override
	public Page<MESBasicTagProperty> getTagPropertyPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"tagProperty\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicTagProperty> page = new Page<MESBasicTagProperty>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicTagProperty> list = tagPropertyService.getTagPropertys(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicTagProperty> getTagPropertyPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"tagProperty\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicTagProperty> page = new Page<MESBasicTagProperty>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicTagProperty> list = tagPropertyService.getTagPropertys(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_tagProperty_TagProperty,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}