package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMFormulaChange;

public interface RMFormulaChangeImportService {

	void saveImportDataLog(RMFormulaChange bizObj, RMFormulaChange oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}