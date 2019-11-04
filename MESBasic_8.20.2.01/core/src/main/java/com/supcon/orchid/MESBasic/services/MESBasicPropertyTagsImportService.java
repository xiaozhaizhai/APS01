package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicPropertyTags;

public interface MESBasicPropertyTagsImportService {

	void saveImportDataLog(MESBasicPropertyTags bizObj, MESBasicPropertyTags oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}