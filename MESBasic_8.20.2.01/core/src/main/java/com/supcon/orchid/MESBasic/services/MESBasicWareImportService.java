package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicWare;

public interface MESBasicWareImportService {

	void saveImportDataLog(MESBasicWare bizObj, MESBasicWare oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}