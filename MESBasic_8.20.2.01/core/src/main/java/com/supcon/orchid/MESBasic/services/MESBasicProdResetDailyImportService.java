package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicProdResetDaily;

public interface MESBasicProdResetDailyImportService {

	void saveImportDataLog(MESBasicProdResetDaily bizObj, MESBasicProdResetDaily oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}