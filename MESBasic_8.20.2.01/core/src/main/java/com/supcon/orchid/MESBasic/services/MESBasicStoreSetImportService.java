package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicStoreSet;

public interface MESBasicStoreSetImportService {

	void saveImportDataLog(MESBasicStoreSet bizObj, MESBasicStoreSet oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}