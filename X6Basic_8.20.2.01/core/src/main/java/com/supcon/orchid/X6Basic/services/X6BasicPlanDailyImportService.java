package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicPlanDaily;

public interface X6BasicPlanDailyImportService {

	void saveImportDataLog(X6BasicPlanDaily bizObj, X6BasicPlanDaily oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}