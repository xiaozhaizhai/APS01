package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMActiveExelog;

public interface WOMActiveExelogImportService {

	void saveImportDataLog(WOMActiveExelog bizObj, WOMActiveExelog oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}