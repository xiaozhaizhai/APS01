package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLogDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface RMInterfaceSyncLogDao extends
	ExtendedGenericDao<RMInterfaceSyncLog, Long>
 {
    void saveDealInfo(RMInterfaceSyncLogDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    RMInterfaceSyncLogDealInfo copyAndSaveDealInfo(DealInfo di);
    RMInterfaceSyncLogDealInfo copyAndSaveDealInfo(DealInfo di, RMInterfaceSyncLog mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_interfaceService_InterfaceSyncLog,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}