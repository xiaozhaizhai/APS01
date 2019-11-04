package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMInventoryRecord;

public interface WOMInventoryRecordImportService {

	void saveImportDataLog(WOMInventoryRecord bizObj, WOMInventoryRecord oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}