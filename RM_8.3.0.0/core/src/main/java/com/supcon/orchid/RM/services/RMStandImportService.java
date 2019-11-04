package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMStand;

public interface RMStandImportService {

	void saveImportDataLog(RMStand bizObj, RMStand oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}