package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicClearSinget;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicClearSingetDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicClearSingetDao extends
	ExtendedGenericDao<MESBasicClearSinget, Long>
 {
    void saveDealInfo(MESBasicClearSingetDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicClearSingetDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicClearSingetDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicClearSinget mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_clearSinget_ClearSinget,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}