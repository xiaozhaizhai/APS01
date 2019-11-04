package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface WOMProdTaskProcExelogDao extends
	ExtendedGenericDao<WOMProdTaskProcExelog, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_produceTask_ProdTaskProcExelog,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}