package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicProdSecUnit;

public interface MESBasicProdSecUnitImportService {

	void saveImportDataLog(MESBasicProdSecUnit bizObj, MESBasicProdSecUnit oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}