package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMCheckDetail;

public interface RMCheckDetailImportService {

	void saveImportDataLog(RMCheckDetail bizObj, RMCheckDetail oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}