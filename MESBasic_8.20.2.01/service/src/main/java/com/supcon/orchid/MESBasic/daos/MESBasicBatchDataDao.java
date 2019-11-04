package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchData;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchDataDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicBatchDataDao extends
	ExtendedGenericDao<MESBasicBatchData, Long>
 {
    void saveDealInfo(MESBasicBatchDataDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicBatchDataDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicBatchDataDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicBatchData mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_batchDataHandler_BatchData,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}