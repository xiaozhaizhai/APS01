package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMPutInManage;

public interface WOMPutInManageImportService {

	void saveImportDataLog(WOMPutInManage bizObj, WOMPutInManage oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}