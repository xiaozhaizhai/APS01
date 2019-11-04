package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMForProcessUnitChoice;

public interface RMForProcessUnitChoiceImportService {

	void saveImportDataLog(RMForProcessUnitChoice bizObj, RMForProcessUnitChoice oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}