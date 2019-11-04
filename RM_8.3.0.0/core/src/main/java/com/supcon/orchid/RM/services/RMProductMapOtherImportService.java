package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMProductMapOther;

public interface RMProductMapOtherImportService {

	void saveImportDataLog(RMProductMapOther bizObj, RMProductMapOther oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}