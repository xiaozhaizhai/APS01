package com.supcon.orchid.RM.services;

import com.supcon.orchid.RM.entities.RMCheckDepartmentSet;

public interface RMCheckDepartmentSetImportService {

	void saveImportDataLog(RMCheckDepartmentSet bizObj, RMCheckDepartmentSet oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}