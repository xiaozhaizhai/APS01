package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMPrepareMaterial;

public interface WOMPrepareMaterialImportService {

	void saveImportDataLog(WOMPrepareMaterial bizObj, WOMPrepareMaterial oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}