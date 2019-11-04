package com.supcon.orchid.X6Basic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface X6BasicBaseUnitDao extends
	ExtendedGenericDao<X6BasicBaseUnit, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,X6Basic_1.0_unitGroup_BaseUnit,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}