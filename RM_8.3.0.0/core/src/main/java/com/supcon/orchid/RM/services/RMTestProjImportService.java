package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMTestProj;

public interface RMTestProjImportService {

	void saveImportDataLog(RMTestProj bizObj, RMTestProj oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}