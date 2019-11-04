package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;

public interface WOMBatchingMaterialNeedImportService {

	void saveImportDataLog(WOMBatchingMaterialNeed bizObj, WOMBatchingMaterialNeed oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}