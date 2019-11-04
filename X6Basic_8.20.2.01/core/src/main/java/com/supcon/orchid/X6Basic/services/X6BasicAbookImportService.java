package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicAbook;

public interface X6BasicAbookImportService {

	void saveImportDataLog(X6BasicAbook bizObj, X6BasicAbook oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}