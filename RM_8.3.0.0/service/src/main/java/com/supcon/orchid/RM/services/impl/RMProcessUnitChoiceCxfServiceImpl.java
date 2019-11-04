package com.supcon.orchid.RM.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.RM.services.RMProcessUnitChoiceCxfService;
import com.supcon.orchid.RM.services.RMProcessUnitChoiceService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.RM.entities.RMFormulaChange;
import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.RMFormulaBeforeProcess;
import com.supcon.orchid.RM.entities.RMFormulaBom;
import com.supcon.orchid.RM.entities.RMFormulaMixtureActive;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.entities.RMFormulaType;
import com.supcon.orchid.RM.entities.RMFactoryMapOther;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.entities.RMPickSite;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.RM.entities.RMLineFormula;
import com.supcon.orchid.RM.entities.RMProcessPoint;
import com.supcon.orchid.RM.entities.RMProcessUnit;
import com.supcon.orchid.RM.entities.RMProcessUnitChoice;
import com.supcon.orchid.RM.entities.RMTestProj;
/* CUSTOM CODE START(cxfserviceimpl,import,RM_7.5.0.0_suitedLine_ProcessUnitChoice,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("rMProcessUnitChoiceCxfService")
@Transactional
public class RMProcessUnitChoiceCxfServiceImpl implements RMProcessUnitChoiceCxfService {
	
	@Resource
	private RMProcessUnitChoiceService processUnitChoiceService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	
	public RMProcessUnitChoice getProcessUnitChoice(long id){
		RMProcessUnitChoice processUnitChoice = processUnitChoiceService.getProcessUnitChoice(id);
		return processUnitChoice;
	}
	
	@Override
	
	public void updateProcessUnitChoice(long id, RMProcessUnitChoice processUnitChoice) {
		// TODO Auto-generated method stub
		processUnitChoice.setId(id);
		processUnitChoiceService.saveProcessUnitChoice(processUnitChoice,null,null,null);
	}

	@Override
	
	public void createProcessUnitChoice(RMProcessUnitChoice processUnitChoice) {
		// TODO Auto-generated method stub
		processUnitChoiceService.saveProcessUnitChoice(processUnitChoice,null,null,null);
	}

	@Override
	
	public void deleteProcessUnitChoice(long id) {
		// TODO Auto-generated method stub
		RMProcessUnitChoice processUnitChoice = processUnitChoiceService.getProcessUnitChoice(id);
		processUnitChoiceService.deleteProcessUnitChoice(processUnitChoice);
	}
	
	@Override
	public ArrayList<RMProcessUnitChoice> getProcessUnitChoiceList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processUnitChoice\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<RMProcessUnitChoice> list = processUnitChoiceService.getProcessUnitChoices(customer, customerValue);
		 
		return (ArrayList<RMProcessUnitChoice>) list;
	}

	@Override
	
	public void ProcessUnitChoiceList(ArrayList<RMProcessUnitChoice> processUnitChoices) {
		// TODO Auto-generated method stub
		for(RMProcessUnitChoice processUnitChoice : processUnitChoices){
			RMProcessUnitChoice old = processUnitChoiceService.loadProcessUnitChoiceByBussinessKey(processUnitChoice);
			if(old!=null){
				processUnitChoice.setId(old.getId());
				processUnitChoice.setVersion(old.getVersion());
			}
			processUnitChoiceService.mergeProcessUnitChoice(processUnitChoice, null,null,null);
		}
	}
	
	@Override
	public Page<RMProcessUnitChoice> getProcessUnitChoicePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processUnitChoice\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMProcessUnitChoice> page = new Page<RMProcessUnitChoice>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMProcessUnitChoice> list = processUnitChoiceService.getProcessUnitChoices(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<RMProcessUnitChoice> getProcessUnitChoicePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"processUnitChoice\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<RMProcessUnitChoice> page = new Page<RMProcessUnitChoice>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<RMProcessUnitChoice> list = processUnitChoiceService.getProcessUnitChoices(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,RM_7.5.0.0_suitedLine_ProcessUnitChoice,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
}