package com.supcon.orchid.RM.schedule;
import java.util.Date;
import java.util.TimerTask;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.supcon.orchid.RM.services.RMMQDealinfoService;

public class MQScheduleDeal extends TimerTask{
	
	protected final Logger log = LoggerFactory.getLogger(getClass());
    private final String PREFIX = "[MQScheduleDeal]";
    
    @Autowired
	private RMMQDealinfoService mQDealinfoService;
    
	@Override
	public void run() {
        log.info(PREFIX + " Start QMScheduleDeal .");
        Date startTime = new Date();
        try {
        	mQDealinfoService.getMQFormulaDetail();
        } catch (Exception e) {
                log.error(PREFIX + ": error occurs at " + e.getMessage(), e);
        }
        Date endTime = new Date();
        log.info(PREFIX + " MQScheduleDeal data succeed, used:"
                        + (endTime.getTime() - startTime.getTime()));

	}

}
