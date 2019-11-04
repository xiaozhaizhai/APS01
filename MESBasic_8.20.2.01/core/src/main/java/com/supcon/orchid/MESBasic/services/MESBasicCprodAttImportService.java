package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicCprodAtt;

public interface MESBasicCprodAttImportService {

	void saveImportDataLog(MESBasicCprodAtt bizObj, MESBasicCprodAtt oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}