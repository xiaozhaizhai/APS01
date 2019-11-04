package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicSignature;

public interface X6BasicSignatureImportService {

	void saveImportDataLog(X6BasicSignature bizObj, X6BasicSignature oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}