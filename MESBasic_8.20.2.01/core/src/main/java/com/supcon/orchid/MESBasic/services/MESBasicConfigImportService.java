package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicConfig;

public interface MESBasicConfigImportService {

	void saveImportDataLog(MESBasicConfig bizObj, MESBasicConfig oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}