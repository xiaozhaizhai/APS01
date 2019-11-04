package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicProductCost;

public interface MESBasicProductCostImportService {

	void saveImportDataLog(MESBasicProductCost bizObj, MESBasicProductCost oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}