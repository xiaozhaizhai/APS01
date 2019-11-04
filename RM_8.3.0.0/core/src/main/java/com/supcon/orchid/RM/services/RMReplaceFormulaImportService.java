package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMReplaceFormula;

public interface RMReplaceFormulaImportService {

	void saveImportDataLog(RMReplaceFormula bizObj, RMReplaceFormula oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}