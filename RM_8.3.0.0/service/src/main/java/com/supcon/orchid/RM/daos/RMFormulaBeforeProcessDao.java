package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.RM.entities.RMFormulaBeforeProcess;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface RMFormulaBeforeProcessDao extends
	ExtendedGenericDao<RMFormulaBeforeProcess, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_formula_FormulaBeforeProcess,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}