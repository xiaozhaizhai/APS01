package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;

public interface WOMProdTaskActiExelogImportService {

	void saveImportDataLog(WOMProdTaskActiExelog bizObj, WOMProdTaskActiExelog oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}