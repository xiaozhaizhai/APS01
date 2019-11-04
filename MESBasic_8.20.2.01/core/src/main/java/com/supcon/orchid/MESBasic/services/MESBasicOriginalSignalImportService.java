package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicOriginalSignal;

public interface MESBasicOriginalSignalImportService {

	void saveImportDataLog(MESBasicOriginalSignal bizObj, MESBasicOriginalSignal oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}