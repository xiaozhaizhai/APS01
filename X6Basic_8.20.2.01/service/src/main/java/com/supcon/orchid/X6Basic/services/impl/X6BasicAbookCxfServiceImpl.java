package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicAbookCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicAbookService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_addressBook_Abook,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicAbookCxfService")
@Transactional
public class X6BasicAbookCxfServiceImpl implements X6BasicAbookCxfService {
	
	@Resource
	private X6BasicAbookService abookService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public X6BasicAbook getAbook(long id){
		X6BasicAbook abook = abookService.getAbook(id);
		return abook;
	}
	
	@Override
	
	public void updateAbook(long id, X6BasicAbook abook) {
		// TODO Auto-generated method stub
		abook.setId(id);
		abookService.saveAbook(abook,null,null,null);
	}

	@Override
	
	public void createAbook(X6BasicAbook abook) {
		// TODO Auto-generated method stub
		abookService.saveAbook(abook,null,null,null);
	}

	@Override
	
	public void deleteAbook(long id) {
		// TODO Auto-generated method stub
		X6BasicAbook abook = abookService.getAbook(id);
		abookService.deleteAbook(abook);
	}
	
	@Override
	public ArrayList<X6BasicAbook> getAbookList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"abook\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicAbook> list = abookService.getAbooks(customer, customerValue);
		 
		return (ArrayList<X6BasicAbook>) list;
	}

	@Override
	
	public void AbookList(ArrayList<X6BasicAbook> abooks) {
		// TODO Auto-generated method stub
		for(X6BasicAbook abook : abooks){
			X6BasicAbook old = abookService.loadAbookByBussinessKey(abook);
			if(old!=null){
				abook.setId(old.getId());
				abook.setVersion(old.getVersion());
			}
			abookService.mergeAbook(abook, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicAbook> getAbookPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"abook\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicAbook> page = new Page<X6BasicAbook>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicAbook> list = abookService.getAbooks(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicAbook> getAbookPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"abook\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicAbook> page = new Page<X6BasicAbook>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicAbook> list = abookService.getAbooks(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_addressBook_Abook,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}