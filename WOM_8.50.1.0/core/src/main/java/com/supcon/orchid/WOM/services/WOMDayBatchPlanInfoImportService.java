package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMDayBatchPlanInfo;

public interface WOMDayBatchPlanInfoImportService {

	void saveImportDataLog(WOMDayBatchPlanInfo bizObj, WOMDayBatchPlanInfo oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}