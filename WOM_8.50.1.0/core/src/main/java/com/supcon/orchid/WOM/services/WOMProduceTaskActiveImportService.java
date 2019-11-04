package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMProduceTaskActive;

public interface WOMProduceTaskActiveImportService {

	void saveImportDataLog(WOMProduceTaskActive bizObj, WOMProduceTaskActive oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}