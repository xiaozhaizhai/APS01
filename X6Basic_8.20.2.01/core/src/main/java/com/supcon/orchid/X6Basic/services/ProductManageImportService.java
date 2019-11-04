package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.ProductManage;

public interface ProductManageImportService {

	void saveImportDataLog(ProductManage bizObj, ProductManage oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}