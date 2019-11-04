package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMWaitPutinRecords;

public interface WOMWaitPutinRecordsImportService {

	void saveImportDataLog(WOMWaitPutinRecords bizObj, WOMWaitPutinRecords oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}