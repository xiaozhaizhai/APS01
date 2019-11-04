package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicObjEquipment;

public interface MESBasicObjEquipmentImportService {

	void saveImportDataLog(MESBasicObjEquipment bizObj, MESBasicObjEquipment oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}