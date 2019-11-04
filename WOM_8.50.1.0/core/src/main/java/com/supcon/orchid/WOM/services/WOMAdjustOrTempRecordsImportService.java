package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMAdjustOrTempRecords;

public interface WOMAdjustOrTempRecordsImportService {

	void saveImportDataLog(WOMAdjustOrTempRecords bizObj, WOMAdjustOrTempRecords oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}