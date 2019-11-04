package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicBaseProdList;

public interface MESBasicBaseProdListImportService {

	void saveImportDataLog(MESBasicBaseProdList bizObj, MESBasicBaseProdList oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}