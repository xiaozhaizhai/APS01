package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.RM.entities.RMFormulaChange;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.RM.entities.RMFormulaChangeDealInfo;
import com.supcon.orchid.RM.entities.RMFormulaChangeSupervision;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface RMFormulaChangeDao extends
	ExtendedGenericDao<RMFormulaChange, Long>
 {
    void saveDealInfo(RMFormulaChangeDealInfo dealInfo);
    void addSupervision(Supervision supervision);
    void addSupervision(Supervision supervision, RMFormulaChange mainObj);
    void deleteSupervision(Long tableInfoId);
	void deleteSupervision(Long tableInfoId, List<Long> idList);
	List<RMFormulaChangeSupervision> findSupervision(Long tableInfoId);
	List<RMFormulaChangeSupervision> findSupervision(Long tableInfoId, Long StaffId);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    RMFormulaChangeDealInfo copyAndSaveDealInfo(DealInfo di);
    RMFormulaChangeDealInfo copyAndSaveDealInfo(DealInfo di, RMFormulaChange mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}