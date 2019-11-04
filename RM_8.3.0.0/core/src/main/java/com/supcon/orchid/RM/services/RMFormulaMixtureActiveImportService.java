package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMFormulaMixtureActive;

public interface RMFormulaMixtureActiveImportService {

	void saveImportDataLog(RMFormulaMixtureActive bizObj, RMFormulaMixtureActive oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}