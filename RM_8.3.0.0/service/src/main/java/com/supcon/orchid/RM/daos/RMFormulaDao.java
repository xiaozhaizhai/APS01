package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Supervision;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.RM.entities.RMFormulaDealInfo;
import com.supcon.orchid.RM.entities.RMFormulaSupervision;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface RMFormulaDao extends
	ExtendedGenericDao<RMFormula, Long>
 {
    void saveDealInfo(RMFormulaDealInfo dealInfo);
    void addSupervision(Supervision supervision);
    void addSupervision(Supervision supervision, RMFormula mainObj);
    void deleteSupervision(Long tableInfoId);
	void deleteSupervision(Long tableInfoId, List<Long> idList);
	List<RMFormulaSupervision> findSupervision(Long tableInfoId);
	List<RMFormulaSupervision> findSupervision(Long tableInfoId, Long StaffId);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    RMFormulaDealInfo copyAndSaveDealInfo(DealInfo di);
    RMFormulaDealInfo copyAndSaveDealInfo(DealInfo di, RMFormula mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}