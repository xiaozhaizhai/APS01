package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicItemRecordDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicItemRecordDao extends
	ExtendedGenericDao<MESBasicItemRecord, Long>
 {
    void saveDealInfo(MESBasicItemRecordDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicItemRecordDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicItemRecordDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicItemRecord mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_itemRecord_ItemRecord,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}