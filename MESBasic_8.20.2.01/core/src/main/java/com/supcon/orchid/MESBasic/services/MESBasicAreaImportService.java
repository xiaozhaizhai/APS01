package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicArea;

public interface MESBasicAreaImportService {

	void saveImportDataLog(MESBasicArea bizObj, MESBasicArea oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}