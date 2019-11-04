package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicProdList;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicProdListDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicProdListDao extends
	ExtendedGenericDao<MESBasicProdList, Long>
 {
    void saveDealInfo(MESBasicProdListDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicProdListDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicProdListDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicProdList mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_prodList_ProdList,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}