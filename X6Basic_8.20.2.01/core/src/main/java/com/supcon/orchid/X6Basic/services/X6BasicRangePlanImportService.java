package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicRangePlan;

public interface X6BasicRangePlanImportService {

	void saveImportDataLog(X6BasicRangePlan bizObj, X6BasicRangePlan oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}