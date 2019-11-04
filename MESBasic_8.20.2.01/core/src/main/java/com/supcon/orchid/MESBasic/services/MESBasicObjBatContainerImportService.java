package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicObjBatContainer;

public interface MESBasicObjBatContainerImportService {

	void saveImportDataLog(MESBasicObjBatContainer bizObj, MESBasicObjBatContainer oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}