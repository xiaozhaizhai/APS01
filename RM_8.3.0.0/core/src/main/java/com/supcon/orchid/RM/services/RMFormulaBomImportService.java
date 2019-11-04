package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMFormulaBom;

public interface RMFormulaBomImportService {

	void saveImportDataLog(RMFormulaBom bizObj, RMFormulaBom oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}