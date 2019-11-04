package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMFormulaBomMaterial;

public interface RMFormulaBomMaterialImportService {

	void saveImportDataLog(RMFormulaBomMaterial bizObj, RMFormulaBomMaterial oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}