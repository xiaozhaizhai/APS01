package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMPrepareMaterialPart;

public interface WOMPrepareMaterialPartImportService {

	void saveImportDataLog(WOMPrepareMaterialPart bizObj, WOMPrepareMaterialPart oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}