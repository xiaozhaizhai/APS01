package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroup;

public interface MESBasicPurchGroupImportService {

	void saveImportDataLog(MESBasicPurchGroup bizObj, MESBasicPurchGroup oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}