package com.supcon.orchid.WOM.services.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.services.WOMTaskReportingService;
import com.supcon.orchid.WOM.services.WsSyncMaterialProduceInSinglesService;

@Service("wsSyncMaterialProduceInSinglesService")
@Transactional
public class WsSyncMaterialProduceInSinglesServiceImpl implements  WsSyncMaterialProduceInSinglesService {
	
	private WOMTaskReportingService womTaskReportingService;
	
	public void syncMaterialProduceInSingles(long id) {
		WOMTaskReporting womTaskReporting = womTaskReportingService.getTaskReporting(id);
	}
}