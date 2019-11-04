package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.UsedRecord;

public interface UsedRecordImportService {

	void saveImportDataLog(UsedRecord bizObj, UsedRecord oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}