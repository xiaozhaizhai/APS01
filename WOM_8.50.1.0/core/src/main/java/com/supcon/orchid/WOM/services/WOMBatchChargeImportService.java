package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMBatchCharge;

public interface WOMBatchChargeImportService {

	void saveImportDataLog(WOMBatchCharge bizObj, WOMBatchCharge oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}