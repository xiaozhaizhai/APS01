package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdListDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicBaseProdListDao extends
	TreeDao<MESBasicBaseProdList, Long>
 {
    void saveDealInfo(MESBasicBaseProdListDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicBaseProdListDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicBaseProdListDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicBaseProdList mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_prodList_BaseProdList,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}