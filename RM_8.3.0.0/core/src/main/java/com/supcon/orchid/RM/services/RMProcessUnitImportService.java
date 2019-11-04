package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMProcessUnit;

public interface RMProcessUnitImportService {

	void saveImportDataLog(RMProcessUnit bizObj, RMProcessUnit oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}