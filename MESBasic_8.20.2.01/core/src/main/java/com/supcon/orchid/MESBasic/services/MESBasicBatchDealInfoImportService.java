package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicBatchDealInfo;

public interface MESBasicBatchDealInfoImportService {

	void saveImportDataLog(MESBasicBatchDealInfo bizObj, MESBasicBatchDealInfo oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}