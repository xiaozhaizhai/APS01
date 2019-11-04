package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMFormulaType;

public interface RMFormulaTypeImportService {

	void saveImportDataLog(RMFormulaType bizObj, RMFormulaType oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}