package com.supcon.orchid.WOM.services;

import java.util.Map;
import java.util.List;

import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicObjWareStore;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.WOM.entities.WOMProdTaskActiExelog;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.foundation.entities.Staff;

public interface WOMInterfaceSelfService {
	
	/**
  	 *  根据活动记录生成投料记录
  	 * 	activeExelog 活动执行记录
  	 *  isPDA 是否PDA执行
	 *  userName  用户名
  	 */
    void addPutinRecordByActiceExelog(WOMProdTaskActiExelog activeExelog,Boolean isPDA, String userName);
    /**
     *  根据活动记录生成请检单
     * 	activeExelog 活动执行记录
     */
    void addApplyCheckByActiveExelog(WOMProdTaskActiExelog activeExelog);
    
    
    /**
     * 需要手工操作的phase，操作之后将批控的phase结束
     * @param phaseID
     * @return
     */
     void endPhaseActive(String phaseID);
     
     /**
      * PDA扫码投料完成时，调用此方法，在MES中生成投料记录，生成活动执行记录，将配料记录的状态改为已投料，将待投料记录修改为已执行
      * @param waitPutinRecordID   待投料记录ID
      * @param userName  投料用户
      * @return
      */
     void addRecordsAndUpdateState(Long waitPutinRecordID,String userName);
  
     /**
      * PDA判断工作单元是否存在方法
      * @param factoryCode
      * @return
      */
     String checkFactoryCode(String factoryCode);
  
     /**
      * PDA手工投料，确认，根据待投料记录ID,更新待投料记录的实际投料数量、物料编码、物料批号、投料人，且在MES中生成投料记录
      * @param confirmFlag
      * @param waitPutinRecordID
      * @param currentNum
      * @param product
      * @param productNum
      * @param userName
      * @param productProperty   判断是物品Code还是Model
      * @return
      */
	 void addPutinRecordsAndUpdateActualNum(Boolean confirmFlag,Long waitPutinRecordID,
			Double currentNum,String product,String productNum, String userName,String productProperty);
	 
	 /**
	  * PDA手工投料：结束，根据待投料记录ID,结束待投料记录
	  * @param waitPutinRecordID
	  * @param userName
	  * @return
	  */
	 void endWaitPutinRecords(Long waitPutinRecordID,String userName);
	 
	 /**
      * PDA手工投料 根据物品编码判断物品是否存在方法
      * @param product   物品编码/代码
      * @param productProperty   物品属性标志
      * @return
      */
	 List<MESBasicProduct> checkProduct(String product,String productProperty);
  
     /**
	  * PDA掺料处理，根据工作单元编码查询有执行中的工序的工作单元
	  * @param factoryCode
	  * @return
	  */
	 List<Map<String, Object>> getProcessingFacList(String factoryCode);
  
     /**
	  * PDA调整/机动处理，根据【不良品处理单ID、配方工序ID用于调整处理】【指令单工序ID、配方工序ID用于机动处理】查询配方工序活动（调整措施）及执行次数、开始/结束状态
	  * @param rejectsDealID
	  * @param formulaProcessID
	  * @param taskProcessID
	  * @return
	  */
	 List<Map<String, Object>> getFormulaProcessActives(Long rejectsDealID,Long formulaProcessID,Long taskProcessID);
  
     /**
	  *PDA调整/机动处理，手工投料，生成活动执行记录、投料单 【activeExeID活动执行记录用于调整处理】【procExeLogID工序执行记录用于机动处理】
	  * @param activeExeID
	  * @param procExeLogID
	  * @param formulaProcActiID
	  * @param currentNum
	  * @param product
	  * @param productNum
	  * @param userName
	  * @param productProperty
	  */
	 void addExeLogAndPutinRecords(Long activeExeID,Long procExeLogID,Long formulaProcActiID,Double currentNum,String product,
			 String productNum, String userName,String productProperty);
  
     /**
	  * PDA机动处理,根据工作单元编码 在工序执行记录表中查询存在执行中的工序且由该工序中存在“可机动执行”的配方工序活动(由配方工序查询)
	  * @param factoryCode
	  * @return
	  */
	 List<WOMProdTaskProcExelog> getmaneuverFacList(String factoryCode);
  
     /**
	  * PDA机动处理，普通检验，生成活动执行记录、发起请检
	  * @param formulaProcActiID
	  * @param procExeLogID
	  * @param userName
	  */
	 void inspectByManeuver(Long formulaProcActiID,Long procExeLogID,String userName);
  
     
     /**
      * 根据工作单元、物品，以及配料仓的设置数据，来查找目的仓与货位
      * @param fac  工作中心
      * @param pro 物品
      * @return
      */
     
     MESBasicObjWareStore  getObjWareStoreByfp(MESBasicFactoryModel fac,MESBasicProduct pro);
     
     
     /**
      * 根据工作单元、物品，以及车间仓的设置数据，来查找目的仓与货位
      * @param fac 工作中心
      * @param pro 物品
      * @return
      */
     MESBasicFacWareMaterial getFacWareMaterialByfp(MESBasicFactoryModel fac,MESBasicProduct pro);
  
     /**
      * PDA进行调整处理，调整结束之后，点击【请检】按钮，调用此方法，然后重新发起请检
      * @param activeExeID
      * @return
      */
     Boolean applyCheckByPDA(Long activeExeID);
     
     /**
  	 * 退料签收
  	 * 
  	 * @param postParams json数据
  	 */
  	 public String recivedRejectReocrd(String postParams);
  	 
  	/**
  	 * 生成报工单
  	 * @param taskID 指令单ID
  	 * @param staff 报工人
  	 * @param reportState 指令单状态
  	 * @param reportNum 报工数量
  	 */
      boolean addTaskReportingTable(String taskID,Staff staff,String reportState,String reportNum);
  	//pims接口测试，获取实时值
	public String getPimsRealValue(String tags);
	//pims接口测试，获取历史值
	public String getPimsHistoryValue(String tags, String startTime, String endTime, int interval, int pageNo, int pageSize);
}
