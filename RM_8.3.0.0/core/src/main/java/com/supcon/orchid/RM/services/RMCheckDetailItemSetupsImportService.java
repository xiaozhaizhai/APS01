package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMCheckDetailItemSetups;

public interface RMCheckDetailItemSetupsImportService {

	void saveImportDataLog(RMCheckDetailItemSetups bizObj, RMCheckDetailItemSetups oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}