package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicSyncConfigs;

public interface X6BasicSyncConfigsImportService {

	void saveImportDataLog(X6BasicSyncConfigs bizObj, X6BasicSyncConfigs oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}