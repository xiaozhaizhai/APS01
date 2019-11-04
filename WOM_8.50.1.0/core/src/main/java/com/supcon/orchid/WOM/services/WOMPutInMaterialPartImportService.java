package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;

public interface WOMPutInMaterialPartImportService {

	void saveImportDataLog(WOMPutInMaterialPart bizObj, WOMPutInMaterialPart oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}