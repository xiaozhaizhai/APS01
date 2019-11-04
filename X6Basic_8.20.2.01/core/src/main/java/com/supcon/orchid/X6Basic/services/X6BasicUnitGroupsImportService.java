package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicUnitGroups;

public interface X6BasicUnitGroupsImportService {

	void saveImportDataLog(X6BasicUnitGroups bizObj, X6BasicUnitGroups oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}