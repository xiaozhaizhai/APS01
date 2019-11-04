package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.RM.entities.RMFormulaType;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.RM.entities.RMFormulaTypeDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface RMFormulaTypeDao extends
	TreeDao<RMFormulaType, Long>
 {
    void saveDealInfo(RMFormulaTypeDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    RMFormulaTypeDealInfo copyAndSaveDealInfo(DealInfo di);
    RMFormulaTypeDealInfo copyAndSaveDealInfo(DealInfo di, RMFormulaType mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_formulaType_FormulaType,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}