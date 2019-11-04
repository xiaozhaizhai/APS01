package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMDayBatchPlanParts;

public interface WOMDayBatchPlanPartsImportService {

	void saveImportDataLog(WOMDayBatchPlanParts bizObj, WOMDayBatchPlanParts oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}