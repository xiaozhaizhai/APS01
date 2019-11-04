package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicInterfaceLog;

public interface MESBasicInterfaceLogImportService {

	void saveImportDataLog(MESBasicInterfaceLog bizObj, MESBasicInterfaceLog oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}