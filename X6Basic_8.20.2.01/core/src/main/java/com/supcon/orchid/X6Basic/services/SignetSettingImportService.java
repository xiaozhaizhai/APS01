package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.SignetSetting;

public interface SignetSettingImportService {

	void saveImportDataLog(SignetSetting bizObj, SignetSetting oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}