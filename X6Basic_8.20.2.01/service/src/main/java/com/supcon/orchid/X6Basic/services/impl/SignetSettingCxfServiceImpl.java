package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.SignetSettingCxfService;
import com.supcon.orchid.X6Basic.services.SignetSettingService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("signetSettingCxfService")
@Transactional
public class SignetSettingCxfServiceImpl implements SignetSettingCxfService {
	
	@Resource
	private SignetSettingService signetSettingService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public SignetSetting getSignetSetting(long id){
		SignetSetting signetSetting = signetSettingService.getSignetSetting(id);
		return signetSetting;
	}
	
	@Override
	
	public void updateSignetSetting(long id, SignetSetting signetSetting) {
		// TODO Auto-generated method stub
		signetSetting.setId(id);
		signetSettingService.saveSignetSetting(signetSetting,null,null,null);
	}

	@Override
	
	public void createSignetSetting(SignetSetting signetSetting) {
		// TODO Auto-generated method stub
		signetSettingService.saveSignetSetting(signetSetting,null,null,null);
	}

	@Override
	
	public void deleteSignetSetting(long id) {
		// TODO Auto-generated method stub
		SignetSetting signetSetting = signetSettingService.getSignetSetting(id);
		signetSettingService.deleteSignetSetting(signetSetting);
	}
	
	@Override
	public ArrayList<SignetSetting> getSignetSettingList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"signetSetting\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<SignetSetting> list = signetSettingService.getSignetSettings(customer, customerValue);
		 
		return (ArrayList<SignetSetting>) list;
	}

	@Override
	
	public void SignetSettingList(ArrayList<SignetSetting> signetSettings) {
		// TODO Auto-generated method stub
		for(SignetSetting signetSetting : signetSettings){
			SignetSetting old = signetSettingService.loadSignetSettingByBussinessKey(signetSetting);
			if(old!=null){
				signetSetting.setId(old.getId());
				signetSetting.setVersion(old.getVersion());
			}
			signetSettingService.mergeSignetSetting(signetSetting, null,null,null);
		}
	}
	
	@Override
	public Page<SignetSetting> getSignetSettingPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"signetSetting\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<SignetSetting> page = new Page<SignetSetting>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<SignetSetting> list = signetSettingService.getSignetSettings(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<SignetSetting> getSignetSettingPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"signetSetting\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<SignetSetting> page = new Page<SignetSetting>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<SignetSetting> list = signetSettingService.getSignetSettings(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_signetManage_SignetSetting,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}