package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface MESBasicServiceLoggerDao extends
	ExtendedGenericDao<MESBasicServiceLogger, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_backgroundServiceMonitor_ServiceLogger,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}