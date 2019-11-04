package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMBatchTrace;

public interface WOMBatchTraceImportService {

	void saveImportDataLog(WOMBatchTrace bizObj, WOMBatchTrace oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}