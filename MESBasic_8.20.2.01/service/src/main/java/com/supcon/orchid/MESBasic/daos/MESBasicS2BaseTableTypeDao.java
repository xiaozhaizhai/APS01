package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicS2BaseTableType;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicS2BaseTableTypeDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicS2BaseTableTypeDao extends
	TreeDao<MESBasicS2BaseTableType, Long>
 {
    void saveDealInfo(MESBasicS2BaseTableTypeDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicS2BaseTableTypeDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicS2BaseTableTypeDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicS2BaseTableType mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_tableType_S2BaseTableType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}