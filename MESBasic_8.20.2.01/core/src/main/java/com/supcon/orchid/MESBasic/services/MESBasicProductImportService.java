package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicProduct;

public interface MESBasicProductImportService {

	void saveImportDataLog(MESBasicProduct bizObj, MESBasicProduct oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}