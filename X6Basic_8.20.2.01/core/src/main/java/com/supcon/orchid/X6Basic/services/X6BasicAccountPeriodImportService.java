package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriod;

public interface X6BasicAccountPeriodImportService {

	void saveImportDataLog(X6BasicAccountPeriod bizObj, X6BasicAccountPeriod oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}