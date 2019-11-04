package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicInvolveItemsetups;

public interface MESBasicInvolveItemsetupsImportService {

	void saveImportDataLog(MESBasicInvolveItemsetups bizObj, MESBasicInvolveItemsetups oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}