package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMAdjustOrTempHead;

public interface WOMAdjustOrTempHeadImportService {

	void saveImportDataLog(WOMAdjustOrTempHead bizObj, WOMAdjustOrTempHead oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}