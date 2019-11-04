package com.supcon.orchid.RM.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.RM.entities.RMFormulaBomMain;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.RM.entities.RMFormulaBomMainDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface RMFormulaBomMainDao extends
	ExtendedGenericDao<RMFormulaBomMain, Long>
 {
    void saveDealInfo(RMFormulaBomMainDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    RMFormulaBomMainDealInfo copyAndSaveDealInfo(DealInfo di);
    RMFormulaBomMainDealInfo copyAndSaveDealInfo(DealInfo di, RMFormulaBomMain mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,RM_7.5.0.0_formulaBOM_FormulaBomMain,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
}