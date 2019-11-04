package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicProdAttribute;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicProdAttributeDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicProdAttributeDao extends
	TreeDao<MESBasicProdAttribute, Long>
 {
    void saveDealInfo(MESBasicProdAttributeDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicProdAttributeDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicProdAttributeDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicProdAttribute mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_prodAttribute_ProdAttribute,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}