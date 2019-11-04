package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.MESBasic.entities.MESBasicBatchDealInfo;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface MESBasicBatchDealInfoDao extends
	ExtendedGenericDao<MESBasicBatchDealInfo, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_batchInfo_BatchDealInfo,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}