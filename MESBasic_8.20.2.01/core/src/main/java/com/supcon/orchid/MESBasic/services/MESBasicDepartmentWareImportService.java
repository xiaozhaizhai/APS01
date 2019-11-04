package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicDepartmentWare;

public interface MESBasicDepartmentWareImportService {

	void saveImportDataLog(MESBasicDepartmentWare bizObj, MESBasicDepartmentWare oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}