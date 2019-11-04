package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchInformation;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchInformationDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicBatchInformationDao extends
	ExtendedGenericDao<MESBasicBatchInformation, Long>
 {
    void saveDealInfo(MESBasicBatchInformationDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicBatchInformationDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicBatchInformationDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicBatchInformation mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_batchInfo_BatchInformation,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}