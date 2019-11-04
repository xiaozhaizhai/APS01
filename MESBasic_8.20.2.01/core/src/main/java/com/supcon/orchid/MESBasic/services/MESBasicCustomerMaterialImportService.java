package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicCustomerMaterial;

public interface MESBasicCustomerMaterialImportService {

	void saveImportDataLog(MESBasicCustomerMaterial bizObj, MESBasicCustomerMaterial oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}