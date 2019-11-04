package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMFormulaProcess;

public interface RMFormulaProcessImportService {

	void saveImportDataLog(RMFormulaProcess bizObj, RMFormulaProcess oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}