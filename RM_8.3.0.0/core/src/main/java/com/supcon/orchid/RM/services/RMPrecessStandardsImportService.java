package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMPrecessStandards;

public interface RMPrecessStandardsImportService {

	void saveImportDataLog(RMPrecessStandards bizObj, RMPrecessStandards oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}