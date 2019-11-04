package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicProdattrel;

public interface MESBasicProdattrelImportService {

	void saveImportDataLog(MESBasicProdattrel bizObj, MESBasicProdattrel oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}