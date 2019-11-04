package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriodPart;

public interface X6BasicAccountPeriodPartImportService {

	void saveImportDataLog(X6BasicAccountPeriodPart bizObj, X6BasicAccountPeriodPart oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}