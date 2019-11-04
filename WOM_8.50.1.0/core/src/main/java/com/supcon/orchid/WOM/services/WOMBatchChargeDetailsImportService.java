package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMBatchChargeDetails;

public interface WOMBatchChargeDetailsImportService {

	void saveImportDataLog(WOMBatchChargeDetails bizObj, WOMBatchChargeDetails oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}