package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMInventoryDetail;

public interface WOMInventoryDetailImportService {

	void saveImportDataLog(WOMInventoryDetail bizObj, WOMInventoryDetail oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}