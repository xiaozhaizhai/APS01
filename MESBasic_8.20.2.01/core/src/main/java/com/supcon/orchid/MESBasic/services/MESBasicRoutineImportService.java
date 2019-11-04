package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;

public interface MESBasicRoutineImportService {

	void saveImportDataLog(MESBasicRoutine bizObj, MESBasicRoutine oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}