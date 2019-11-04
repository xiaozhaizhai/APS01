package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMProcessUnitChoice;

public interface RMProcessUnitChoiceImportService {

	void saveImportDataLog(RMProcessUnitChoice bizObj, RMProcessUnitChoice oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}