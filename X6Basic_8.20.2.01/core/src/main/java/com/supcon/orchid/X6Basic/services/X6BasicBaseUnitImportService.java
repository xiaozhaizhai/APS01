package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;

public interface X6BasicBaseUnitImportService {

	void saveImportDataLog(X6BasicBaseUnit bizObj, X6BasicBaseUnit oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}