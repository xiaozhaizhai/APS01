package com.supcon.orchid.WOM.services.impl.handler;

import com.supcon.orchid.WOM.enums.DealsEnum;
import com.supcon.orchid.WOM.services.ProcedureReport;
import com.supcon.orchid.services.BAPException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * Created By guding on 2019/2/22 16:05
 */
@Component
public class ActiveChoseHandler {




    @Autowired
    private Map<String,ProcedureReport> activeProcessorMap;

    /**
     *
     * @param type  batch/mse/pda
     * @return
     */
    public ProcedureReport choseProcfeedWay(String type){
        ProcedureReport activeProcessor = activeProcessorMap.get(type + ProcedureReport.class.getSimpleName());
        if (activeProcessor == null) {
            throw new BAPException("未找到实现类！");
        }else {
            return activeProcessor;
        }
    }
    
    /**
     *
     * @param enums  batch/mse/pda
     * @return
     */
    public ProcedureReport choseProcfeedWay(DealsEnum enums){
        return choseProcfeedWay(enums.getType());
    }
}
