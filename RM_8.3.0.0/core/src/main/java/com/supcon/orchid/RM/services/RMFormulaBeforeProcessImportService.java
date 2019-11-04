package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMFormulaBeforeProcess;

public interface RMFormulaBeforeProcessImportService {

	void saveImportDataLog(RMFormulaBeforeProcess bizObj, RMFormulaBeforeProcess oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}