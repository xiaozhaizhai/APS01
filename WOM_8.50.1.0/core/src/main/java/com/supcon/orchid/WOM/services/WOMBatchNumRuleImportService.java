package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMBatchNumRule;

public interface WOMBatchNumRuleImportService {

	void saveImportDataLog(WOMBatchNumRule bizObj, WOMBatchNumRule oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}