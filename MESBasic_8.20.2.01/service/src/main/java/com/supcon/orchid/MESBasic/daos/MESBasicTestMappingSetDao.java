package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSet;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicTestMappingSetDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicTestMappingSetDao extends
	ExtendedGenericDao<MESBasicTestMappingSet, Long>
 {
    void saveDealInfo(MESBasicTestMappingSetDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicTestMappingSetDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicTestMappingSetDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicTestMappingSet mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}