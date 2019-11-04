package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicDocumentClassesCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicDocumentClassesService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_documentClass_DocumentClasses,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicDocumentClassesCxfService")
@Transactional
public class X6BasicDocumentClassesCxfServiceImpl implements X6BasicDocumentClassesCxfService {
	
	@Resource
	private X6BasicDocumentClassesService documentClassesService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public X6BasicDocumentClasses getDocumentClasses(long id){
		X6BasicDocumentClasses documentClasses = documentClassesService.getDocumentClasses(id);
		return documentClasses;
	}
	
	@Override
	
	public void updateDocumentClasses(long id, X6BasicDocumentClasses documentClasses) {
		// TODO Auto-generated method stub
		documentClasses.setId(id);
		documentClassesService.saveDocumentClasses(documentClasses,null,null,null);
	}

	@Override
	
	public void createDocumentClasses(X6BasicDocumentClasses documentClasses) {
		// TODO Auto-generated method stub
		documentClassesService.saveDocumentClasses(documentClasses,null,null,null);
	}

	@Override
	
	public void deleteDocumentClasses(long id) {
		// TODO Auto-generated method stub
		X6BasicDocumentClasses documentClasses = documentClassesService.getDocumentClasses(id);
		documentClassesService.deleteDocumentClasses(documentClasses);
	}
	
	@Override
	public ArrayList<X6BasicDocumentClasses> getDocumentClassesList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"documentClasses\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicDocumentClasses> list = documentClassesService.getDocumentClassess(customer, customerValue);
		 
		return (ArrayList<X6BasicDocumentClasses>) list;
	}

	@Override
	
	public void DocumentClassesList(ArrayList<X6BasicDocumentClasses> documentClassess) {
		// TODO Auto-generated method stub
		for(X6BasicDocumentClasses documentClasses : documentClassess){
			X6BasicDocumentClasses old = documentClassesService.loadDocumentClassesByBussinessKey(documentClasses);
			if(old!=null){
				documentClasses.setId(old.getId());
				documentClasses.setVersion(old.getVersion());
			}
			documentClassesService.mergeDocumentClasses(documentClasses, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicDocumentClasses> getDocumentClassesPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"documentClasses\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicDocumentClasses> page = new Page<X6BasicDocumentClasses>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicDocumentClasses> list = documentClassesService.getDocumentClassess(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicDocumentClasses> getDocumentClassesPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"documentClasses\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicDocumentClasses> page = new Page<X6BasicDocumentClasses>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicDocumentClasses> list = documentClassesService.getDocumentClassess(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_documentClass_DocumentClasses,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}