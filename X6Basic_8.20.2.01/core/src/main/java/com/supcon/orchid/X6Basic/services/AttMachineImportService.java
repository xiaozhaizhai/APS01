package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.AttMachine;

public interface AttMachineImportService {

	void saveImportDataLog(AttMachine bizObj, AttMachine oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}