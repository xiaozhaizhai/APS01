package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.MessageCenterCxfService;
import com.supcon.orchid.X6Basic.services.MessageCenterService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_messageManage_MessageCenter,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("messageCenterCxfService")
@Transactional
public class MessageCenterCxfServiceImpl implements MessageCenterCxfService {
	
	@Resource
	private MessageCenterService messageCenterService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public MessageCenter getMessageCenter(long id){
		MessageCenter messageCenter = messageCenterService.getMessageCenter(id);
		return messageCenter;
	}
	
	@Override
	
	public void updateMessageCenter(long id, MessageCenter messageCenter) {
		// TODO Auto-generated method stub
		messageCenter.setId(id);
		messageCenterService.saveMessageCenter(messageCenter,null,null,null);
	}

	@Override
	
	public void createMessageCenter(MessageCenter messageCenter) {
		// TODO Auto-generated method stub
		messageCenterService.saveMessageCenter(messageCenter,null,null,null);
	}

	@Override
	
	public void deleteMessageCenter(long id) {
		// TODO Auto-generated method stub
		MessageCenter messageCenter = messageCenterService.getMessageCenter(id);
		messageCenterService.deleteMessageCenter(messageCenter);
	}
	
	@Override
	public ArrayList<MessageCenter> getMessageCenterList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"messageCenter\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MessageCenter> list = messageCenterService.getMessageCenters(customer, customerValue);
		 
		return (ArrayList<MessageCenter>) list;
	}

	@Override
	
	public void MessageCenterList(ArrayList<MessageCenter> messageCenters) {
		// TODO Auto-generated method stub
		for(MessageCenter messageCenter : messageCenters){
			MessageCenter old = messageCenterService.loadMessageCenterByBussinessKey(messageCenter);
			if(old!=null){
				messageCenter.setId(old.getId());
				messageCenter.setVersion(old.getVersion());
			}
			messageCenterService.mergeMessageCenter(messageCenter, null,null,null);
		}
	}
	
	@Override
	public Page<MessageCenter> getMessageCenterPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"messageCenter\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MessageCenter> page = new Page<MessageCenter>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MessageCenter> list = messageCenterService.getMessageCenters(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MessageCenter> getMessageCenterPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"messageCenter\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MessageCenter> page = new Page<MessageCenter>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MessageCenter> list = messageCenterService.getMessageCenters(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_messageManage_MessageCenter,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}