package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;

public interface MESBasicServiceLoggerImportService {

	void saveImportDataLog(MESBasicServiceLogger bizObj, MESBasicServiceLogger oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}