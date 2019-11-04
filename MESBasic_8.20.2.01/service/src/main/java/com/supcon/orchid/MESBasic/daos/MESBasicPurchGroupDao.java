package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroup;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroupDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicPurchGroupDao extends
	ExtendedGenericDao<MESBasicPurchGroup, Long>
 {
    void saveDealInfo(MESBasicPurchGroupDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicPurchGroupDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicPurchGroupDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicPurchGroup mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_purch_Group_PurchGroup,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}