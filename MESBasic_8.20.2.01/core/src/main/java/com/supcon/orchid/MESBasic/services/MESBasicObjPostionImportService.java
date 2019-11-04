package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicObjPostion;

public interface MESBasicObjPostionImportService {

	void saveImportDataLog(MESBasicObjPostion bizObj, MESBasicObjPostion oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}