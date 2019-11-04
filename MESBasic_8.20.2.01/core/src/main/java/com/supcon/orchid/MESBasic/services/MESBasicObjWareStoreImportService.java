package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicObjWareStore;

public interface MESBasicObjWareStoreImportService {

	void saveImportDataLog(MESBasicObjWareStore bizObj, MESBasicObjWareStore oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}