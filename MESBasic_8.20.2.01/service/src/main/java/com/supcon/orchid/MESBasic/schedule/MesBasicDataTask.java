package com.supcon.orchid.MESBasic.schedule;

import com.supcon.mlp.lib.util.DateTime;
import com.supcon.orchid.MESBasic.entities.MESBasicMESServices;
import com.supcon.orchid.MESBasic.entities.MESBasicServiceLogger;
import com.supcon.orchid.MESBasic.services.MESBasicMESServicesService;
import com.supcon.orchid.MESBasic.services.MESBasicOriginalSignalService;
import com.supcon.orchid.MESBasic.services.MESBasicServiceLoggerService;
import com.supcon.orchid.MESBasic.services.MESBasicSignalDataTask;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;
import java.util.TimerTask;

public class MesBasicDataTask extends TimerTask {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    private final String LOG_PREFIX = "[OriginalSignat To BatchData Dispatcher]";

    static private MESBasicMESServices mesService;

    @Autowired
    private MESBasicMESServicesService service;

    @Autowired
    private MESBasicServiceLoggerService logService;

    @Autowired
    private MESBasicSignalDataTask signalDataTask;

    private void initial(){
        if(mesService == null){
            String sql = "valid = 1 and SERVICE_CODE= 'MESBasicHtDispatcher'";
            List<MESBasicMESServices> sList = service.getMESServicess(sql, null);
            if(sList.size() > 0){
                mesService = sList.get(0);
            }else{
                mesService = new MESBasicMESServices();
                mesService.setActive(true);
                mesService.setServiceCode("MESBasicHtDispatcher");
                mesService.setServiceName("信号服务管理调度");
                mesService.setCid(1000L);
                mesService.setOwnerStaffId(1000L);
                service.saveMESServices(mesService, null);
            }
        }
    }
    @Override
    public void run() {
        initial();
        log.info(LOG_PREFIX + " Scheduled task wait to start.");
        //synchronized(syncObj){
        try{
            mesService = service.load(mesService.getId());
            if(mesService != null && mesService.getActive()){
                log.info(LOG_PREFIX + " Scheduled task begin to execute.");

                mesService.setLastRunningTime(new Date());
                service.saveMESServices(mesService, null);

                signalDataTask.batchDeal();
              	signalDataTask.markDeal();

                MESBasicServiceLogger logger = new MESBasicServiceLogger();
                logger.setLogTime(new Date());
                logger.setLogContent("MES原始信号调度程序执行成功。");
                logger.setMesService(mesService);
                logService.saveServiceLogger(logger, null);



                log.info(LOG_PREFIX + " Scheduled task executed.");
            }
            String sql = "delete " + MESBasicServiceLogger.TABLE_NAME + " where create_time < ?";
            logService.deleteLoggerRecord(sql, DateTime.AddMounth(new Date(), -1));
        }catch(Exception e){
            log.error(LOG_PREFIX + "MES原始信号调度调度程序发生异常，" + e.toString());
            if(mesService != null){
                mesService.setActive(false);
                service.mergeMESServices(mesService);
            }
            MESBasicServiceLogger logger = new MESBasicServiceLogger();
            logger.setLogTime(new Date());
            logger.setLogContent("MES原始信号调度调度程序发生数据异常， " + e.getMessage());
            logger.setMesService(mesService);

            logService.saveServiceLogger(logger, null);
        }

    }
}
