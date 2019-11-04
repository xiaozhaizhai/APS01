package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicSpellRulePart;

public interface X6BasicSpellRulePartImportService {

	void saveImportDataLog(X6BasicSpellRulePart bizObj, X6BasicSpellRulePart oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}