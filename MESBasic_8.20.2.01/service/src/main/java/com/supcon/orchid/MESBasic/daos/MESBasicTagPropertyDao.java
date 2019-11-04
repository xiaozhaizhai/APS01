package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicTagProperty;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicTagPropertyDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicTagPropertyDao extends
	ExtendedGenericDao<MESBasicTagProperty, Long>
 {
    void saveDealInfo(MESBasicTagPropertyDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicTagPropertyDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicTagPropertyDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicTagProperty mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_tagProperty_TagProperty,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
}