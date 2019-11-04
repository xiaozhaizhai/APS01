package com.supcon.orchid.X6Basic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncLog;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncLogDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface X6BasicSyncLogDao extends
	ExtendedGenericDao<X6BasicSyncLog, Long>
 {
    void saveDealInfo(X6BasicSyncLogDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    X6BasicSyncLogDealInfo copyAndSaveDealInfo(DealInfo di);
    X6BasicSyncLogDealInfo copyAndSaveDealInfo(DealInfo di, X6BasicSyncLog mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,X6Basic_1.0_syncLog_SyncLog,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}