package com.supcon.orchid.X6Basic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.X6Basic.entities.AttMachine;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.X6Basic.entities.AttMachineDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface AttMachineDao extends
	ExtendedGenericDao<AttMachine, Long>
 {
    void saveDealInfo(AttMachineDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    AttMachineDealInfo copyAndSaveDealInfo(DealInfo di);
    AttMachineDealInfo copyAndSaveDealInfo(DealInfo di, AttMachine mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,X6Basic_1.0_attMachine_AttMachine,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}