package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMBatchProdTaskPart;

public interface WOMBatchProdTaskPartImportService {

	void saveImportDataLog(WOMBatchProdTaskPart bizObj, WOMBatchProdTaskPart oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}