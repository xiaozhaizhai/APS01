package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.RM.entities.RMBatchFormulaMain;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.RM.entities.RMBatchFormulaMainDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface RMBatchFormulaMainDao extends
	ExtendedGenericDao<RMBatchFormulaMain, Long>
 {
    void saveDealInfo(RMBatchFormulaMainDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    RMBatchFormulaMainDealInfo copyAndSaveDealInfo(DealInfo di);
    RMBatchFormulaMainDealInfo copyAndSaveDealInfo(DealInfo di, RMBatchFormulaMain mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_batchFormula_BatchFormulaMain,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}