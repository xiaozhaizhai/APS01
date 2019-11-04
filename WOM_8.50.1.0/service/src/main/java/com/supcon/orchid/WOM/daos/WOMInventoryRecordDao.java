package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMInventoryRecord;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMInventoryRecordDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMInventoryRecordDao extends
	ExtendedGenericDao<WOMInventoryRecord, Long>
 {
    void saveDealInfo(WOMInventoryRecordDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMInventoryRecordDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMInventoryRecordDealInfo copyAndSaveDealInfo(DealInfo di, WOMInventoryRecord mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_inventoryRecords_InventoryRecord,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}