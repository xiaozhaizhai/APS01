package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicTeamInfo;

public interface X6BasicTeamInfoImportService {

	void saveImportDataLog(X6BasicTeamInfo bizObj, X6BasicTeamInfo oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}