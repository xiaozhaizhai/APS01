package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicPurchGroupMember;

public interface MESBasicPurchGroupMemberImportService {

	void saveImportDataLog(MESBasicPurchGroupMember bizObj, MESBasicPurchGroupMember oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}