package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServicesDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicMESServicesDao extends
	ExtendedGenericDao<MESBasicMESServices, Long>
 {
    void saveDealInfo(MESBasicMESServicesDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicMESServicesDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicMESServicesDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicMESServices mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_backgroundServiceMonitor_MESServices,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}