package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMQualityInspect;

public interface WOMQualityInspectImportService {

	void saveImportDataLog(WOMQualityInspect bizObj, WOMQualityInspect oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}