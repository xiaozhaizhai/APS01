package com.supcon.orchid.WOM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.WOM.entities.WOMActiveExelog;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.WOM.entities.WOMActiveExelogDealInfo;
import com.supcon.orchid.WOM.entities.WOMActiveExelogSupervision;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface WOMActiveExelogDao extends
	ExtendedGenericDao<WOMActiveExelog, Long>
 {
    void saveDealInfo(WOMActiveExelogDealInfo dealInfo);
    void addSupervision(Supervision supervision);
    void addSupervision(Supervision supervision, WOMActiveExelog mainObj);
    void deleteSupervision(Long tableInfoId);
	void deleteSupervision(Long tableInfoId, List<Long> idList);
	List<WOMActiveExelogSupervision> findSupervision(Long tableInfoId);
	List<WOMActiveExelogSupervision> findSupervision(Long tableInfoId, Long StaffId);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    WOMActiveExelogDealInfo copyAndSaveDealInfo(DealInfo di);
    WOMActiveExelogDealInfo copyAndSaveDealInfo(DealInfo di, WOMActiveExelog mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,WOM_7.5.0.0_activeExelog_ActiveExelog,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}