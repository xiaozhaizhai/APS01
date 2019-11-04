package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicCommDealInfo;

public interface MESBasicCommDealInfoImportService {

	void saveImportDataLog(MESBasicCommDealInfo bizObj, MESBasicCommDealInfo oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}