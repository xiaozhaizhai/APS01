package com.supcon.orchid.X6Basic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriod;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriodDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface X6BasicAccountPeriodDao extends
	ExtendedGenericDao<X6BasicAccountPeriod, Long>
 {
    void saveDealInfo(X6BasicAccountPeriodDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    X6BasicAccountPeriodDealInfo copyAndSaveDealInfo(DealInfo di);
    X6BasicAccountPeriodDealInfo copyAndSaveDealInfo(DealInfo di, X6BasicAccountPeriod mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,X6Basic_1.0_accountingPeriod_AccountPeriod,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}