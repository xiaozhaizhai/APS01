package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMProductReplace;

public interface RMProductReplaceImportService {

	void saveImportDataLog(RMProductReplace bizObj, RMProductReplace oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}