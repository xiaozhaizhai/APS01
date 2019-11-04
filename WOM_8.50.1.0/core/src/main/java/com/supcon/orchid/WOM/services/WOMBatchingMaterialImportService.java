package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;

public interface WOMBatchingMaterialImportService {

	void saveImportDataLog(WOMBatchingMaterial bizObj, WOMBatchingMaterial oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}