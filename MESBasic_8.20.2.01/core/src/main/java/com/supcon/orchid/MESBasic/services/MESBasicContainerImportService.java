package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicContainer;

public interface MESBasicContainerImportService {

	void saveImportDataLog(MESBasicContainer bizObj, MESBasicContainer oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}