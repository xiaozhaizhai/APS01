package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicPotData;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicPotDataDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicPotDataDao extends
	ExtendedGenericDao<MESBasicPotData, Long>
 {
    void saveDealInfo(MESBasicPotDataDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicPotDataDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicPotDataDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicPotData mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_potDataHandler_PotData,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}