package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMProActAndBatState;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMProActAndBatStateDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMProActAndBatStateDao extends
	ExtendedGenericDao<WOMProActAndBatState, Long>
 {
    void saveDealInfo(WOMProActAndBatStateDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMProActAndBatStateDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMProActAndBatStateDealInfo copyAndSaveDealInfo(DealInfo di, WOMProActAndBatState mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_proActiveAndBatchState_ProActAndBatState,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}