package com.supcon.orchid.MESBasic.services;

import com.supcon.orchid.MESBasic.entities.MESBasicProdAttribute;

public interface MESBasicProdAttributeImportService {

	void saveImportDataLog(MESBasicProdAttribute bizObj, MESBasicProdAttribute oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}