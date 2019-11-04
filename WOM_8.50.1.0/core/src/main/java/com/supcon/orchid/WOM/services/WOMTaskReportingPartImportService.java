package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;

public interface WOMTaskReportingPartImportService {

	void saveImportDataLog(WOMTaskReportingPart bizObj, WOMTaskReportingPart oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}