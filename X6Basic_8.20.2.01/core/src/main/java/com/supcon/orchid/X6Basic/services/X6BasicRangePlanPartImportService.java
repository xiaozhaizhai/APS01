package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicRangePlanPart;

public interface X6BasicRangePlanPartImportService {

	void saveImportDataLog(X6BasicRangePlanPart bizObj, X6BasicRangePlanPart oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}