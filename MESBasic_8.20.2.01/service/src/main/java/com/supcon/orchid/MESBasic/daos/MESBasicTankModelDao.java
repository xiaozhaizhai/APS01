package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicTankModelDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicTankModelDao extends
	TreeDao<MESBasicTankModel, Long>
 {
    void saveDealInfo(MESBasicTankModelDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicTankModelDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicTankModelDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicTankModel mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_tankModel_TankModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}