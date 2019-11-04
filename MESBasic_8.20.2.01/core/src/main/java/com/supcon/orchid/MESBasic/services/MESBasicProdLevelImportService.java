package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicProdLevel;

public interface MESBasicProdLevelImportService {

	void saveImportDataLog(MESBasicProdLevel bizObj, MESBasicProdLevel oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}