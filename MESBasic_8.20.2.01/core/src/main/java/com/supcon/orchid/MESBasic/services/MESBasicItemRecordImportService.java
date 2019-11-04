package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicItemRecord;

public interface MESBasicItemRecordImportService {

	void saveImportDataLog(MESBasicItemRecord bizObj, MESBasicItemRecord oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}