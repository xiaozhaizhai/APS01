package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMInspect;

public interface WOMInspectImportService {

	void saveImportDataLog(WOMInspect bizObj, WOMInspect oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}