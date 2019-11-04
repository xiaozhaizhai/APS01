package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModelDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicFactoryModelDao extends
	TreeDao<MESBasicFactoryModel, Long>
 {
    void saveDealInfo(MESBasicFactoryModelDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicFactoryModelDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicFactoryModelDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicFactoryModel mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}