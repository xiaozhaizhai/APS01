package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipmentDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicEquipmentDao extends
	ExtendedGenericDao<MESBasicEquipment, Long>
 {
    void saveDealInfo(MESBasicEquipmentDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicEquipmentDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicEquipmentDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicEquipment mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_equipManage_Equipment,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}