package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicMailServerCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicMailServerService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_mailServer_MailServer,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicMailServerCxfService")
@Transactional
public class X6BasicMailServerCxfServiceImpl implements X6BasicMailServerCxfService {
	
	@Resource
	private X6BasicMailServerService mailServerService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_mailServer_list")
	public X6BasicMailServer getMailServer(long id){
		X6BasicMailServer mailServer = mailServerService.getMailServer(id);
		return mailServer;
	}
	
	@Override
	@BAPPermission("X6Basic_1.0_mailServer_list_BUTTON_modify")
	public void updateMailServer(long id, X6BasicMailServer mailServer) {
		// TODO Auto-generated method stub
		mailServer.setId(id);
		mailServerService.saveMailServer(mailServer,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_mailServer_list_BUTTON_add")
	public void createMailServer(X6BasicMailServer mailServer) {
		// TODO Auto-generated method stub
		mailServerService.saveMailServer(mailServer,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_mailServer_list_BUTTON_del")
	public void deleteMailServer(long id) {
		// TODO Auto-generated method stub
		X6BasicMailServer mailServer = mailServerService.getMailServer(id);
		mailServerService.deleteMailServer(mailServer);
	}
	
	@Override
	public ArrayList<X6BasicMailServer> getMailServerList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"mailServer\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicMailServer> list = mailServerService.getMailServers(customer, customerValue);
		 
		return (ArrayList<X6BasicMailServer>) list;
	}

	@Override
	@BAPPermission("X6Basic_1.0_mailServer_list_BUTTON_add")
	public void MailServerList(ArrayList<X6BasicMailServer> mailServers) {
		// TODO Auto-generated method stub
		for(X6BasicMailServer mailServer : mailServers){
			X6BasicMailServer old = mailServerService.loadMailServerByBussinessKey(mailServer);
			if(old!=null){
				mailServer.setId(old.getId());
				mailServer.setVersion(old.getVersion());
			}
			mailServerService.mergeMailServer(mailServer, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicMailServer> getMailServerPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"mailServer\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicMailServer> page = new Page<X6BasicMailServer>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicMailServer> list = mailServerService.getMailServers(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicMailServer> getMailServerPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"mailServer\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicMailServer> page = new Page<X6BasicMailServer>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicMailServer> list = mailServerService.getMailServers(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_mailServer_MailServer,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}