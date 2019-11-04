package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMPutMaterialException;

public interface WOMPutMaterialExceptionImportService {

	void saveImportDataLog(WOMPutMaterialException bizObj, WOMPutMaterialException oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}