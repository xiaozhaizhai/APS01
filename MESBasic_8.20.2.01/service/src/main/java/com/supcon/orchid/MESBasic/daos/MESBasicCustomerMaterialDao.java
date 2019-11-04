package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicCustomerMaterial;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicCustomerMaterialDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicCustomerMaterialDao extends
	ExtendedGenericDao<MESBasicCustomerMaterial, Long>
 {
    void saveDealInfo(MESBasicCustomerMaterialDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicCustomerMaterialDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicCustomerMaterialDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicCustomerMaterial mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_customerMaterial_CustomerMaterial,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}