package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManageDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicPlaceManageDao extends
	ExtendedGenericDao<MESBasicPlaceManage, Long>
 {
    void saveDealInfo(MESBasicPlaceManageDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicPlaceManageDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicPlaceManageDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicPlaceManage mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_placeManage_PlaceManage,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}