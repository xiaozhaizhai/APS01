package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicDataTrans;

public interface MESBasicDataTransImportService {

	void saveImportDataLog(MESBasicDataTrans bizObj, MESBasicDataTrans oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}