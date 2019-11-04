package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;

public interface MESBasicFacWareMaterialImportService {

	void saveImportDataLog(MESBasicFacWareMaterial bizObj, MESBasicFacWareMaterial oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}