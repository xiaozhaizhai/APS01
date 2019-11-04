package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicOriginalSignal;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicOriginalSignalDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicOriginalSignalDao extends
	ExtendedGenericDao<MESBasicOriginalSignal, Long>
 {
    void saveDealInfo(MESBasicOriginalSignalDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicOriginalSignalDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicOriginalSignalDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicOriginalSignal mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_originalSignal_OriginalSignal,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}