package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;

public interface MESBasicEquipmentImportService {

	void saveImportDataLog(MESBasicEquipment bizObj, MESBasicEquipment oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}