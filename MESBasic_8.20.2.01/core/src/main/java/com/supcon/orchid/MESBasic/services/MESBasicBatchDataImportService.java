package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicBatchData;

public interface MESBasicBatchDataImportService {

	void saveImportDataLog(MESBasicBatchData bizObj, MESBasicBatchData oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}