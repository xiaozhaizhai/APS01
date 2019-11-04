package com.supcon.orchid.WOM.services;

import java.util.List;
import java.util.Map;

import org.codehaus.jettison.json.JSONObject;

import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;

/*
 * @author yj
 * /工单对外接口类
 */
public interface WOMExternalService {

  	/**
	 * 产品批次查询，查询工单的基础信息
	 * @author yj
	 * @param productID 产品ID
	 * @param batchNum 批次号
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param ProduceTaskID 生产工单ID
	 * @return json
			productID：产品id
			productName：产品名称
			productBatchNum:生产批号
			produceTaskID：工单ID
			produceTaskTime：生产日期
			workShop：车间（分公司）
			factoryId：生产线
			amount：数量
			productBaseUnit：单位id
			Process：工序属性
	 */
	public String getProBatch(String productID,String batchNum,String startTime,String endTime,String ProduceTaskID, String isProduct);
	
  	/**
	 * 产品批次查询，得到原料与产品的数据
	 * @author yj
	 * @param batchNum 批次号
	 * @return json
			productID：产品id
			productName：产品名称
			productBatchNum:生产批号
			produceTaskID：工单ID
			produceTaskTime：生产日期
			workShop：车间（分公司）
			factoryId：生产线
			amount：数量
			productBaseUnit：单位id
			process:工序
	 */
	public String getAllData(String batchNum);
  
	public String getData(String batchNum,String type);
	
	/**
	 * 工单信息查询，工单详细信息参照页面的url
	 * @author yj
	 * @param batchNum 批次号
	 * @return url
	 */
	public String getProduceTaskPartUrl(String batchNum);
	
	/**
	 * 获取关键工艺参数，批号对应的所有工艺参数
	 * @author yj
	 * @param batchNum 批号
	 * @return json
			eactiveId：工序活动id
			quota：指标
			stValue:标准值
			overrunFlag：统计超限
			limitInter：扫描间隔（超限）
			upperLimit：上限
			maxLimit：上上限
			lowerLimit：下限
			loweMxLimit：下下限
			fluctuateFlag：统计波动
			flucInter：波动扫描间隔(秒)
			flucUpperLimit：波动上限
			flucLowerLimit：波动下限
	 */
	public String getPrecessStandards(String batchNum);

/////////////////////////////////////////////////////////////////////工单模块接口
	/**
	 * 活动开始
	 * @param map
	 * @return
	 */
	public Map<String, Object>  startActive(Map<String, Object> map);
	/**
	 * 机动活动开始
	 * @param map
	 * @return
	 */
	public Map<String, Object>  adjustStartActive(Map<String, Object> map);
	/**
	 * 活动结束
	 * @param map
	 * @return
	 */
	public Map<String, Object>  endActive(Map<String, Object> map);
	/**
	 * 机动活动结束
	 * @param map
	 * @return
	 */
	public Map<String, Object>  adjustEndActive(Map<String, Object> map);
	/**
	 * 工序开始
	 * @param map
	 * @return
	 */
	public Map<String, Object>  startProcess(Map<String, Object> map);
	
	/**
	 * 工序结束
	 * @param map
	 * @return
	 */
	public Map<String, Object>  endProcess(Map<String,Object>map);
	
	/**
	 * 指令单开始
	 * @param map
	 * @return
	 */
	public Map<String, Object>  startTask(Map<String,Object>map);

	/**
	 * 指令单结束
	 * @param map
	 * @return
	 */
	public Map<String, Object>  endTask(Map<String,Object>map);
	
	/**
	 * 下推待投料记录
	 * @param map
	 * @return
	 */
	public Map<String, Object>  addwaitPutInRecord(Map<String,Object>map);

	/**
	 * 下推请检单
	 * @param map
	 * @return
	 */
	public Map<String, Object>  addInspect(Map<String,Object>map);
	
	/**
	 * 生成报工单
	 * @param map
	 * @return
	 */
	public Map<String, Object>  addTaskReport(Map<String,Object>map);
	
	/**
	 * 生成投料单
	 * @param map
	 * @param mapList
	 * @return
	 */
	public Map<String, Object>  addPutInRecord(Map<String, Object> map,List<Map<String, Object>> mapList);
	
	////////////////////////////////////////////////////////////批控同步MES
	//////////////////////////////////////////////////////////batch
	/**00020001
	 * 批控开始指令单
	 * @return
	 */
	public Boolean  mqStartTask(RMMQDealinfo di,Boolean dealError,WOMProduceTask prodTask,JSONObject batch,List<Map<String, String>> logMap);
	
	/**00020001
	 * 批控结束指令单
	 * @return
	 */
	public Boolean  mqEndTask(RMMQDealinfo di,Boolean dealError,WOMProduceTask prodTask,JSONObject batch,List<Map<String, String>> logMap);
	
	/**00020001
	 *批控结束指令单生成报工单 
	 * @return
	 */
	public Boolean mqEndTaskToAddReport(RMMQDealinfo di,Boolean dealError,WOMProduceTask prodTask,JSONObject batch,List<Map<String, String>> logMap);
	
	/**00020001
	 * 批控放弃指令单
	 * @param di
	 * @param dealError
	 * @param prodTask
	 * @param batch
	 * @param logMap
	 * @return
	 */
	public Boolean mqAbortTask(RMMQDealinfo di,Boolean dealError,WOMProduceTask prodTask,JSONObject batch,List<Map<String, String>> logMap);
	
	/**00020001
	 * 批控暂停指令单
	 * @param di
	 * @param dealError
	 * @param prodTask
	 * @param batch
	 * @param logMap
	 * @return
	 */
	public Boolean mqStopTask(RMMQDealinfo di,Boolean dealError,WOMProduceTask prodTask,JSONObject batch,List<Map<String, String>> logMap);
	
	/**00020001
	 * 批控处理指令单大方法，其中包括：
	 * 开始指令单，结束指令单，结束生成报工单，放弃，暂停指令单
	 * @param di
	 * @param result
	 * @return
	 */
	public Boolean mqDealTaskBoolean(RMMQDealinfo di,Boolean dealError);
//////////////////////////////////////////////////////////////////////////////////////unit	
	
	/**00020002
	 * 批控开始Unit
	 * @return
	 */
	public Boolean mqStartUnit(RMMQDealinfo di,Boolean dealError,WOMProduceTask prodTask,List<Map<String, String>> logMap,Long startTimeLong,WOMProdTaskProcExelog procExeLog, WOMProduceTaskProcess produceTaskProcess,String batchUnitId, String unitEquipID);
	
	/**00020002
	 * 批控结束Unit
	 * @return
	 */
	public Boolean mqEndUnit(RMMQDealinfo di,Boolean dealError,WOMProduceTask prodTask,List<Map<String, String>> logMap,Long startTimeLong,Long endTimeLong,WOMProdTaskProcExelog procExeLog, WOMProduceTaskProcess produceTaskProcess,String batchUnitId);
	
	/**
	 * 00020002
	 * //如果有设备编码，则修改相关数据的设备
	 * @param di
	 * @param dealError
	 * @return
	 */
	public Boolean updateEquipment(RMMQDealinfo di, Boolean dealError);
	
	/**
	 * 00020002
	 * 批控处理unit工序大方法，其中包括：
	 * 开始unit，结束unit及修改相关设备
	 * @param di
	 * @param dealError
	 * @return
	 */
	public Boolean mqDealUnitBoolean(RMMQDealinfo di,Boolean dealError);
////////////////////////////////////////////////////////////////////////////////////////phase
	
	/**
	 * 批控开始Phase
	 * @return
	 */
	public Boolean mqStartPhase(RMMQDealinfo di,Boolean dealError);
	
	/**
	 * 批控结束Phase
	 * @return
	 */
	public Boolean mqEndPhase(RMMQDealinfo di,Boolean dealError);
	
	/**
	 * Phase检验活动生成请检单
	 * @return
	 */
	public Boolean mqStartPhaseAddInspect(RMMQDealinfo di,Boolean dealError);
	
	/**
	 * Phase投料投配料活动生成投料单
	 * @return
	 */
	public Boolean mqStartPhaseAddPutIn(RMMQDealinfo di,Boolean dealError);
	
	/**
	 * 00020004
	 * mq处理phase活动大方法，其中包括：
	 * 开始phase，结束phase，投料投配料活动生成投料单，检验活动生成请检单，修改phase
	 * @param di
	 * @param dealError
	 * @return
	 */
	public Boolean mqDealPhaseBoolean(RMMQDealinfo di,Boolean dealError);
	
	/////////////////////////////////////////////////////////////////////////////////
	/**
	 * Operation结束
	 * @param di
	 * @param result
	 * @return
	 */
	public Boolean mqEndOperationBoolean(RMMQDealinfo di,Boolean dealError);
	
	/**
	 * 组织配方工单日志参数
	 * @param isSuccess
	 * @param ids
	 * @param returnValue
	 * @param operationType
	 * @param logids
	 * @param isIgnore
	 * @param logTypeDes
	 * @return
	 */
    public List<Map<String, String>> setWorkOrderMqLogMap(Boolean isSuccess, String ids, String returnValue, String operationType, String logids, String isIgnore, String logTypeDes);
    
    /**
     * 根据参数插入工单日志
     * @param maplist
     * @param dealError
     */
    public void insertLog(List<Map<String, String>> maplist, Boolean dealError);
    
    /**
     * 把mq记录的valid改成0,即删除
     * @param di
     */
    public void deleteMq(RMMQDealinfo di);
  
     /**
     * mq处理Phase
     * @param di
     * @param dealError
     * @return
     */
    public Boolean dealMqPhaseDate(RMMQDealinfo di, Boolean dealError);
    
    /**
     * mq改变phase
     * @param di
     * @param dealError
     * @return
     */
    public Boolean dealMqPhaseDateChange(RMMQDealinfo di, Boolean dealError); 
}
