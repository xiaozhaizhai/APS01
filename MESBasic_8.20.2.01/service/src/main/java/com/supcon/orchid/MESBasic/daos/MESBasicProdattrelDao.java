package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicProdattrel;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicProdattrelDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicProdattrelDao extends
	ExtendedGenericDao<MESBasicProdattrel, Long>
 {
    void saveDealInfo(MESBasicProdattrelDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicProdattrelDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicProdattrelDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicProdattrel mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_prodatriel_Prodattrel,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}