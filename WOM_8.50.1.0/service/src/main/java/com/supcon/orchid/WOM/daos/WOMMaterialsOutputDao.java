package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMMaterialsOutput;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMMaterialsOutputDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMMaterialsOutputDao extends
	ExtendedGenericDao<WOMMaterialsOutput, Long>
 {
    void saveDealInfo(WOMMaterialsOutputDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMMaterialsOutputDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMMaterialsOutputDealInfo copyAndSaveDealInfo(DealInfo di, WOMMaterialsOutput mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_produceRecords_MaterialsOutput,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}