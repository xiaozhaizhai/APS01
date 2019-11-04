package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegion;

public interface X6BasicTimeRegionImportService {

	void saveImportDataLog(X6BasicTimeRegion bizObj, X6BasicTimeRegion oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}