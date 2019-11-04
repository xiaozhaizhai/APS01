package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicNodeType;

public interface MESBasicNodeTypeImportService {

	void saveImportDataLog(MESBasicNodeType bizObj, MESBasicNodeType oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}