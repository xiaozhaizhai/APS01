package com.supcon.orchid.WOM.services;

import java.util.Map;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.WOM.entities.WOMResult;


/**
 * Created By guding on 2019/2/22 15:22
 */
public interface ProcedureReport {

    /**
     * 指令单开始
     * @param resultMap
     * @return
     */
    WOMResult startTask(Map<String, Object> resultMap);
    
    
    /**
     * 指令单结束
     * @param resultMap
     * @return
     */
    WOMResult endTask(Map<String, Object> resultMap);
    
    
    /**
     * 工序开始
     * @param resultMap
     * @return
     */
    WOMResult startProcess(Map<String, Object> resultMap);
    
    
    /**
     * 工序结束
     * @param resultMap
     * @return
     */
    WOMResult endProcess(Map<String, Object> resultMap);

   
	/**
	 * 开始活动
	 * @param resultMap
	 * @return
	 */
    WOMResult startActive(Map<String, Object> resultMap);


    /**
     * 结束活动
     * @param resultMap
     * @return
     */
    WOMResult endActive(Map<String, Object> resultMap);
    
    
    /**
     * 机动活动开始
     * @param resultMap
     * @return
     */
    WOMResult adjustStartActive(Map<String, Object> resultMap);
    
    
    /**
     * 机动活动结束
     * @param resultMap
     * @return
     */
    WOMResult adjustEndActive(Map<String, Object> resultMap);
    

    /**
     * 下推请检单
     * @param resultMap
     * @return
     */
    WOMResult addInspect(Map<String, Object> resultMap);
    
    
    /**
     * 下推待投料记录
     * @param resultMap
     * @return
     */
    WOMResult addwaitPutInRecord(Map<String, Object> resultMap); 
    
    
    /**
     * 生成报工单
     * @param resultMap
     * @return
     */
    WOMResult addTaskReport(Map<String, Object> resultMap); 

    
    /**
     * 生成投料单
     * @param resultMap
     * @return
     */
    WOMResult addPutInRecord(Map<String, Object> resultMap); 
  
      //批控接口
    public Boolean mqDealTaskBoolean(RMMQDealinfo di, Boolean dealError);
    
    public Boolean mqDealUnitBoolean(RMMQDealinfo di, Boolean dealError);
    
    public Boolean mqDealPhaseBoolean(RMMQDealinfo di,Boolean dealError);
    
    public Boolean mqEndOperationBoolean(RMMQDealinfo di,Boolean dealError);


  
  	//检测活动开始顺序是否允许
    WOMResult checkSort(Long activeId);

}
