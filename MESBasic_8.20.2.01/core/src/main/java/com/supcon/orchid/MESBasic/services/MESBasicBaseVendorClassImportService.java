package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendorClass;

public interface MESBasicBaseVendorClassImportService {

	void saveImportDataLog(MESBasicBaseVendorClass bizObj, MESBasicBaseVendorClass oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}