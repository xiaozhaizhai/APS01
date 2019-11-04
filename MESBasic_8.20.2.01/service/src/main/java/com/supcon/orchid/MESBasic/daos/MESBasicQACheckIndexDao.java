package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicQACheckIndex;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicQACheckIndexDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicQACheckIndexDao extends
	ExtendedGenericDao<MESBasicQACheckIndex, Long>
 {
    void saveDealInfo(MESBasicQACheckIndexDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicQACheckIndexDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicQACheckIndexDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicQACheckIndex mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_checkIndex_QACheckIndex,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}