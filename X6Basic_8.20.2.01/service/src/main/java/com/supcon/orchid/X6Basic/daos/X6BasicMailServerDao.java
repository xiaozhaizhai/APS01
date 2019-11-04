package com.supcon.orchid.X6Basic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.X6Basic.entities.X6BasicMailServer;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.X6Basic.entities.X6BasicMailServerDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface X6BasicMailServerDao extends
	ExtendedGenericDao<X6BasicMailServer, Long>
 {
    void saveDealInfo(X6BasicMailServerDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    X6BasicMailServerDealInfo copyAndSaveDealInfo(DealInfo di);
    X6BasicMailServerDealInfo copyAndSaveDealInfo(DealInfo di, X6BasicMailServer mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,X6Basic_1.0_mailServer_MailServer,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}