package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMProduceTaskManage;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMProduceTaskManageDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMProduceTaskManageDao extends
	ExtendedGenericDao<WOMProduceTaskManage, Long>
 {
    void saveDealInfo(WOMProduceTaskManageDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMProduceTaskManageDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMProduceTaskManageDealInfo copyAndSaveDealInfo(DealInfo di, WOMProduceTaskManage mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_generalManage_ProduceTaskManage,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}