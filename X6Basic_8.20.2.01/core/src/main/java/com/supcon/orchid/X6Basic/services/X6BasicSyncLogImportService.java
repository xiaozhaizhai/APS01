package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicSyncLog;

public interface X6BasicSyncLogImportService {

	void saveImportDataLog(X6BasicSyncLog bizObj, X6BasicSyncLog oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}