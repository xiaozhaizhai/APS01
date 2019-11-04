package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMProduceTask;

public interface WOMProduceTaskImportService {

	void saveImportDataLog(WOMProduceTask bizObj, WOMProduceTask oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}