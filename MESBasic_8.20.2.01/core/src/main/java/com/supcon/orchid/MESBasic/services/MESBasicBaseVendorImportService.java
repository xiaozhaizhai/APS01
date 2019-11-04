package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;

public interface MESBasicBaseVendorImportService {

	void saveImportDataLog(MESBasicBaseVendor bizObj, MESBasicBaseVendor oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}