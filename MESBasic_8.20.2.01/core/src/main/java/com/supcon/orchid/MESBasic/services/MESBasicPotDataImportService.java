package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicPotData;

public interface MESBasicPotDataImportService {

	void saveImportDataLog(MESBasicPotData bizObj, MESBasicPotData oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}