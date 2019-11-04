package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicClearSinget;

public interface MESBasicClearSingetImportService {

	void saveImportDataLog(MESBasicClearSinget bizObj, MESBasicClearSinget oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}