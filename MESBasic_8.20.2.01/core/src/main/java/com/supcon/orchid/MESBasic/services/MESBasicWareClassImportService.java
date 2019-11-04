package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicWareClass;

public interface MESBasicWareClassImportService {

	void saveImportDataLog(MESBasicWareClass bizObj, MESBasicWareClass oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}