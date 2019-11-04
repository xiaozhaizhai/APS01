package com.supcon.orchid.X6Basic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriodPart;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface X6BasicAccountPeriodPartDao extends
	ExtendedGenericDao<X6BasicAccountPeriodPart, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,X6Basic_1.0_accountingPeriod_AccountPeriodPart,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}