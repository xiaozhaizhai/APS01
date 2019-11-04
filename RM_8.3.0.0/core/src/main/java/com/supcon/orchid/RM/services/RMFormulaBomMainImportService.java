package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMFormulaBomMain;

public interface RMFormulaBomMainImportService {

	void saveImportDataLog(RMFormulaBomMain bizObj, RMFormulaBomMain oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}