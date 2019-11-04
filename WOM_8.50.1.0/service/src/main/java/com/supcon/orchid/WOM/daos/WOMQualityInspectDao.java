package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMQualityInspect;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMQualityInspectDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMQualityInspectDao extends
	ExtendedGenericDao<WOMQualityInspect, Long>
 {
    void saveDealInfo(WOMQualityInspectDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMQualityInspectDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMQualityInspectDealInfo copyAndSaveDealInfo(DealInfo di, WOMQualityInspect mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_qualityRecords_QualityInspect,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}