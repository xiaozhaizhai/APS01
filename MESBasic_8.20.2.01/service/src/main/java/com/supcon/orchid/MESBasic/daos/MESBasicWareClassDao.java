package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicWareClass;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicWareClassDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicWareClassDao extends
	TreeDao<MESBasicWareClass, Long>
 {
    void saveDealInfo(MESBasicWareClassDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicWareClassDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicWareClassDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicWareClass mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_wareClass_WareClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}