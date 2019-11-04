package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface MESBasicItemSeqDao extends
	ExtendedGenericDao<MESBasicItemSeq, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_thirdDataHandler_ItemSeq,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}