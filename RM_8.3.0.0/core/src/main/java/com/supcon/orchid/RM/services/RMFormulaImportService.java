package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMFormula;

public interface RMFormulaImportService {

	void saveImportDataLog(RMFormula bizObj, RMFormula oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}