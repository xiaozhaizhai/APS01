package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClassDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicBaseCustomerClassDao extends
	TreeDao<MESBasicBaseCustomerClass, Long>
 {
    void saveDealInfo(MESBasicBaseCustomerClassDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicBaseCustomerClassDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicBaseCustomerClassDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicBaseCustomerClass mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_baseCustomerClass_BaseCustomerClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}