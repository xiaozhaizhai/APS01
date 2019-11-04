package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicPositionDeal;

public interface MESBasicPositionDealImportService {

	void saveImportDataLog(MESBasicPositionDeal bizObj, MESBasicPositionDeal oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}