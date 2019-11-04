package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.RM.entities.RMSampleProj;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.RM.entities.RMSampleProjDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface RMSampleProjDao extends
	ExtendedGenericDao<RMSampleProj, Long>
 {
    void saveDealInfo(RMSampleProjDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    RMSampleProjDealInfo copyAndSaveDealInfo(DealInfo di);
    RMSampleProjDealInfo copyAndSaveDealInfo(DealInfo di, RMSampleProj mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_sampleProj_SampleProj,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}