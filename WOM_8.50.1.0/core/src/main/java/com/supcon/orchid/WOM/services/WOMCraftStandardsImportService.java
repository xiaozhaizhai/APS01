package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMCraftStandards;

public interface WOMCraftStandardsImportService {

	void saveImportDataLog(WOMCraftStandards bizObj, WOMCraftStandards oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}