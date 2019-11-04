package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMSampleProj;

public interface RMSampleProjImportService {

	void saveImportDataLog(RMSampleProj bizObj, RMSampleProj oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}