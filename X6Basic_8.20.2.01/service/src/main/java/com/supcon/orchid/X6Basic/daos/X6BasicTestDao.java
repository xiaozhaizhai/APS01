package com.supcon.orchid.X6Basic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.X6Basic.entities.X6BasicTest;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.X6Basic.entities.X6BasicTestDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface X6BasicTestDao extends
	ExtendedGenericDao<X6BasicTest, Long>
 {
    void saveDealInfo(X6BasicTestDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    X6BasicTestDealInfo copyAndSaveDealInfo(DealInfo di);
    X6BasicTestDealInfo copyAndSaveDealInfo(DealInfo di, X6BasicTest mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,X6Basic_1.0_test_Test,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}