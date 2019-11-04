package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMMakeBatOrderPart;

public interface WOMMakeBatOrderPartImportService {

	void saveImportDataLog(WOMMakeBatOrderPart bizObj, WOMMakeBatOrderPart oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}