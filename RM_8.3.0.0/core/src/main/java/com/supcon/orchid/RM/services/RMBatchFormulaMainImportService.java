package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMBatchFormulaMain;

public interface RMBatchFormulaMainImportService {

	void saveImportDataLog(RMBatchFormulaMain bizObj, RMBatchFormulaMain oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}