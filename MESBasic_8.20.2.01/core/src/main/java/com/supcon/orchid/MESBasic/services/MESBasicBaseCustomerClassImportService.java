package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomerClass;

public interface MESBasicBaseCustomerClassImportService {

	void saveImportDataLog(MESBasicBaseCustomerClass bizObj, MESBasicBaseCustomerClass oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}