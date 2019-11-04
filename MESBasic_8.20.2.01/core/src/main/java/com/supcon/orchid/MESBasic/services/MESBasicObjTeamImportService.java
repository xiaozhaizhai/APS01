package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicObjTeam;

public interface MESBasicObjTeamImportService {

	void saveImportDataLog(MESBasicObjTeam bizObj, MESBasicObjTeam oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}