package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialDealInfo;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialSupervision;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMBatchingMaterialDao extends
	ExtendedGenericDao<WOMBatchingMaterial, Long>
 {
    void saveDealInfo(WOMBatchingMaterialDealInfo dealInfo);
    void addSupervision(Supervision supervision);
    void addSupervision(Supervision supervision, WOMBatchingMaterial mainObj);
    void deleteSupervision(Long tableInfoId);
	void deleteSupervision(Long tableInfoId, List<Long> idList);
	List<WOMBatchingMaterialSupervision> findSupervision(Long tableInfoId);
	List<WOMBatchingMaterialSupervision> findSupervision(Long tableInfoId, Long StaffId);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMBatchingMaterialDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMBatchingMaterialDealInfo copyAndSaveDealInfo(DealInfo di, WOMBatchingMaterial mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}