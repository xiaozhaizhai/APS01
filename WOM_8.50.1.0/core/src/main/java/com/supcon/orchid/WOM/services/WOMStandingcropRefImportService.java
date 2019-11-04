package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMStandingcropRef;

public interface WOMStandingcropRefImportService {

	void saveImportDataLog(WOMStandingcropRef bizObj, WOMStandingcropRef oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}