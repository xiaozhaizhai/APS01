package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicTeamInfoCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicTeamInfoService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_teamManage_TeamInfo,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicTeamInfoCxfService")
@Transactional
public class X6BasicTeamInfoCxfServiceImpl implements X6BasicTeamInfoCxfService {
	
	@Resource
	private X6BasicTeamInfoService teamInfoService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_teamManage_list")
	public X6BasicTeamInfo getTeamInfo(long id){
		X6BasicTeamInfo teamInfo = teamInfoService.getTeamInfo(id);
		return teamInfo;
	}
	
	@Override
	@BAPPermission("X6Basic_1.0_teamManage_list_BUTTON_edit")
	public void updateTeamInfo(long id, X6BasicTeamInfo teamInfo) {
		// TODO Auto-generated method stub
		teamInfo.setId(id);
		teamInfoService.saveTeamInfo(teamInfo,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_teamManage_list_BUTTON_new")
	public void createTeamInfo(X6BasicTeamInfo teamInfo) {
		// TODO Auto-generated method stub
		teamInfoService.saveTeamInfo(teamInfo,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_teamManage_list_BUTTON_delete")
	public void deleteTeamInfo(long id) {
		// TODO Auto-generated method stub
		X6BasicTeamInfo teamInfo = teamInfoService.getTeamInfo(id);
		teamInfoService.deleteTeamInfo(teamInfo);
	}
	
	@Override
	public ArrayList<X6BasicTeamInfo> getTeamInfoList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"teamInfo\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicTeamInfo> list = teamInfoService.getTeamInfos(customer, customerValue);
		 
		return (ArrayList<X6BasicTeamInfo>) list;
	}

	@Override
	@BAPPermission("X6Basic_1.0_teamManage_list_BUTTON_new")
	public void TeamInfoList(ArrayList<X6BasicTeamInfo> teamInfos) {
		// TODO Auto-generated method stub
		for(X6BasicTeamInfo teamInfo : teamInfos){
			X6BasicTeamInfo old = teamInfoService.loadTeamInfoByBussinessKey(teamInfo);
			if(old!=null){
				teamInfo.setId(old.getId());
				teamInfo.setVersion(old.getVersion());
			}
			teamInfoService.mergeTeamInfo(teamInfo, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicTeamInfo> getTeamInfoPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"teamInfo\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicTeamInfo> page = new Page<X6BasicTeamInfo>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicTeamInfo> list = teamInfoService.getTeamInfos(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicTeamInfo> getTeamInfoPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"teamInfo\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicTeamInfo> page = new Page<X6BasicTeamInfo>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicTeamInfo> list = teamInfoService.getTeamInfos(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_teamManage_TeamInfo,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}