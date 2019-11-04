package com.supcon.orchid.WOM.services;

import com.supcon.orchid.WOM.entities.WOMProcFeedbackHead;

public interface WOMProcFeedbackHeadImportService {

	void saveImportDataLog(WOMProcFeedbackHead bizObj, WOMProcFeedbackHead oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}