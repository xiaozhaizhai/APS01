package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicBaseVendorDao extends
	ExtendedGenericDao<MESBasicBaseVendor, Long>
 {
    void saveDealInfo(MESBasicBaseVendorDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicBaseVendorDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicBaseVendorDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicBaseVendor mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}