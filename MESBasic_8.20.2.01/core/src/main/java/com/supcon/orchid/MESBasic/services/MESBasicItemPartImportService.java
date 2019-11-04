package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicItemPart;

public interface MESBasicItemPartImportService {

	void saveImportDataLog(MESBasicItemPart bizObj, MESBasicItemPart oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}