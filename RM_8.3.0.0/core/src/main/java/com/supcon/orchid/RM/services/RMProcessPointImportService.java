package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMProcessPoint;

public interface RMProcessPointImportService {

	void saveImportDataLog(RMProcessPoint bizObj, RMProcessPoint oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}