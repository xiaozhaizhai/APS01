package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicPlaceManage;

public interface MESBasicPlaceManageImportService {

	void saveImportDataLog(MESBasicPlaceManage bizObj, MESBasicPlaceManage oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}