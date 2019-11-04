package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMLineFormula;

public interface RMLineFormulaImportService {

	void saveImportDataLog(RMLineFormula bizObj, RMLineFormula oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}