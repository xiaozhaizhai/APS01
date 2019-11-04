package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicProdDealInfo;

public interface MESBasicProdDealInfoImportService {

	void saveImportDataLog(MESBasicProdDealInfo bizObj, MESBasicProdDealInfo oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}