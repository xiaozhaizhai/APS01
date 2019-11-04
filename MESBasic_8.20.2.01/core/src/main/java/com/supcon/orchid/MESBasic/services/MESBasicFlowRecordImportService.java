package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicFlowRecord;

public interface MESBasicFlowRecordImportService {

	void saveImportDataLog(MESBasicFlowRecord bizObj, MESBasicFlowRecord oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}