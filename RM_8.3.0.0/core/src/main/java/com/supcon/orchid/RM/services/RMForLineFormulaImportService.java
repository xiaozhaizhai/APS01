package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMForLineFormula;

public interface RMForLineFormulaImportService {

	void saveImportDataLog(RMForLineFormula bizObj, RMForLineFormula oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}