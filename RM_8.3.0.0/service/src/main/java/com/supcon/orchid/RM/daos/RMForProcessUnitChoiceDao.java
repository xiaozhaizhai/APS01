package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.RM.entities.RMForProcessUnitChoice;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface RMForProcessUnitChoiceDao extends
	ExtendedGenericDao<RMForProcessUnitChoice, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_formula_ForProcessUnitChoice,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}