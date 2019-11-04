package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;

public interface MESBasicFactoryModelImportService {

	void saveImportDataLog(MESBasicFactoryModel bizObj, MESBasicFactoryModel oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}