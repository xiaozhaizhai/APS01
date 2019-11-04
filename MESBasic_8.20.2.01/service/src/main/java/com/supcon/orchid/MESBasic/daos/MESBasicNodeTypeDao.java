package com.supcon.orchid.MESBasic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.MESBasic.entities.MESBasicNodeType;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.MESBasic.entities.MESBasicNodeTypeDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MESBasicNodeTypeDao extends
	ExtendedGenericDao<MESBasicNodeType, Long>
 {
    void saveDealInfo(MESBasicNodeTypeDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MESBasicNodeTypeDealInfo copyAndSaveDealInfo(DealInfo di);
    MESBasicNodeTypeDealInfo copyAndSaveDealInfo(DealInfo di, MESBasicNodeType mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,MESBasic_1_nodeType_NodeType,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
}