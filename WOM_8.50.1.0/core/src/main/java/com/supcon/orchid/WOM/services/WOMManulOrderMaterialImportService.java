package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMManulOrderMaterial;

public interface WOMManulOrderMaterialImportService {

	void saveImportDataLog(WOMManulOrderMaterial bizObj, WOMManulOrderMaterial oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}