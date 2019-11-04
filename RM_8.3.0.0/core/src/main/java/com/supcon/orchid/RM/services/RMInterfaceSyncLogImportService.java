package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;

public interface RMInterfaceSyncLogImportService {

	void saveImportDataLog(RMInterfaceSyncLog bizObj, RMInterfaceSyncLog oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}