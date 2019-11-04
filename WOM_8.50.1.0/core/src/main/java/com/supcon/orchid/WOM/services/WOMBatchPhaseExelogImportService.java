package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMBatchPhaseExelog;

public interface WOMBatchPhaseExelogImportService {

	void saveImportDataLog(WOMBatchPhaseExelog bizObj, WOMBatchPhaseExelog oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}