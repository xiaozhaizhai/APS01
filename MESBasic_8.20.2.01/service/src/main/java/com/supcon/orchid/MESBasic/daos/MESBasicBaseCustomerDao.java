package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicBaseCustomerDao extends
	ExtendedGenericDao<MESBasicBaseCustomer, Long>
 {
    void saveDealInfo(MESBasicBaseCustomerDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicBaseCustomerDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicBaseCustomerDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicBaseCustomer mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}