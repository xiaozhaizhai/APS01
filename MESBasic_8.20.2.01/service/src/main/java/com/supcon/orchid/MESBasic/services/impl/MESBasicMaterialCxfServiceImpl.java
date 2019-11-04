package com.supcon.orchid.MESBasic.services.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.MESBasic.services.MESBasicMaterialCxfService;
import com.supcon.orchid.MESBasic.services.MESBasicMaterialService;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.services.ConditionService;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.supcon.orchid.annotation.BAPPermission;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicConfig;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
/* CUSTOM CODE START(cxfserviceimpl,import,MESBasic_1_material_Material,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
@Service("mESBasicMaterialCxfService")
@Transactional
public class MESBasicMaterialCxfServiceImpl implements MESBasicMaterialCxfService {
	
	@Resource
	private MESBasicMaterialService materialService;
	
	@Resource
	private ConditionService conditionService;
	
	@Resource
	private SynchronizeInfoService synchronizeInfoService;

	@Override
	@BAPPermission("MESBasic_1_material_materialList")
	public MESBasicMaterial getMaterial(long id){
		MESBasicMaterial material = materialService.getMaterial(id);
		return material;
	}
	
	@Override
	@BAPPermission("MESBasic_1_material_materialList_BUTTON_materialEdit")
	public void updateMaterial(long id, MESBasicMaterial material) {
		// TODO Auto-generated method stub
		material.setId(id);
		materialService.saveMaterial(material, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	@BAPPermission("MESBasic_1_material_materialList_BUTTON_materialNew")
	public void createMaterial(MESBasicMaterial material) {
		// TODO Auto-generated method stub
		materialService.saveMaterial(material, new DataGridService() {
			@Override
			public void execute() {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	@BAPPermission("MESBasic_1_material_materialList_BUTTON_materialDel")
	public void deleteMaterial(long id) {
		// TODO Auto-generated method stub
		MESBasicMaterial material = materialService.getMaterial(id);
		materialService.deleteMaterial(material);
	}
	
	@Override
	public ArrayList<MESBasicMaterial> getMaterialList(String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"material\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		List<MESBasicMaterial> list = materialService.getMaterials(customer, customerValue);
		 
		return (ArrayList<MESBasicMaterial>) list;
	}

	@Override
	@BAPPermission("MESBasic_1_material_materialList_BUTTON_materialNew")
	public void MaterialList(ArrayList<MESBasicMaterial> materials) {
		// TODO Auto-generated method stub
		for(MESBasicMaterial material : materials){
			MESBasicMaterial old = materialService.loadMaterialByBussinessKey(material);
			if(old!=null){
				material.setId(old.getId());
				material.setVersion(old.getVersion());
			}
			materialService.mergeMaterial(material, null);
		}
	}
	
	@Override
	public Page<MESBasicMaterial> getMaterialPage(int pageNo, int pageSize, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"material\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicMaterial> page = new Page<MESBasicMaterial>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicMaterial> list = materialService.getMaterials(page, customer, customerValue, null);
		return list;
	}
	
	@Override
	public Page<MESBasicMaterial> getMaterialPageSort(int pageNo, int pageSize, String sort, String condition) {
		String customer = null;
		List<Object> customerValue = null;
		if(condition != null && condition.length() > 0){
			AdvQueryCondition acon = conditionService.toSql(condition);
			customer = acon.getSql();
			if(customer!=null && customer.length()>0){
				customer = customer.replace("\"material\".", "{alias}.");
			}
			customerValue = acon.getValues();
		}
		Page<MESBasicMaterial> page = new Page<MESBasicMaterial>();
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		Page<MESBasicMaterial> list = materialService.getMaterials(page, customer, customerValue, sort);
		return list;
	}

	/* CUSTOM CODE START(cxfserviceimpl,functions,MESBasic_1_material_Material,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}