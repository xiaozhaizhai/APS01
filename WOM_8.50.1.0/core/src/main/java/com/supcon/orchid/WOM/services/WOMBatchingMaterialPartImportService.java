package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;

public interface WOMBatchingMaterialPartImportService {

	void saveImportDataLog(WOMBatchingMaterialPart bizObj, WOMBatchingMaterialPart oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}