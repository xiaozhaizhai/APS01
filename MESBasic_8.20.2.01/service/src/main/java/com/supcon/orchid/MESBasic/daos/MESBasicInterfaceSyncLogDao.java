package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceSyncLog;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceSyncLogDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicInterfaceSyncLogDao extends
	ExtendedGenericDao<MESBasicInterfaceSyncLog, Long>
 {
    void saveDealInfo(MESBasicInterfaceSyncLogDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicInterfaceSyncLogDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicInterfaceSyncLogDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicInterfaceSyncLog mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_interfaceSyncLog_InterfaceSyncLog,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}