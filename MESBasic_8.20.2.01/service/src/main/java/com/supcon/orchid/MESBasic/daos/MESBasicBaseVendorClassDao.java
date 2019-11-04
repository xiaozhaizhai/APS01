package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClassDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicBaseVendorClassDao extends
	TreeDao<MESBasicBaseVendorClass, Long>
 {
    void saveDealInfo(MESBasicBaseVendorClassDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicBaseVendorClassDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicBaseVendorClassDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicBaseVendorClass mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_baseVenderClass_BaseVendorClass,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}