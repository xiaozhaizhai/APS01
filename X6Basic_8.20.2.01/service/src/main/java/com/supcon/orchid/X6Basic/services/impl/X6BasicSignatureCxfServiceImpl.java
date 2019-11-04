package com.supcon.orchid.X6Basic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.X6Basic.services.X6BasicSignatureCxfService;
import com.supcon.orchid.X6Basic.services.X6BasicSignatureService;
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
/* CUSTOM CODE START(cxfserviceimpl,import,X6Basic_1.0_ggSignetManage_Signature,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
@Service("x6BasicSignatureCxfService")
@Transactional
public class X6BasicSignatureCxfServiceImpl implements X6BasicSignatureCxfService {
	
	@Resource
	private X6BasicSignatureService signatureService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("X6Basic_1.0_ggSignetManage_list")
	public X6BasicSignature getSignature(long id){
		X6BasicSignature signature = signatureService.getSignature(id);
		return signature;
	}
	
	@Override
	@BAPPermission("X6Basic_1.0_ggSignetManage_list_BUTTON_signetModify")
	public void updateSignature(long id, X6BasicSignature signature) {
		// TODO Auto-generated method stub
		signature.setId(id);
		signatureService.saveSignature(signature,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_ggSignetManage_list_BUTTON_signetAdd")
	public void createSignature(X6BasicSignature signature) {
		// TODO Auto-generated method stub
		signatureService.saveSignature(signature,null,null,null);
	}

	@Override
	@BAPPermission("X6Basic_1.0_ggSignetManage_list_BUTTON_signetDelete")
	public void deleteSignature(long id) {
		// TODO Auto-generated method stub
		X6BasicSignature signature = signatureService.getSignature(id);
		signatureService.deleteSignature(signature);
	}
	
	@Override
	public ArrayList<X6BasicSignature> getSignatureList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"signature\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<X6BasicSignature> list = signatureService.getSignatures(customer, customerValue);
		 
		return (ArrayList<X6BasicSignature>) list;
	}

	@Override
	@BAPPermission("X6Basic_1.0_ggSignetManage_list_BUTTON_signetAdd")
	public void SignatureList(ArrayList<X6BasicSignature> signatures) {
		// TODO Auto-generated method stub
		for(X6BasicSignature signature : signatures){
			X6BasicSignature old = signatureService.loadSignatureByBussinessKey(signature);
			if(old!=null){
				signature.setId(old.getId());
				signature.setVersion(old.getVersion());
			}
			signatureService.mergeSignature(signature, null,null,null);
		}
	}
	
	@Override
	public Page<X6BasicSignature> getSignaturePage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"signature\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicSignature> page = new Page<X6BasicSignature>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicSignature> list = signatureService.getSignatures(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<X6BasicSignature> getSignaturePageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"signature\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<X6BasicSignature> page = new Page<X6BasicSignature>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<X6BasicSignature> list = signatureService.getSignatures(page, customer, customerValue, sort);
		return list;
	}
	/* CUSTOM CODE START(cxfserviceimpl,functions,X6Basic_1.0_ggSignetManage_Signature,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
}