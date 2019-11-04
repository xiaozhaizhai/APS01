package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicMaintainLog;

public interface MESBasicMaintainLogImportService {

	void saveImportDataLog(MESBasicMaintainLog bizObj, MESBasicMaintainLog oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}