package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicBaseCustomer;

public interface MESBasicBaseCustomerImportService {

	void saveImportDataLog(MESBasicBaseCustomer bizObj, MESBasicBaseCustomer oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}