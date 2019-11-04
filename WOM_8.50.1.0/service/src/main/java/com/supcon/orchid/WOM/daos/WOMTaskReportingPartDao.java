package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
public interface WOMTaskReportingPartDao extends
	ExtendedGenericDao<WOMTaskReportingPart, Long>
 {    DataClassific getDataClassific(String code);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_taskReporting_TaskReportingPart,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}