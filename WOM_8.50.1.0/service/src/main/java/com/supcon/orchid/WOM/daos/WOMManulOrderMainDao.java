package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMManulOrderMain;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMManulOrderMainDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMManulOrderMainDao extends
	ExtendedGenericDao<WOMManulOrderMain, Long>
 {
    void saveDealInfo(WOMManulOrderMainDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMManulOrderMainDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMManulOrderMainDealInfo copyAndSaveDealInfo(DealInfo di, WOMManulOrderMain mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_manulOrder_ManulOrderMain,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}