package com.supcon.orchid.WOM.schedule;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimerTask;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.RM.services.RMMQDealinfoService;
import com.supcon.orchid.WOM.daos.WOMProduceTaskDao;
import com.supcon.orchid.WOM.enums.DealsEnum;
import com.supcon.orchid.WOM.services.ProcedureReport;
import com.supcon.orchid.WOM.services.WOMExternalService;
import com.supcon.orchid.WOM.services.WOMProduceTaskService;
import com.supcon.orchid.WOM.services.impl.handler.ActiveChoseHandler;

public class WOMMQScheduleDeal extends TimerTask{
	
	protected final Logger log = LoggerFactory.getLogger(getClass());
    private final String PREFIX = "[MQScheduleDeal]";
    
    @Autowired
	private WOMProduceTaskService produceTaskService;
    @Autowired
    private WOMExternalService externalService;
	@Autowired
    private RMMQDealinfoService rMMQDealinfoService;
	@Autowired
	private WOMProduceTaskDao produceTaskDao;
    @Autowired
    private ActiveChoseHandler  choseHandler;
	/*
    * 处理mq工单相关信号
    */
	@Override
	public void run() {
        log.info(PREFIX + " Start QMScheduleDeal .");
        Date startTime = new Date();
        List<RMMQDealinfo> mqInfo = rMMQDealinfoService.getMQWOMDetail();
        Boolean result = false;
        ProcedureReport activeProcessor = choseHandler.choseProcfeedWay(DealsEnum.BATCH);
        try {
                  
 		if (mqInfo != null && mqInfo.size() > 0){
            	for (RMMQDealinfo di : mqInfo){
    				String data = di.getMqValue();
    				String messageId = data.substring(0, 8);
    				if(messageId.equals("00020001")){
    					activeProcessor.mqDealTaskBoolean(di, false);
    					//batch指令单
    					//externalService.mqDealTaskBoolean(di, false);
    				}else if(messageId.equals("00020002")){
    					activeProcessor.mqDealUnitBoolean(di, false);
    					//unit工序
    					//externalService.mqDealUnitBoolean(di, false);
    				}else if(messageId.equals("00020004")){
    					activeProcessor.mqDealPhaseBoolean(di, false);
    					//phase活动
    					//externalService.mqDealPhaseBoolean(di, false);
    				}else if(messageId.equals("00020003") ||messageId.equals("00020005") || messageId.equals("00020006") || messageId.equals("00020007")){
    					activeProcessor.mqEndOperationBoolean(di, false);
    					//externalService.mqEndOperationBoolean(di, false);
    				} 
    				
                	//externalService.mqStartPhase(di,false);
                	//externalService.mqEndPhase(di,false);
                	//externalService.mqStartPhaseAddPutIn(di,false);
                	//externalService.mqStartPhaseAddInspect(di,false);

            	}
            }
            	
        	//produceTaskService.dealMQDate();
        } catch (Exception e) {
                log.error(PREFIX + ": error occurs at " + e.getMessage(), e);
        }
        Date endTime = new Date();
        log.info(PREFIX + " MQScheduleDeal data succeed, used:"
                        + (endTime.getTime() - startTime.getTime()));

	}
	
}
