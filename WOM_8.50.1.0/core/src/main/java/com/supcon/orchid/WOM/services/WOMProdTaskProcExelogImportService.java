package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;

public interface WOMProdTaskProcExelogImportService {

	void saveImportDataLog(WOMProdTaskProcExelog bizObj, WOMProdTaskProcExelog oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}