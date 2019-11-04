package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMManulOrderMain;

public interface WOMManulOrderMainImportService {

	void saveImportDataLog(WOMManulOrderMain bizObj, WOMManulOrderMain oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}