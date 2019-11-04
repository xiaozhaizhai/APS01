package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;

public interface MESBasicSwitcherModelImportService {

	void saveImportDataLog(MESBasicSwitcherModel bizObj, MESBasicSwitcherModel oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}