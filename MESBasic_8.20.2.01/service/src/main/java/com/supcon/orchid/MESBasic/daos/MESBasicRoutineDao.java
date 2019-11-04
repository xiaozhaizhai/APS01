package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutineDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicRoutineDao extends
	ExtendedGenericDao<MESBasicRoutine, Long>
 {
    void saveDealInfo(MESBasicRoutineDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicRoutineDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicRoutineDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicRoutine mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_routine_Routine,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}