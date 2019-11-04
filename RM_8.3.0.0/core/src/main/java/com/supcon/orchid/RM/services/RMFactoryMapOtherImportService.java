package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMFactoryMapOther;

public interface RMFactoryMapOtherImportService {

	void saveImportDataLog(RMFactoryMapOther bizObj, RMFactoryMapOther oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}