package com.supcon.orchid.X6Basic.services;

import com.supcon.orchid.X6Basic.entities.X6BasicSpellRule;

public interface X6BasicSpellRuleImportService {

	void saveImportDataLog(X6BasicSpellRule bizObj, X6BasicSpellRule oldBizObj, String bussinesskeyFieldName, String mainDispalyFieldName);

}