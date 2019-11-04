package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfoDealInfo;
import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfoSupervision;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMDayBatchPlanInfoDao extends
	ExtendedGenericDao<WOMDayBatchPlanInfo, Long>
 {
    void saveDealInfo(WOMDayBatchPlanInfoDealInfo dealInfo);
    void addSupervision(Supervision supervision);
    void addSupervision(Supervision supervision, WOMDayBatchPlanInfo mainObj);
    void deleteSupervision(Long tableInfoId);
	void deleteSupervision(Long tableInfoId, List<Long> idList);
	List<WOMDayBatchPlanInfoSupervision> findSupervision(Long tableInfoId);
	List<WOMDayBatchPlanInfoSupervision> findSupervision(Long tableInfoId, Long StaffId);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMDayBatchPlanInfoDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMDayBatchPlanInfoDealInfo copyAndSaveDealInfo(DealInfo di, WOMDayBatchPlanInfo mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_producePlanRef_DayBatchPlanInfo,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}