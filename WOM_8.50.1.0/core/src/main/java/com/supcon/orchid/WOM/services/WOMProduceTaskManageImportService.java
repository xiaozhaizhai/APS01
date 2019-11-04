package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMProduceTaskManage;

public interface WOMProduceTaskManageImportService {

	void saveImportDataLog(WOMProduceTaskManage bizObj, WOMProduceTaskManage oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}