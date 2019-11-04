package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLogDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicInterfaceLogDao extends
	ExtendedGenericDao<MESBasicInterfaceLog, Long>
 {
    void saveDealInfo(MESBasicInterfaceLogDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicInterfaceLogDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicInterfaceLogDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicInterfaceLog mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_pimsInterface_InterfaceLog,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}