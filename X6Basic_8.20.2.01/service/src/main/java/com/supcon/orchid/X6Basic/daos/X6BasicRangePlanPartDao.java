package com.supcon.orchid.X6Basic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlanPart;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface X6BasicRangePlanPartDao extends
	ExtendedGenericDao<X6BasicRangePlanPart, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,X6Basic_1.0_rangePlan_RangePlanPart,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}