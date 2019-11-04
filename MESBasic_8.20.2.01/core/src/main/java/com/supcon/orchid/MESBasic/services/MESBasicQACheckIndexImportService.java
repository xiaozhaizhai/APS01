package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicQACheckIndex;

public interface MESBasicQACheckIndexImportService {

	void saveImportDataLog(MESBasicQACheckIndex bizObj, MESBasicQACheckIndex oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}