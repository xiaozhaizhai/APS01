package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicTankModel;

public interface MESBasicTankModelImportService {

	void saveImportDataLog(MESBasicTankModel bizObj, MESBasicTankModel oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}