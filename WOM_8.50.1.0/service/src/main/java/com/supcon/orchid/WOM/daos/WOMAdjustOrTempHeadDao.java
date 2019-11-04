package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.WOM.entities.WOMAdjustOrTempHead;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface WOMAdjustOrTempHeadDao extends
	ExtendedGenericDao<WOMAdjustOrTempHead, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_produceTask_AdjustOrTempHead,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}