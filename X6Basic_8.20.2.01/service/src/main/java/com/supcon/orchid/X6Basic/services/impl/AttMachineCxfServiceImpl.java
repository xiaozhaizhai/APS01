package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.AttMachineCxfService;
import com.supcon.orchid.X6Basic.services.AttMachineService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_attMachine_AttMachine,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("attMachineCxfService")
@Transactional
public class AttMachineCxfServiceImpl implements AttMachineCxfService {
	
	@Resource
	private AttMachineService attMachineService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_attMachine_list")
	public AttMachine getAttMachine(long id){
		AttMachine attMachine = attMachineService.getAttMachine(id);
		return attMachine;
	}
	
	@Override
	@BAPPermission("X6Basic_1.0_attMachine_list_BUTTON_modify")
	public void updateAttMachine(long id, AttMachine attMachine) {
		// TODO Auto-generated method stub
		attMachine.setId(id);
		attMachineService.saveAttMachine(attMachine,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_attMachine_list_BUTTON_add")
	public void createAttMachine(AttMachine attMachine) {
		// TODO Auto-generated method stub
		attMachineService.saveAttMachine(attMachine,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_attMachine_list_BUTTON_delete")
	public void deleteAttMachine(long id) {
		// TODO Auto-generated method stub
		AttMachine attMachine = attMachineService.getAttMachine(id);
		attMachineService.deleteAttMachine(attMachine);
	}
	
	@Override
	public ArrayList<AttMachine> getAttMachineList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"attMachine\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<AttMachine> list = attMachineService.getAttMachines(customer, customerValue);
		 
		return (ArrayList<AttMachine>) list;
	}

	@Override
	@BAPPermission("X6Basic_1.0_attMachine_list_BUTTON_add")
	public void AttMachineList(ArrayList<AttMachine> attMachines) {
		// TODO Auto-generated method stub
		for(AttMachine attMachine : attMachines){
			AttMachine old = attMachineService.loadAttMachineByBussinessKey(attMachine);
			if(old!=null){
				attMachine.setId(old.getId());
				attMachine.setVersion(old.getVersion());
			}
			attMachineService.mergeAttMachine(attMachine, null,null,null);
		}
	}
	
	@Override
	public Page<AttMachine> getAttMachinePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"attMachine\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<AttMachine> page = new Page<AttMachine>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<AttMachine> list = attMachineService.getAttMachines(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<AttMachine> getAttMachinePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"attMachine\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<AttMachine> page = new Page<AttMachine>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<AttMachine> list = attMachineService.getAttMachines(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_attMachine_AttMachine,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}