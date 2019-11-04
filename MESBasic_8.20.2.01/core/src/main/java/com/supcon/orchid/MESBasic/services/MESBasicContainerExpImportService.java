package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicContainerExp;

public interface MESBasicContainerExpImportService {

	void saveImportDataLog(MESBasicContainerExp bizObj, MESBasicContainerExp oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}