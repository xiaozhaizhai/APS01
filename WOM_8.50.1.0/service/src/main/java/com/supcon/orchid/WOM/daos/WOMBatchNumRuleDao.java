package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMBatchNumRule;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMBatchNumRuleDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMBatchNumRuleDao extends
	ExtendedGenericDao<WOMBatchNumRule, Long>
 {
    void saveDealInfo(WOMBatchNumRuleDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMBatchNumRuleDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMBatchNumRuleDealInfo copyAndSaveDealInfo(DealInfo di, WOMBatchNumRule mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_batchNumRule_BatchNumRule,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}