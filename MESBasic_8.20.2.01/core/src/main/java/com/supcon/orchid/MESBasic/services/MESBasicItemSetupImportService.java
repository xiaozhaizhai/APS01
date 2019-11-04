package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;

public interface MESBasicItemSetupImportService {

	void saveImportDataLog(MESBasicItemSetup bizObj, MESBasicItemSetup oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}