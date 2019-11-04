package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMForProcessUnit;

public interface RMForProcessUnitImportService {

	void saveImportDataLog(RMForProcessUnit bizObj, RMForProcessUnit oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}