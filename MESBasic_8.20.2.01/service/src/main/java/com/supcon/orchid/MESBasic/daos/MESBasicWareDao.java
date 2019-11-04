package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicWareDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicWareDao extends
	ExtendedGenericDao<MESBasicWare, Long>
 {
    void saveDealInfo(MESBasicWareDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicWareDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicWareDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicWare mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_wareMan_Ware,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}