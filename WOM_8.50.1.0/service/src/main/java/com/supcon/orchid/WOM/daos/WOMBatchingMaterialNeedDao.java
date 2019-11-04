package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeedDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMBatchingMaterialNeedDao extends
	ExtendedGenericDao<WOMBatchingMaterialNeed, Long>
 {
    void saveDealInfo(WOMBatchingMaterialNeedDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMBatchingMaterialNeedDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMBatchingMaterialNeedDealInfo copyAndSaveDealInfo(DealInfo di, WOMBatchingMaterialNeed mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}