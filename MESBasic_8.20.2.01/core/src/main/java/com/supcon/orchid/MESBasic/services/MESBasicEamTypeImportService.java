package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicEamType;

public interface MESBasicEamTypeImportService {

	void saveImportDataLog(MESBasicEamType bizObj, MESBasicEamType oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}