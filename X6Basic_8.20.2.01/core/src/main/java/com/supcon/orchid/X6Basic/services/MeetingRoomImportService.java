package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.MeetingRoom;

public interface MeetingRoomImportService {

	void saveImportDataLog(MeetingRoom bizObj, MeetingRoom oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}