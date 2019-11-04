package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicStoreSetDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicStoreSetDao extends
	TreeDao<MESBasicStoreSet, Long>
 {
    void saveDealInfo(MESBasicStoreSetDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicStoreSetDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicStoreSetDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicStoreSet mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_storeSet_StoreSet,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}