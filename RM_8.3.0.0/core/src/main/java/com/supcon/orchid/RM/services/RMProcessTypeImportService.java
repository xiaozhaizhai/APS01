package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMProcessType;

public interface RMProcessTypeImportService {

	void saveImportDataLog(RMProcessType bizObj, RMProcessType oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}