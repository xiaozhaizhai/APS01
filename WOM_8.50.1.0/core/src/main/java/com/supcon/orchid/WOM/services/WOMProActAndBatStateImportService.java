package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMProActAndBatState;

public interface WOMProActAndBatStateImportService {

	void saveImportDataLog(WOMProActAndBatState bizObj, WOMProActAndBatState oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}