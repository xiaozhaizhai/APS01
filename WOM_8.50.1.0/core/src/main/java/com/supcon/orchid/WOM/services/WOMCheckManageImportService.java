package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMCheckManage;

public interface WOMCheckManageImportService {

	void saveImportDataLog(WOMCheckManage bizObj, WOMCheckManage oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}