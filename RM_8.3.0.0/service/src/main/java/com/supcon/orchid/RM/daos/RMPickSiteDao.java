package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.RM.entities.RMPickSite;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.RM.entities.RMPickSiteDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface RMPickSiteDao extends
	TreeDao<RMPickSite, Long>
 {
    void saveDealInfo(RMPickSiteDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    RMPickSiteDealInfo copyAndSaveDealInfo(DealInfo di);
    RMPickSiteDealInfo copyAndSaveDealInfo(DealInfo di, RMPickSite mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_pickSite_PickSite,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}