package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTask;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTaskDealInfo;
import com.supcon.orchid.WOM.entities.WOMBatchProduceTaskSupervision;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMBatchProduceTaskDao extends
	ExtendedGenericDao<WOMBatchProduceTask, Long>
 {
    void saveDealInfo(WOMBatchProduceTaskDealInfo dealInfo);
    void addSupervision(Supervision supervision);
    void addSupervision(Supervision supervision, WOMBatchProduceTask mainObj);
    void deleteSupervision(Long tableInfoId);
	void deleteSupervision(Long tableInfoId, List<Long> idList);
	List<WOMBatchProduceTaskSupervision> findSupervision(Long tableInfoId);
	List<WOMBatchProduceTaskSupervision> findSupervision(Long tableInfoId, Long StaffId);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMBatchProduceTaskDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMBatchProduceTaskDealInfo copyAndSaveDealInfo(DealInfo di, WOMBatchProduceTask mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_batchProduceTask_BatchProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}