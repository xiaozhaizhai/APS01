package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicDataTransDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicDataTransDao extends
	ExtendedGenericDao<MESBasicDataTrans, Long>
 {
    void saveDealInfo(MESBasicDataTransDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicDataTransDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicDataTransDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicDataTrans mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_thirdDataHandler_DataTrans,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}