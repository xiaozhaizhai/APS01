package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMRejectReason;

public interface WOMRejectReasonImportService {

	void saveImportDataLog(WOMRejectReason bizObj, WOMRejectReason oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}