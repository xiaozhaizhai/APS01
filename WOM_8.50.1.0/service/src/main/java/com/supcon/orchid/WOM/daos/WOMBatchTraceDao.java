package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMBatchTrace;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMBatchTraceDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMBatchTraceDao extends
	ExtendedGenericDao<WOMBatchTrace, Long>
 {
    void saveDealInfo(WOMBatchTraceDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMBatchTraceDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMBatchTraceDealInfo copyAndSaveDealInfo(DealInfo di, WOMBatchTrace mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_batchTimeLiner_BatchTrace,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}