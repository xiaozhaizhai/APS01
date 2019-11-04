package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.WOM.entities.WOMBatchingRejectParts;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface WOMBatchingRejectPartsDao extends
	ExtendedGenericDao<WOMBatchingRejectParts, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_batchingMaterial_BatchingRejectParts,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}