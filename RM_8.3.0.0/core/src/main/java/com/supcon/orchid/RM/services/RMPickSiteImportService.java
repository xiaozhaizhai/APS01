package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMPickSite;

public interface RMPickSiteImportService {

	void saveImportDataLog(RMPickSite bizObj, RMPickSite oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}