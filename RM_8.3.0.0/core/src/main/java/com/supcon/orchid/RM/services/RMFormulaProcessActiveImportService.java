package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMFormulaProcessActive;

public interface RMFormulaProcessActiveImportService {

	void saveImportDataLog(RMFormulaProcessActive bizObj, RMFormulaProcessActive oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}