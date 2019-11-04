package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;

public interface MESBasicMESServicesImportService {

	void saveImportDataLog(MESBasicMESServices bizObj, MESBasicMESServices oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}