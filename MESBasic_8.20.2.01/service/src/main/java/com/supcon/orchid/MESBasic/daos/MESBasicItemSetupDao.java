package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetupDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicItemSetupDao extends
	ExtendedGenericDao<MESBasicItemSetup, Long>
 {
    void saveDealInfo(MESBasicItemSetupDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicItemSetupDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicItemSetupDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicItemSetup mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_itemManage_ItemSetup,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}