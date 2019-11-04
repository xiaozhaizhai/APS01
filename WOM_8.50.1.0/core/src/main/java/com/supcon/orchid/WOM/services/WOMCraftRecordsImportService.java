package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMCraftRecords;

public interface WOMCraftRecordsImportService {

	void saveImportDataLog(WOMCraftRecords bizObj, WOMCraftRecords oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}