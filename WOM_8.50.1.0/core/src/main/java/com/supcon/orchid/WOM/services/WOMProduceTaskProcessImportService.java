package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;

public interface WOMProduceTaskProcessImportService {

	void saveImportDataLog(WOMProduceTaskProcess bizObj, WOMProduceTaskProcess oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}