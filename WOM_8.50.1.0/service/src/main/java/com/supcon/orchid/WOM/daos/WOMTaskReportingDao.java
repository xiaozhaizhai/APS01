package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMTaskReportingDealInfo;
import com.supcon.orchid.WOM.entities.WOMTaskReportingSupervision;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMTaskReportingDao extends
	ExtendedGenericDao<WOMTaskReporting, Long>
 {
    void saveDealInfo(WOMTaskReportingDealInfo dealInfo);
    void addSupervision(Supervision supervision);
    void addSupervision(Supervision supervision, WOMTaskReporting mainObj);
    void deleteSupervision(Long tableInfoId);
	void deleteSupervision(Long tableInfoId, List<Long> idList);
	List<WOMTaskReportingSupervision> findSupervision(Long tableInfoId);
	List<WOMTaskReportingSupervision> findSupervision(Long tableInfoId, Long StaffId);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMTaskReportingDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMTaskReportingDealInfo copyAndSaveDealInfo(DealInfo di, WOMTaskReporting mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}