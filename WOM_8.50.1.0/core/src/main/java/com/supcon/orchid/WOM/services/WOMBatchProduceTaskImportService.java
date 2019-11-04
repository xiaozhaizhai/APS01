package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMBatchProduceTask;

public interface WOMBatchProduceTaskImportService {

	void saveImportDataLog(WOMBatchProduceTask bizObj, WOMBatchProduceTask oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}