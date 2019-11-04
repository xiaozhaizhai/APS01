package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.RM.entities.RMTestProj;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.RM.entities.RMTestProjDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface RMTestProjDao extends
	ExtendedGenericDao<RMTestProj, Long>
 {
    void saveDealInfo(RMTestProjDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    RMTestProjDealInfo copyAndSaveDealInfo(DealInfo di);
    RMTestProjDealInfo copyAndSaveDealInfo(DealInfo di, RMTestProj mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_testProj_TestProj,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}