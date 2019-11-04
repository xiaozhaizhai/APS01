package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialDealInfo;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialSupervision;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMPutInMaterialDao extends
	ExtendedGenericDao<WOMPutInMaterial, Long>
 {
    void saveDealInfo(WOMPutInMaterialDealInfo dealInfo);
    void addSupervision(Supervision supervision);
    void addSupervision(Supervision supervision, WOMPutInMaterial mainObj);
    void deleteSupervision(Long tableInfoId);
	void deleteSupervision(Long tableInfoId, List<Long> idList);
	List<WOMPutInMaterialSupervision> findSupervision(Long tableInfoId);
	List<WOMPutInMaterialSupervision> findSupervision(Long tableInfoId, Long StaffId);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMPutInMaterialDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMPutInMaterialDealInfo copyAndSaveDealInfo(DealInfo di, WOMPutInMaterial mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}