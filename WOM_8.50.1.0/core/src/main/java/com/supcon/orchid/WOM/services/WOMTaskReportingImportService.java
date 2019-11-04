package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMTaskReporting;

public interface WOMTaskReportingImportService {

	void saveImportDataLog(WOMTaskReporting bizObj, WOMTaskReporting oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}