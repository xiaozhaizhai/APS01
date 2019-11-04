package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicMailServer;

public interface X6BasicMailServerImportService {

	void saveImportDataLog(X6BasicMailServer bizObj, X6BasicMailServer oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}