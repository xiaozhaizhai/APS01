package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMBatchingRejectParts;

public interface WOMBatchingRejectPartsImportService {

	void saveImportDataLog(WOMBatchingRejectParts bizObj, WOMBatchingRejectParts oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}