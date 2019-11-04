package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMMakeBatOrderHead;

public interface WOMMakeBatOrderHeadImportService {

	void saveImportDataLog(WOMMakeBatOrderHead bizObj, WOMMakeBatOrderHead oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}