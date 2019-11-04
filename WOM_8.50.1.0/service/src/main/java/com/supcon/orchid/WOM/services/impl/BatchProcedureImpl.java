package com.supcon.orchid.WOM.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.WOM.daos.WOMProdTaskProcExelogDao;
import com.supcon.orchid.WOM.daos.WOMProduceTaskDao;
import com.supcon.orchid.WOM.daos.WOMProduceTaskProcessDao;
import com.supcon.orchid.WOM.entities.WOMProdTaskProcExelog;
import com.supcon.orchid.WOM.entities.WOMProduceTask;
import com.supcon.orchid.WOM.entities.WOMProduceTaskProcess;
import com.supcon.orchid.WOM.entities.WOMResult;
import com.supcon.orchid.WOM.services.WOMExternalService;
import com.supcon.orchid.foundation.entities.SystemCode;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created By guding on 2019/2/22 15:41
 */
@Transactional
@Component("batchProcedureReport")
public class BatchProcedureImpl extends ProcedureAbstract {
	@Autowired
	private WOMProduceTaskDao produceTaskDao;
	@Resource 
	private WOMExternalService externalService;
	@Autowired
	private WOMProdTaskProcExelogDao prodTaskProcExelogDao;
	@Autowired
	private WOMProduceTaskProcessDao produceTaskProcessDao;
    /**
     * 开始活动
     *
     * @param json
     * @return
     */
    @Override
    public WOMResult startActive(Map<String, Object> resultMap) {    	
    	return null;
    }

    /**
     * 结束活动
     *
     * @param json
     * @return
     */
    @Override
    public WOMResult endActive(Map<String, Object> resultMap) {
        return null;
    }

	@Override
	public WOMResult startTask(Map<String, Object> resultMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WOMResult endTask(Map<String, Object> resultMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WOMResult addInspect(Map<String, Object> resultMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WOMResult addwaitPutInRecord(Map<String, Object> resultMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WOMResult addTaskReport(Map<String, Object> resultMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WOMResult addPutInRecord(Map<String, Object> resultMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WOMResult startProcess(Map<String, Object> resultMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WOMResult endProcess(Map<String, Object> resultMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WOMResult adjustStartActive(Map<String, Object> resultMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WOMResult adjustEndActive(Map<String, Object> resultMap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	/**
	 * 批控处理指令单大方法，其中包括：
	 * 开始指令单，结束指令单，结束生成报工单
	 * @param di
	 * @param dealError
	 * @return
	 */
    @Transactional
    @Override
	public Boolean mqDealTaskBoolean(RMMQDealinfo di, Boolean dealError) {
		Boolean result=true;
		String data = di.getMqValue();
        String messageId = data.substring(0, 8);
        String body = data.substring(8, data.length());
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        if (messageId.equals("00020001")){
            if (body != null && body.contains("ExeStat") && body.contains("ExeStatOld")) {//只有当数据中包含当前执行状态和之前执行状态，表示执行启动停止等操作
                //isSuccess = dealMqBatchDate(di, false);
                data = di.getMqValue().substring(8, di.getMqValue().length());
                if (null == data || "".equals(data)) {
                	result= false;
                }
                try {
                    JSONObject batch = new JSONObject(data);
                    if (batch != null) {
                        String batchId = batch.getString("ID");
                        WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchProdTaskID", batchId),
                                Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
                        if (prodTask != null) { // 工单存在
                            if (prodTask.getStatus() != 99) {
                                logMap = externalService.setWorkOrderMqLogMap(false, null, "工单：" + prodTask.getProductBatchNum() + "未生效，不能更改工单执行状态,jsonData:" + data, "batchStatus", di.getId().toString(), "false", prodTask.getProductBatchNum());
                                externalService.insertLog(logMap, dealError);
                                result = false;
                            } else { // 工单生效
                                Long taskState = batch.getLong("ExeStat");//ExeStat 1:运行中  8:已完成  -1:未执行 / womTaskState/01:待执行 02:执行中 03:已完成 04:终止
                                Long oldTaskState = batch.getLong("ExeStatOld");//过去运行状态
                                if (taskState != null && taskState.intValue() == 1) {
                                	//启动工单-调用开始指令单方法
                                	result=externalService.mqStartTask(di, dealError, prodTask, batch, logMap);
                                }else if (taskState != null && taskState.intValue() == 8){
                                	//结束工单-调用结束指令单方法，
                                	result=externalService.mqEndTask(di, dealError, prodTask, batch, logMap);
                                	//若需要报工，调用报工接口
                                	externalService.mqEndTaskToAddReport(di, dealError, prodTask, batch, logMap);
                                }else if (taskState != null && taskState.intValue() == 6) {
                                	//批控放弃指令单
                                	externalService.mqAbortTask(di, dealError, prodTask, batch, logMap);
                                } else if (taskState != null && taskState.intValue() == 5) {
                                	//批控暂停指令单
                                	externalService.mqStopTask(di, dealError, prodTask, batch, logMap);
                                } 
                            }
                        } else {
                            logMap = externalService.setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "batchStatus", null, "true", batchId);
                            externalService.insertLog(logMap, dealError);
                            result = false;
                        }
                    }
                }catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} 
            	externalService.deleteMq(di);
            } 	
        	return result;
	}
	
	
	/**
	 * 00020002
	 * 批控处理unit工序大方法，其中包括：
	 * 开始unit，结束unit及修改相关设备
	 * @param di
	 * @param dealError
	 * @return
	 */
    @Transactional
    @Override
	public Boolean mqDealUnitBoolean(RMMQDealinfo di, Boolean dealError) {
		Boolean result=true;
        String data = di.getMqValue();
        String messageId = data.substring(0, 8);
        String body = data.substring(8, data.length());
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        if (messageId.equals("00020002")) {
        	//只有当数据中包含当前执行状态和之前执行状态，表示执行启动停止等操作
            if (body != null && body.contains("ExeStat") && body.contains("ExeStatOld")) {
              //  isSuccess = dealMqUnitDate(di, false);
                data = di.getMqValue().substring(8, di.getMqValue().length());
                if (null == data || "".equals(data)) {
                	return false;
                }
                try {
					JSONObject unit = new JSONObject(data);
					if (unit != null){
			               String batchId = unit.getString("BatchID");
			                WOMProduceTask prodTask = produceTaskDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("batchProdTaskID", batchId),
			                        Restrictions.eq("interfaceUrl", di.getOrigin()));//根据批控工单Id获取工单
			                if (prodTask != null) {
			                    if (prodTask.getStatus() != 99) {
			                        logMap = externalService.setWorkOrderMqLogMap(false, null, "工单未生效,jsonData:" + data, "unitStatus", di.getId().toString(), "false", batchId);
			                        externalService.insertLog(logMap, dealError);
			                        result= false;
			                    }
			                    String batchUnitId = unit.getString("ID");//phase关联unitId
			                    Long exeStatOld = null;//unit状态
			                    Long exeStat = null;//unit状态
			                    Long startTimeLong = null;//开始时间
			                    Long endTimeLong = null;//结束时间
			                    String unitEquipID = null;//对应设备

			                    // 回填工单执行状态到计划明细 - added 20180207
			                    SystemCode state = prodTask.getTaskState();//执行状态
			                    String batchNum = prodTask.getProductBatchNum();// 生产批号
			                  //  womPlanPartService.backFillPlanDetail(batchNum, state, null, prodTask.getTaskType());

			                    try {
			                        exeStatOld = unit.getLong("ExeStatOld");//unit状态
			                        exeStat = unit.getLong("ExeStat");//unit状态
			                        startTimeLong = unit.getLong("StartTime");//开始时间
			                        endTimeLong = unit.getLong("EndTime");//结束时间
			                        unitEquipID = unit.getString("UnitEquipID");
			                    } catch (JSONException e) {
			                        //log.error(e.getMessage(), e);
			                        e.getStackTrace();
			                    }
			                    WOMProdTaskProcExelog procExeLog = prodTaskProcExelogDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("taskID", prodTask),
			                            Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单活动记录
			                    WOMProduceTaskProcess produceTaskProcess = produceTaskProcessDao.findEntityByCriteria(Restrictions.eq("valid", true), Restrictions.eq("headId", prodTask),
			                            Restrictions.eq("batchUnitID", batchUnitId));//根据批控unitId获取工单工序

			                    if (produceTaskProcess == null) {
			                        logMap = externalService.setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "unitStatus", di.getId().toString(), "true", batchUnitId);
			                        externalService.insertLog(logMap, dealError);
			                        result = false;
			                    }		                    
			                    if(startTimeLong!=null && startTimeLong.longValue()>0){//工序开始信号
			                    	result=externalService.mqStartUnit(di, dealError, prodTask, logMap, startTimeLong, procExeLog, produceTaskProcess, batchUnitId, unitEquipID);
			                    }else if(endTimeLong != null && endTimeLong.longValue() > 0){//工序结束信号
			                    	result=externalService.mqEndUnit(di, dealError, prodTask, logMap, startTimeLong, endTimeLong, procExeLog, produceTaskProcess, batchUnitId);
			                    }
			                    //////////////////////////////////////////////
			                }else{
			                    logMap = externalService.setWorkOrderMqLogMap(false, null, "控制配方不是来自MES系统,jsonData:" + data, "unitStatus", di.getId().toString(), "true", batchId);
			                    externalService.insertLog(logMap, dealError);
			                    result = false;					                   
			                }
					}
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            } else if (body != null) {
            	//如果有设备编码，则修改相关数据的设备
                result = externalService.updateEquipment(di, false);
            }
            externalService.deleteMq(di);
        }  
        return result;
	}
	
	
	
	/**
	 * 00020004
	 * mq处理phase活动大方法，其中包括：
	 * 开始phase，结束phase，投料投配料活动生成投料单，检验活动生成请检单，修改phase
	 * @param di
	 * @param dealError
	 * @return
	 */
    @Transactional
    @Override
	public Boolean mqDealPhaseBoolean(RMMQDealinfo di,Boolean dealError){
		Boolean result=true;
        log.info("deal mq info start : " + di.getId().toString());
        String data = di.getMqValue();
        String messageId = data.substring(0, 8);
        String body = data.substring(8, data.length());
        Boolean isSuccess = false;
        List<Map<String, String>> logMap = new ArrayList<Map<String, String>>();
        if (messageId.equals("00020004")) {
        	//phase层面
        	//只有当数据中包含当前执行状态和之前执行状态，表示执行phase启动停止等操作
            if (body != null && body.contains("ExeStat") && body.contains("ExeStatOld")) {
            	result = externalService.dealMqPhaseDate(di,false);
            } else {
                result = externalService.dealMqPhaseDateChange(di, false);
            }
            externalService.deleteMq(di);
        } 
        return result;
    }
	
	
	
	/**
	 * Operation结束
	 * @param di
	 * @param result
	 * @return
	 */
    @Transactional
    @Override
	public Boolean mqEndOperationBoolean(RMMQDealinfo di,Boolean dealError){
       Boolean  result = true;
       externalService.deleteMq(di);
       return result;
   }
	
}
