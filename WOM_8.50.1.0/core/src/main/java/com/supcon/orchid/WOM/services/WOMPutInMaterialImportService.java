package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMPutInMaterial;

public interface WOMPutInMaterialImportService {

	void saveImportDataLog(WOMPutInMaterial bizObj, WOMPutInMaterial oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}