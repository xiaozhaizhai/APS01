package com.supcon.orchid.X6Basic.daos;

import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.foundation.entities.Staff;
import java.util.List;
import java.util.Date;
import com.supcon.orchid.X6Basic.entities.MeetingRoom;
import com.supcon.orchid.orm.dao.ExtendedGenericDao;
import com.supcon.orchid.tree.TreeDao;
import com.supcon.orchid.X6Basic.entities.MeetingRoomDealInfo;
import com.supcon.orchid.ec.entities.EntityTableInfo;
public interface MeetingRoomDao extends
	ExtendedGenericDao<MeetingRoom, Long>
 {
    void saveDealInfo(MeetingRoomDealInfo dealInfo);
    void saveTableInfo(EntityTableInfo tableInfo);
    EntityTableInfo getTableInfo(Long tableInfoId);
    DataClassific getDataClassific(String code);
    MeetingRoomDealInfo copyAndSaveDealInfo(DealInfo di);
    MeetingRoomDealInfo copyAndSaveDealInfo(DealInfo di, MeetingRoom mainObj, Staff dealStaff);
    Date findLastDealInfo(Long tableInfoId, String activityName);
    /* CUSTOM CODE START(dao,functions,X6Basic_1.0_meetingroom_MeetingRoom,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
}