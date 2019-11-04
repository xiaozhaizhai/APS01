package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicDocumentClasses;

public interface X6BasicDocumentClassesImportService {

	void saveImportDataLog(X6BasicDocumentClasses bizObj, X6BasicDocumentClasses oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}