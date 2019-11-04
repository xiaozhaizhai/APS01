package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMBatchFactory;

public interface RMBatchFactoryImportService {

	void saveImportDataLog(RMBatchFactory bizObj, RMBatchFactory oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}