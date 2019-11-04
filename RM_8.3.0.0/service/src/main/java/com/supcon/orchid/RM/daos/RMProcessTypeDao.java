package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.RM.entities.RMProcessType;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.RM.entities.RMProcessTypeDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface RMProcessTypeDao extends
	ExtendedGenericDao<RMProcessType, Long>
 {
    void saveDealInfo(RMProcessTypeDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    RMProcessTypeDealInfo copyAndSaveDealInfo(DealInfo di);
    RMProcessTypeDealInfo copyAndSaveDealInfo(DealInfo di, RMProcessType mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_processType_ProcessType,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}