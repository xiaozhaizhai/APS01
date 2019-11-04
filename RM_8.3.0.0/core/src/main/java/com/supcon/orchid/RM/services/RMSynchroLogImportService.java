package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMSynchroLog;

public interface RMSynchroLogImportService {

	void saveImportDataLog(RMSynchroLog bizObj, RMSynchroLog oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}