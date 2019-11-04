package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicFunctionInfo;

public interface MESBasicFunctionInfoImportService {

	void saveImportDataLog(MESBasicFunctionInfo bizObj, MESBasicFunctionInfo oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}