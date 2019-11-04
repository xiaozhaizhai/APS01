package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicContainer;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicContainerDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicContainerDao extends
	ExtendedGenericDao<MESBasicContainer, Long>
 {
    void saveDealInfo(MESBasicContainerDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicContainerDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicContainerDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicContainer mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_container_Container,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}