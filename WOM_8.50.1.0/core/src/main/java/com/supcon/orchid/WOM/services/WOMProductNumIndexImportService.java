package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMProductNumIndex;

public interface WOMProductNumIndexImportService {

	void saveImportDataLog(WOMProductNumIndex bizObj, WOMProductNumIndex oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}