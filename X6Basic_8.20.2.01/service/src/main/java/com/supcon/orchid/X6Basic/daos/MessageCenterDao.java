package com.supcon.orchid.X6Basic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.X6Basic.entities.MessageCenter;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.X6Basic.entities.MessageCenterDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MessageCenterDao extends
	ExtendedGenericDao<MessageCenter, Long>
 {
    void saveDealInfo(MessageCenterDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MessageCenterDealInfo copyAndSaveDealInfo(DealInfo di);
    MessageCenterDealInfo copyAndSaveDealInfo(DealInfo di, MessageCenter mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,X6Basic_1.0_messageManage_MessageCenter,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}