package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicBatchInformation;

public interface MESBasicBatchInformationImportService {

	void saveImportDataLog(MESBasicBatchInformation bizObj, MESBasicBatchInformation oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}