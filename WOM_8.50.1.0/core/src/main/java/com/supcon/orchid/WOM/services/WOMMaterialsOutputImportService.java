package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMMaterialsOutput;

public interface WOMMaterialsOutputImportService {

	void saveImportDataLog(WOMMaterialsOutput bizObj, WOMMaterialsOutput oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}