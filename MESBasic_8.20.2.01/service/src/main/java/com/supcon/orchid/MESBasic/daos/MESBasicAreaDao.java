package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicArea;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicAreaDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicAreaDao extends
	TreeDao<MESBasicArea, Long>
 {
    void saveDealInfo(MESBasicAreaDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicAreaDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicAreaDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicArea mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_area_Area,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}