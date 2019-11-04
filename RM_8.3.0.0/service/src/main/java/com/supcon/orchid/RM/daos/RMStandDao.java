package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.RM.entities.RMStand;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.RM.entities.RMStandDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface RMStandDao extends
	ExtendedGenericDao<RMStand, Long>
 {
    void saveDealInfo(RMStandDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    RMStandDealInfo copyAndSaveDealInfo(DealInfo di);
    RMStandDealInfo copyAndSaveDealInfo(DealInfo di, RMStand mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_qualityStandard_Stand,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}