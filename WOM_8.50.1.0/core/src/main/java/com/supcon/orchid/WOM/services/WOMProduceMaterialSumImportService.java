package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMProduceMaterialSum;

public interface WOMProduceMaterialSumImportService {

	void saveImportDataLog(WOMProduceMaterialSum bizObj, WOMProduceMaterialSum oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}