package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicObjProduct;

public interface MESBasicObjProductImportService {

	void saveImportDataLog(MESBasicObjProduct bizObj, MESBasicObjProduct oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}