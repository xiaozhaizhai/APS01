package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMTaskReportManage;

public interface WOMTaskReportManageImportService {

	void saveImportDataLog(WOMTaskReportManage bizObj, WOMTaskReportManage oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}