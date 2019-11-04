package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMProduceTaskDealInfo;
import com.supcon.orchid.WOM.entities.WOMProduceTaskSupervision;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMProduceTaskDao extends
	ExtendedGenericDao<WOMProduceTask, Long>
 {
    void saveDealInfo(WOMProduceTaskDealInfo dealInfo);
    void addSupervision(Supervision supervision);
    void addSupervision(Supervision supervision, WOMProduceTask mainObj);
    void deleteSupervision(Long tableInfoId);
	void deleteSupervision(Long tableInfoId, List<Long> idList);
	List<WOMProduceTaskSupervision> findSupervision(Long tableInfoId);
	List<WOMProduceTaskSupervision> findSupervision(Long tableInfoId, Long StaffId);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMProduceTaskDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMProduceTaskDealInfo copyAndSaveDealInfo(DealInfo di, WOMProduceTask mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}