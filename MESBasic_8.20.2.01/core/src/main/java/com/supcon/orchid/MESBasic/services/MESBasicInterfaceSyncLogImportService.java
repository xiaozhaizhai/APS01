package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceSyncLog;

public interface MESBasicInterfaceSyncLogImportService {

	void saveImportDataLog(MESBasicInterfaceSyncLog bizObj, MESBasicInterfaceSyncLog oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}