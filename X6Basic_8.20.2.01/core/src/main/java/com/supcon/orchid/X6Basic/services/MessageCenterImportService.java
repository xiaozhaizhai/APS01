package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.MessageCenter;

public interface MessageCenterImportService {

	void saveImportDataLog(MessageCenter bizObj, MessageCenter oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}