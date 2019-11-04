package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicItemSeq;

public interface MESBasicItemSeqImportService {

	void saveImportDataLog(MESBasicItemSeq bizObj, MESBasicItemSeq oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}