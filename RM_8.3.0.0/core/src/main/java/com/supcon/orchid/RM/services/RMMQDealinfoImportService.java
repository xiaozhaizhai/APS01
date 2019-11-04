package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMMQDealinfo;

public interface RMMQDealinfoImportService {

	void saveImportDataLog(RMMQDealinfo bizObj, RMMQDealinfo oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}