package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicBatchRelationship;

public interface MESBasicBatchRelationshipImportService {

	void saveImportDataLog(MESBasicBatchRelationship bizObj, MESBasicBatchRelationship oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}