package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicEamType;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicEamTypeDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicEamTypeDao extends
	TreeDao<MESBasicEamType, Long>
 {
    void saveDealInfo(MESBasicEamTypeDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicEamTypeDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicEamTypeDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicEamType mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_eamType_EamType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}