package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegionPar;

public interface X6BasicTimeRegionParImportService {

	void saveImportDataLog(X6BasicTimeRegionPar bizObj, X6BasicTimeRegionPar oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}