package com.supcon.orchid.WOM.services.impl;

import java.math.BigDecimal;
import java.util.*;

import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicWare;
import com.supcon.orchid.RM.entities.RMMQDealinfo;
import com.supcon.orchid.WOM.entities.*;

import com.supcon.orchid.WOM.enums.ResultEnum;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.foundation.entities.User;

import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.workflow.engine.entities.Deployment;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import org.apache.commons.lang.StringUtils;

import org.springframework.stereotype.Component;

import org.springframework.transaction.annotation.Transactional;

import org.hibernate.SQLQuery;

/**
 * Created By guding on 2019/2/22 15:40
 */
@Component("mesProcedureReport")
public class MesProcedureImpl extends ProcedureAbstract {

    /**
     * 开始活动
     *
     * @param resultMap
     * @return
     */
    @Transactional
    @Override
    public WOMResult startActive(Map<String, Object> resultMap) {
        Long selectedActiveId = null;
        if (resultMap.get("selectedActiveId") != null) {
            selectedActiveId = Long.valueOf(resultMap.get("selectedActiveId").toString());
        }
        if (selectedActiveId != null) {
            Date startTime = new Date();
            StringBuilder errorMsg = new StringBuilder();
            /*活动开始，首先判断当前活动对应的工序是否为第一道工序，如果是第一道工序，同时还要判断当前任务单是否已经开始执行
            未开始执行，需要将状态变更*/
            //工序活动
            WOMProduceTaskActive produceTaskActive = produceTaskActiveService.getProduceTaskActive(selectedActiveId);
            //指令单工序
            WOMProduceTaskProcess produceTaskProcess = produceTaskActive.getOrderProcessId();
            //指令单
            WOMProduceTask produceTask = produceTaskActive.getHeadID();
            if(StringUtils.equals(PROCESS_STATE_DONE,produceTaskProcess.getProcessState().getId())){
                return new WOMResult(500,errorMsg.append("当前工序已经结束！").toString());
            }
            WOMResult error = getCheckSort(produceTaskActive, produceTaskProcess, produceTask);
            if (error != null && !error.getCode().equals(200))
                return error;


            //生成工序执行记录  如果没有执行记录 需要新插入
            if (((Number)produceTaskProcessDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_PROD_TASK_PROC_EXELOGS WHERE TASKID=? AND VALID = 1 AND TASK_PROCESSID=?", produceTask.getId(),produceTaskProcess.getId()).uniqueResult()).intValue() == 0) {    //如果当前指令单的执行记录找不到条目，新插入
                createProcExelog(startTime, produceTaskProcess);
            }

            //生成活动执行记录  如果没有执行记录 需要新插入
            if (((Number)produceTaskProcessDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_PROD_TASK_ACTI_EXELOGS WHERE TASKID=? AND VALID = 1 AND TASK_ACTIVEID=?", produceTask.getId(),produceTaskActive.getId()).uniqueResult()).intValue() == 0) {    //如果当前指令单的执行记录找不到条目，新插入
                WOMProdTaskActiExelog prodTaskActiExelog = getWomProdTaskActiExelog(startTime, produceTaskActive,ACTIVE_COMMON);
                User user = getUser();
                //如果当前活动是检验，需要发起请检
                if (StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_INSPECT)) {
                    try {
                        interfaceSelfService.addApplyCheckByActiveExelog(prodTaskActiExelog);
                        //创建这条记录是为了 点击报工记录时能看到 这个实体的查看页面
                        WOMQualityInspect inspect = new WOMQualityInspect();
                        inspect.setInspectBatch(prodTaskActiExelog.getBatchNum());
                        inspect.setActiveID(produceTaskActive);
                        inspect.setOperateStaffID(user.getStaff());
                        qualityInspectDao.save(inspect);
                    } catch (Exception e) {
                        log.error("Exception",e);
                        throw new BAPException("未能生成请检单！");
                    }
                }else if(StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_OUTPUT)){
                    WOMMaterialsOutput output = new WOMMaterialsOutput();
                    output.setActiveID(produceTaskActive);
                    output.setOperateStaffID(user.getStaff());
                    materialsOutputDao.save(output);
                }
            }

            if (((Number)produceTaskProcessDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_PRODUCE_TASK_PROCESSES WHERE HEAD_ID=? AND VALID = 1 AND EXE_ORDER<?", produceTask.getId(),produceTaskProcess.getExeOrder()).uniqueResult()).intValue() == 0) {
                /*
                    womTaskState/01     待执行
                    womTaskState/02     执行中
                    womTaskState/03     已完成
                    womTaskState/04     终止
                 */
                if (produceTask.getTaskState() != null && produceTask.getTaskState().equals(new SystemCode(TASK_STATE_TODO))) {

                    //更改指令单 状态
                    produceTask.setTaskState((SystemCode) systemCodeService.getSystemCode(TASK_STATE_DOING));
                    produceTask.setActStartTime(startTime);
                    produceTaskDao.merge(produceTask);

                }
            }
            SystemCode sc_executory = (SystemCode) systemCodeService.getSystemCode(PROCESS_STATE_DOING);
            if (produceTaskProcess.getStartTime() == null) {
                //更改指令单工序 状态
                produceTaskProcess.setStartTime(startTime);
                produceTaskProcess.setProcessState(sc_executory);
                produceTaskProcessDao.save(produceTaskProcess);
            }

            //如果是非主活动，需要把主活动也要变更状态
            if (!produceTaskActive.getParentActive()) {
                if (produceTaskActive.getParentActiveId() != null) {
                    WOMProduceTaskActive parentActive = produceTaskActiveService.getProduceTaskActive(produceTaskActive.getParentActiveId());
                    parentActive.setActiveState(sc_executory);
                    parentActive.setStartTime(startTime);
                    produceTaskActiveDao.save(parentActive);
                }

            }

            //更改工序活动 状态
            produceTaskActive.setActiveState(sc_executory);
            produceTaskActive.setStartTime(startTime);
            produceTaskActiveDao.save(produceTaskActive);

        }
        return new WOMResult(ResultEnum.SUCCESS);
    }

    /**
     * 结束活动
     *
     * @param resultMap
     * @return
     */
    @Transactional
    @Override
    public WOMResult endActive(Map<String, Object> resultMap) {
        Long selectedActiveId = null;
        String inComeType = "";
        if (resultMap.get("selectedActiveId") != null) {
            selectedActiveId = Long.valueOf(resultMap.get("selectedActiveId").toString());
        }
        if (resultMap.get("inComeType") != null) {
            inComeType = resultMap.get("inComeType").toString();
        }
        if (selectedActiveId != null) {
            Date endTime = new Date();
            StringBuilder errorMsg = new StringBuilder();
            /*  活动结束:
                        当前活动不能为已结束的状态
                        判断顺序卡控问题

                        未开始执行，需要将状态变更
            */
            //工序活动
            WOMProduceTaskActive produceTaskActive = produceTaskActiveService.getProduceTaskActive(selectedActiveId);
            //指令单
            WOMProduceTask produceTask = produceTaskActive.getHeadID();
            //指令单工序
            WOMProduceTaskProcess produceTaskProcess = produceTaskActive.getOrderProcessId();
            //父节点
            WOMProduceTaskActive parentProduceTaskActive = null;

            String sql = "SELECT COUNT(ID) FROM WOM_BATCHING_MATERIAL_NEEDS WHERE TASK_ACTIVE = ? AND VALID = 1 AND STATE = ?";

            if (StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_BATCHES) &&  ((Number)produceTaskProcessDao.createNativeQuery(sql, produceTaskActive.getId(),"womNeedState/04").uniqueResult()).intValue() == 0){
                return new WOMResult(500,errorMsg.append("配料需求未完成！").toString());
            }

            if(StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_INSPECT) && StringUtils.equals("people",inComeType)){
                return new WOMResult(500,errorMsg.append("暂不允许手动结束检验活动！").toString());
            }
            List<WOMProdTaskActiExelog> actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and taskActiveID=?",produceTaskActive);
            BigDecimal actualNum = null;
            if (!actiExelogs.isEmpty()) {
                for (WOMProdTaskActiExelog actiExelog : actiExelogs) {
                    //结束活动前必须保证已经创建了报工任务单
                    actualNum = toProcfeedback(errorMsg,actiExelog, produceTaskActive,endTime);
                }
            }else {
                return new WOMResult(500,errorMsg.append("当前活动生成活动记录单失败，请联系管理员！").toString());
            }

            if (errorMsg.length() > 0) {
                return new WOMResult(500,errorMsg.toString());
            }
            produceTaskActiveDao.flush();
            produceTaskActiveDao.clear();
            if (StringUtils.equals(produceTaskActive.getActiveState().getId(),PROCESS_STATE_DONE)) {
                errorMsg.append("当前活动已完成!");
                return new WOMResult(500,errorMsg.toString());
            }
            if (StringUtils.equals(produceTaskActive.getActiveState().getId(),PROCESS_STATE_TODO)) {
                errorMsg.append("当前活动还未进行，请执行本活动!");
                return new WOMResult(500,errorMsg.toString());
            }
            //顺序比较
            //当前选中的活动的大工序
            WOMProduceTaskProcess selectedActiveProcess = produceTaskActive.getOrderProcessId();
            List<WOMProduceTaskProcess> produceTaskProcesses = produceTaskProcessDao.findByHql(" from WOMProduceTaskProcess where valid = 1 and headId=?", produceTask);
            for (WOMProduceTaskProcess taskProcess : produceTaskProcesses) {
                //如果顺序比当前活动的大工序小,并且状态不为已完成
                if (taskProcess.getExeOrder() < selectedActiveProcess.getExeOrder() && !StringUtils.equals(taskProcess.getProcessState().getId(),PROCESS_STATE_DONE)) {
                    errorMsg.append("大工序 [" + taskProcess.getName() + "] 还未完成,按照顺序限定不能结束当前活动！");
                    return new WOMResult(500,errorMsg.toString());
                }
            }
            //如果当前活动为"父节点",只需要比较所有同为"父节点"的工序的顺序即可
            if (produceTaskActive.getParentActive()) {
                if (compareParentsSort(errorMsg, produceTask, produceTaskProcess, produceTaskActive))
                    return new WOMResult(500,errorMsg.toString());
            }else {
                //如果当前活动不是父节点,则需要先找到其父节点，比较父节点顺序，再比较当前节点下的所有子节点
                parentProduceTaskActive = produceTaskActiveService.getProduceTaskActive(produceTaskActive.getParentActiveId());
                if (compareParentsSort(errorMsg, produceTask, produceTaskProcess, parentProduceTaskActive))
                    return new WOMResult(500,errorMsg.toString());
                //接着比较所有子节点
                List<WOMProduceTaskActive> childrenProduceTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and parentActiveId=? and sort < ?", parentProduceTaskActive.getId(),produceTaskActive.getSort());
                for (WOMProduceTaskActive childrenProduceTaskActive : childrenProduceTaskActives) {
                    if (!StringUtils.equals(childrenProduceTaskActive.getExecSort(),produceTaskActive.getExecSort()) && !StringUtils.equals(childrenProduceTaskActive.getActiveState().getId(),PROCESS_STATE_DONE)) {
                        errorMsg.append("活动 [" + childrenProduceTaskActive.getName() + "] 还未完成,按照顺序限定不能结束当前活动！");
                        return new WOMResult(500,errorMsg.toString());
                    }
                }
            }

            SystemCode sc_executory = (SystemCode) systemCodeService.getSystemCode(PROCESS_STATE_DONE);

            //如果是非主活动，需要判断当前活动的之前的所有活动都是否已经结束了，如果都结束物料，需要把主活动也要结束掉
            if (!produceTaskActive.getParentActive()) {
                if (parentProduceTaskActive != null) {
                    List<WOMProduceTaskActive> childrenProduceTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and parentActiveId=? and id!=? and activeState.id!=?", parentProduceTaskActive.getId(),produceTaskActive.getId(),"processState/state03");
                    if(childrenProduceTaskActives.isEmpty()){
                        parentProduceTaskActive.setActiveState(sc_executory);
                        parentProduceTaskActive.setEndTime(endTime);
                        produceTaskActiveDao.save(parentProduceTaskActive);
                    }
                }

            }


            //更改工序活动 状态
            if (StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_CHARGE) && actualNum != null) {
                produceTaskActive.setActualNum(actualNum);
            }else if(StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_OUTPUT)){
                produceTaskActive.setOutputNum(actualNum);
            }
            produceTaskActive.setActiveState(sc_executory);
            produceTaskActive.setEndTime(endTime);
            produceTaskActiveDao.save(produceTaskActive);
            produceTaskActiveDao.flush();
            produceTaskActiveDao.clear();
            Number result = (Number) produceTaskProcessDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_ADJUST_OR_TEMP_RECORDS WHERE VALID = 1 AND PROCESSID=? AND ACTIVE_RECORD_STATE=?", produceTaskProcess.getId(),"processState/state02").uniqueResult();
            //活动结束之后，需要再判断当前大工序的所有活动是否已经全部结束
            List<WOMProduceTaskActive> taskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and headID=? and activeState.id!=?", produceTaskProcess,produceTask,"processState/state03");
            if (taskActives.isEmpty()) {
                //查看的当前工序的机动活动、调整活动是否都已经结束
                if (result.intValue() == 0) {
                    List<WOMProdTaskProcExelog> exelogs = prodTaskProcExelogDao.findByHql(" from WOMProdTaskProcExelog where valid = 1 and taskProcessID=?", produceTaskProcess);
                    for (WOMProdTaskProcExelog exelog : exelogs) {
                        exelog.setEndTime(endTime);
                        exelog.setState(new SystemCode("womProActiveType/completed"));
                        prodTaskProcExelogDao.save(exelog);
                    }
                    produceTaskProcessDao.flush();
                    produceTaskProcessDao.clear();
                    //更改指令单工序 状态
                    produceTaskProcess.setEndTime(endTime);
                    produceTaskProcess.setProcessState(sc_executory);
                    produceTaskProcessDao.save(produceTaskProcess);
                    produceTaskProcessDao.flush();
                    produceTaskProcessDao.clear();
                }
            }

            /*
                womTaskState/01     待执行
                womTaskState/02     执行中
                womTaskState/03     已完成
                womTaskState/04     终止
             */
            if (produceTask.getTaskState() != null && produceTask.getTaskState().equals(new SystemCode(TASK_STATE_DOING))) {

                List<WOMProduceTaskProcess> processe_done = produceTaskProcessDao.findByHql(" from WOMProduceTaskProcess where valid = 1 and headId=? and processState.id!=?", produceTask,"processState/state03");
                if (processe_done.isEmpty()) {
                    if (result.intValue() == 0) {
                        //更改指令单 状态
                        produceTask.setTaskState(new SystemCode(TASK_STATE_DONE));
                        produceTask.setActEndTime(endTime);
                        produceTaskDao.save(produceTask);
                        produceTaskDao.flush();
                        produceTaskDao.clear();
                        //如果是最后一道活动，需要生成完工的生产报工单
                        if (produceTask.getAutoReportOnFinish() != null) {
                            generateReportingBill(endTime,produceTask);
                        }


                    }
                }

            }

        }
        return new WOMResult(ResultEnum.SUCCESS);
    }


    /**
     * 开始指令单
     */
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
    @Transactional
    @Override
    public WOMResult addInspect(Map<String, Object> resultMap) {
        Long activeId = null;
        String activeType = null;
        if (resultMap.get("activeType") != null) {
            activeType = resultMap.get("activeType").toString();
        }
        if (resultMap.get("activeId") != null) {
            activeId = Long.valueOf(resultMap.get("activeId").toString());
        }
        WOMProduceTaskProcess taskProcess = null;
        //常规活动ACTIVE不传数据
        if (StringUtils.isNotBlank(activeType)) {
            WOMAdjustOrTempRecords records = adjustOrTempRecordsDao.get(activeId);
            if (records.getProcessID() != null) {
                taskProcess = produceTaskProcessDao.get(records.getProcessID());
                if (checkFinish(taskProcess)) return new WOMResult(500,"当前工序中存在没有完结的[调整]活动!");
                if (records.getActiveRecordBatchState() != null && StringUtils.equals(records.getActiveRecordBatchState().getName(),"调整")){
                    saveActiveExecLogs("adjustRecordID", records.getId(), records.getActiveType().getId());
                    records.setActiveRecordBatchState(null);
                    adjustOrTempRecordsDao.save(records);
                }else {
                    return new WOMResult(500,"选中的活动必须是调整状态的才可以发起请检!");
                }
            }else {
                return new WOMResult(500,"机动执行活动["+records.getActiceName()+"]工序ID为空！");
            }
        }else {
            WOMProduceTaskActive produceTaskActive = produceTaskActiveDao.get(activeId);
            taskProcess = produceTaskActive.getOrderProcessId();
            if (checkFinish(taskProcess)) return new WOMResult(500,"当前工序中存在没有完结的[调整]活动!");
            if (produceTaskActive.getActiveBatchState() != null && StringUtils.equals(produceTaskActive.getActiveBatchState().getName(),"调整")) {
                saveActiveExecLogs("taskActiveID.id", produceTaskActive.getId(), produceTaskActive.getActiveType().getId());
                produceTaskActive.setActiveBatchState(null);
                produceTaskActiveDao.save(produceTaskActive);
            }else {
                return new WOMResult(500,"选中的活动必须是调整状态的才可以发起请检!");
            }
        }
        return new WOMResult(ResultEnum.SUCCESS);
    }

    private void saveActiveExecLogs(String columnName, Long columnId, String activeType) {
        List<WOMProdTaskActiExelog> actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and "+columnName+"=?",columnId);
        for (WOMProdTaskActiExelog actiExelog : actiExelogs) {
            //如果当前活动是检验，需要发起请检
            if (StringUtils.equals(activeType,"activeType/activeType5")) {
                actiExelog.setActiveBatchStateID(null);
                //现在默认全部都有放行检
                actiExelog.setIsPassCheck(true);
                prodTaskActiExelogDao.save(actiExelog);
                prodTaskActiExelogDao.flush();
                prodTaskActiExelogDao.clear();
                interfaceSelfService.addApplyCheckByActiveExelog(actiExelog);
            }
        }
    }

    private boolean checkFinish(WOMProduceTaskProcess taskProcess) {
        //发起请检需要判断当前工序的调整活动是否已经全部结束
        Number result = (Number) adjustOrTempRecordsDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_ADJUST_OR_TEMP_RECORDS WHERE VALID = 1 AND PROCESSID=? AND ACTIVE_RECORD_STATE=? AND RECORD_DATA_SOURCE=?", taskProcess.getId(),"processState/state02","womActiveSource/03").uniqueResult();
        if (result.intValue() > 0) {
            return true;
        }
        return false;
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
    public Boolean mqDealTaskBoolean(RMMQDealinfo di, Boolean dealError) {
        return null;
    }

    @Override
    public Boolean mqDealUnitBoolean(RMMQDealinfo di, Boolean dealError) {
        return null;
    }

    @Override
    public Boolean mqDealPhaseBoolean(RMMQDealinfo di, Boolean dealError) {
        return null;
    }

    @Override
    public Boolean mqEndOperationBoolean(RMMQDealinfo di, Boolean dealError) {
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
    @Transactional
    @Override
    public WOMResult adjustStartActive(Map<String, Object> resultMap) {
        Long processId = null;
        Long dealId = null;
        if (resultMap.get("processId") != null) {
            processId = Long.valueOf(resultMap.get("processId").toString());
        }
        if (resultMap.get("dealId") != null) {
            dealId = Long.valueOf(resultMap.get("dealId").toString());
        }
        Date startTime = new Date();
        //开始活动，创建新的调整执行记录
        WOMAdjustOrTempRecords records = new WOMAdjustOrTempRecords();
        WOMAdjustOrTempHead adjustOrTempHead = adjustOrTempHeadDao.get(dealId);
        records.setActiceName(adjustOrTempHead.getActiveName());
        records.setActiveType(adjustOrTempHead.getActiveType());
        records.setRecordIsAdjust(adjustOrTempHead.getIsAgile());
        records.setRecordDataSource(adjustOrTempHead.getDataSource());
        if (!adjustOrTempHead.getIsAgile()) {
            //不是灵活投料就肯定会有物料的
            records.setRecordProduct(adjustOrTempHead.getProduct());
        }
        WOMProduceTaskProcess taskProcess = produceTaskProcessDao.get(processId);
        WOMProduceTask task = taskProcess.getHeadId();
        //判断当前工序是否在可执行的顺序内
        List<WOMProduceTaskProcess> produceTaskProcesses = produceTaskProcessDao.findByHql(" from WOMProduceTaskProcess where valid = 1 and headId=? and exeOrder<? and processState.id!=?", task,taskProcess.getExeOrder(),"processState/state03");
        if (produceTaskProcesses.size() > 0) {
            throw new BAPException("请按照工序顺序开始活动!");
        }
        if (StringUtils.equals(taskProcess.getHeadId().getTaskState().getId(),TASK_STATE_DONE)) {
            throw new BAPException("指令单已经结束，不能开始活动!");
        }else if(StringUtils.equals(taskProcess.getHeadId().getTaskState().getId(),TASK_STATE_STOP)){
            throw new BAPException("指令单已经终止，不能开始活动!");
        }
        if (StringUtils.equals(taskProcess.getProcessState().getId(),PROCESS_STATE_DONE)) {
            throw new BAPException("工序已经结束，不能开始活动!");
        }
        if (taskProcess != null) {
            records.setActiveRecordState((SystemCode) systemCodeService.getSystemCode(PROCESS_STATE_DOING));
            records.setHeaderID(taskProcess.getHeadId());
            records.setTableInfoId(taskProcess.getHeadId().getTableInfoId());
        }
        records.setStartTime(startTime);
        records.setProcessID(taskProcess.getId());
        records.setProcessName(taskProcess.getName());
        records.setFormularActive(adjustOrTempHead.getFormulaProcessActive());
        adjustOrTempRecordsDao.save(records);
        //创建报工页面单据
        WOMProcFeedbackHead womProcFeedbackHead = new WOMProcFeedbackHead();
        if (records.getRecordProduct() != null) {
            womProcFeedbackHead.setProduct(records.getRecordProduct());
        }
        womProcFeedbackHead.setAdjustDealRecord(records);
        womProcFeedbackHead.setTaskId(records.getHeaderID());
        womProcFeedbackHead.setIsAgile(adjustOrTempHead.getIsAgile());
        womProcFeedbackHead.setStaffID(getUser().getStaff());
        procFeedbackHeadDao.save(womProcFeedbackHead);

        gerenalActiveRecord(records,taskProcess,startTime);
        procFeedbackHeadDao.flush();
        procFeedbackHeadDao.clear();
        if (StringUtils.equals(taskProcess.getProcessState().getId(),PROCESS_STATE_TODO)) {
            //如果工序未开始，则将状态更新
            taskProcess.setStartTime(startTime);
            taskProcess.setProcessState((SystemCode) systemCodeService.getSystemCode(PROCESS_STATE_DOING));
            produceTaskProcessDao.save(taskProcess);
        }
        if (StringUtils.equals(taskProcess.getHeadId().getTaskState().getId(),TASK_STATE_TODO)) {
            //如果指令单未开始，则将状态更新
            task.setTaskState((SystemCode) systemCodeService.getSystemCode(TASK_STATE_DOING));
            task.setActStartTime(startTime);
            produceTaskDao.save(task);
        }
        return new WOMResult(ResultEnum.SUCCESS,records.getId());
    }
    @Transactional
    @Override
    public WOMResult adjustEndActive(Map<String, Object> resultMap) {
        Long activeRecordId = null;
        String inComeType = null;
        if (resultMap.get("activeRecordId") != null) {
            activeRecordId  = Long.valueOf(resultMap.get("activeRecordId").toString());
        }
        if (resultMap.get("inComeType") != null) {
            inComeType  = resultMap.get("inComeType").toString();
        }
        Date endTime = new Date();
        MESBasicProduct product = null;
        BigDecimal actualNum = new BigDecimal("0");
        StringBuilder errorMsg = new StringBuilder();
        //结束活动时，如果是投料类型的,生成投料记录单
        WOMAdjustOrTempRecords record = adjustOrTempRecordsDao.get(activeRecordId);
        WOMProduceTaskProcess produceTaskProcess = produceTaskProcessDao.get(record.getProcessID());
        WOMProduceTask produceTask = produceTaskProcess.getHeadId();
        if (StringUtils.equals(record.getActiveRecordState().getId(),PROCESS_STATE_DONE)) {
            return new WOMResult(500,errorMsg.append("活动已经结束，请选择执行中的活动！").toString());
        }
        if (StringUtils.equals(record.getActiveType().getId(), ACTIVE_TYPE_CHARGE)) {   //投料
            List<WOMProcFeedbackHead> procFeedbackHeads = procFeedbackHeadDao.findByHql("FROM WOMProcFeedbackHead  WHERE adjustDealRecord.id=? AND VALID = 1", activeRecordId);
            if (procFeedbackHeads.size() == 0) {
                return new WOMResult(500,errorMsg.append("请先进行报工操作！").toString());
            } else {
                if (!StringUtils.equals(record.getActiveType().getId(), ACTIVE_TYPE_COMMON)) {

                    putInMaterial = new WOMPutInMaterial();
                    //投料或者配料活动时，需要生成投料单
                    for (WOMProcFeedbackHead procFeedbackHead : procFeedbackHeads) {
                        putInMaterial.setTaskID(procFeedbackHead.getTaskId());
                        putInMaterial.setPutinStaff(procFeedbackHead.getStaffID());
                        putInMaterial.setStatus(99);
                        putInMaterialParts = new ArrayList<>();
                        //找到投配料表体
                        List<WOMBatchCharge> batchCharges = batchChargeService.findBatchChargesByHql(" from WOMBatchCharge where headerId=? and valid = 1", procFeedbackHead);
                        //是否启用批次
                        boolean useBatch = false;
                        //是否启用货位
                        boolean usePlaceSet = false;
                        if (batchCharges.size() == 0) {
                            return new WOMResult(500,errorMsg.append("配料表体不能为空！").toString());
                        }
                        for (int i = 0; i < batchCharges.size(); i++) {
                            WOMBatchCharge womBatchCharge = batchCharges.get(i);
                            // 获取表体中该物料的总使用量
                            BigDecimal totalUseNum = womBatchCharge.getActualUseNum();
                            for (int j = 0; j < batchCharges.size(); j++) {
                                if(i == j) {
                                    continue;
                                }
                                if (womBatchCharge.getStandingCrop().getId().equals(batchCharges.get(j).getStandingCrop().getId())) {
                                    totalUseNum.add(batchCharges.get(j).getActualUseNum());
                                }
                            }
                            // 判断领用记录能否满足表体物料用料量
                            if (totalUseNum.compareTo(womBatchCharge.getStandingCrop().getOnhand()) > 0) {
                                return new WOMResult(500,errorMsg.append("配料表体中物料编码[" + womBatchCharge.getGood().getProductCode() + "]的\"用料量\"不能大于\"现存量\"").toString());
                            }
                            MESBasicWare wareID = womBatchCharge.getWareID();
                            if (i == 0) {
                                if (womBatchCharge.getGood() != null) {
                                    if (womBatchCharge.getGood().getBatch() != null && StringUtils.equals(womBatchCharge.getGood().getBatch().getId(), "batch/batch01")) {
                                        useBatch = true;
                                    }
                                }
                                if (womBatchCharge.getWareID() != null) {
                                    usePlaceSet = wareID.getIsCargo();
                                }
                            }
                            WOMPutInMaterialPart putInMaterialPart = new WOMPutInMaterialPart();
                            if (useBatch && StringUtils.isBlank(womBatchCharge.getBatch())) {
                                return new WOMResult(500,errorMsg.append("物品已经启用批次，批号不能为空！").toString());
                            }
                            //生产批次
                            putInMaterialPart.setBatchNum(womBatchCharge.getBatch());
                            //调整或机动活动
                            putInMaterialPart.setAdjustActive(record);
                            //投入的物品
                            putInMaterialPart.setProductId(womBatchCharge.getGood());
                            if (!record.getFormularActive().getIsAgile()) {
                                product = womBatchCharge.getGood();
                            }
                            //活动
                            putInMaterialPart.setFormluActive(record.getFormularActive());
                            if (womBatchCharge.getActualUseNum() == null) {
                                return new WOMResult(500,errorMsg.append("实际投料量不能为空！").toString());
                            }
                            //投入量
                            putInMaterialPart.setUseNum(womBatchCharge.getActualUseNum());
                            actualNum = actualNum.add(womBatchCharge.getActualUseNum());
                            if (wareID == null) {
                                return new WOMResult(500,errorMsg.append("仓库不能为空！").toString());
                            }

                            if (usePlaceSet && womBatchCharge.getPlaceSet() == null) {
                                return new WOMResult(500,errorMsg.append("仓库 [" + womBatchCharge.getWareID().getWareName() + "] ").append("已经启用了货位，").append("货位不能为空!").toString());
                            }
                            //仓库
                            putInMaterialPart.setWareID(womBatchCharge.getWareID());
                            //货位
                            putInMaterialPart.setStoreID(womBatchCharge.getPlaceSet());
                            //投料时间
                            putInMaterialPart.setPutinDate(womBatchCharge.getPutinDate());
                            //投料结束时间
                            putInMaterialPart.setPutinEndDate(womBatchCharge.getPutinEndDate());
                            WOMProduceTaskProcess womProduceTaskProcess = produceTaskProcessDao.get(record.getProcessID());
                            if (womProduceTaskProcess != null) {
                                //工作单元
                                putInMaterialPart.setFactoryId(womProduceTaskProcess.getFactoryId());
                                //工序
                                putInMaterialPart.setTaskProcessId(womProduceTaskProcess);
                            }
                            //备注
                            putInMaterialPart.setRemark(womBatchCharge.getRemark());
                            putInMaterialParts.add(putInMaterialPart);
                        }

                        // 更新领用记录
                        for (int i = 0; i < batchCharges.size(); i++) {
                            WOMBatchCharge womBatchCharge = batchCharges.get(i);
                            SQLQuery query = standingcropRefDao.createNativeQuery("UPDATE " + WOMStandingcropRef.TABLE_NAME + " SET onhand = onhand - " + womBatchCharge.getActualUseNum() + " WHERE id = " + womBatchCharge.getStandingCrop().getId());
                            query.executeUpdate();
                        }

                        //表体方法
                        DataGridService dataGridService = getDataGridService1();

                        WorkFlowVar workFlowVar1 = new WorkFlowVar();
                        workFlowVar1.setOperateType("submit");
                        // 生效
                        putInMaterialService.saveSuperEditPutInMaterial(putInMaterial, workFlowVar1, dataGridService, "WOM_7.5.0.0_putInMaterial_putinView", false);
                    }
                }
            }
        }else if(StringUtils.equals(record.getActiveType().getId(), ACTIVE_TYPE_INSPECT)){     //质检
            if (StringUtils.equals(inComeType,"people")) {
                return new WOMResult(500,errorMsg.append("暂不支持手动结束质检活动！").toString());
            }
        }
        List<WOMProdTaskActiExelog> actiExelogs = prodTaskActiExelogDao.findByHql(" from WOMProdTaskActiExelog where valid = 1 and adjustRecordID=?",record.getId());
        if (actiExelogs.size() > 0) {
            WOMProdTaskActiExelog prodTaskActiExelog = actiExelogs.get(0);
            prodTaskActiExelog.setActualNum(actualNum);
            prodTaskActiExelog.setProductID(product);
            prodTaskActiExelog.setEndTime(endTime);
            prodTaskActiExelog.setIsFinish(true);
            prodTaskActiExelogDao.save(prodTaskActiExelog);
            prodTaskActiExelogDao.flush();
            prodTaskActiExelogDao.clear();
            record.setRejectsDeal(prodTaskActiExelog.getRejectsDealID());
            record.setInspectRecordId(prodTaskActiExelog.getCheckResultID());
            record.setInspectResult(prodTaskActiExelog.getCheckResult());
        }
        record.setActiveRecordState((SystemCode) systemCodeService.getSystemCode(PROCESS_STATE_DONE));
        record.setEndTime(endTime);
        record.setActualUse(actualNum);
        adjustOrTempRecordsDao.save(record);
        adjustOrTempRecordsDao.flush();
        adjustOrTempRecordsDao.clear();

        SystemCode sc_executory = (SystemCode) systemCodeService.getSystemCode(PROCESS_STATE_DONE);
        //活动结束之后，需要再判断当前大工序的所有活动是否已经全部结束
        List<WOMProduceTaskActive> taskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and headID=? and activeState.id!=?", produceTaskProcess,produceTaskProcess.getHeadId(),"processState/state03");
        if (taskActives.isEmpty()) {
            //查看的当前工序的机动活动、调整活动是否都已经结束
            Number result1 = (Number) adjustOrTempRecordsDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_ADJUST_OR_TEMP_RECORDS WHERE VALID = 1 AND PROCESSID=? AND ACTIVE_RECORD_STATE=?", produceTaskProcess.getId(),"processState/state02").uniqueResult();
            if (result1.intValue() == 0) {
                List<WOMProdTaskProcExelog> exelogs = prodTaskProcExelogDao.findByHql(" from WOMProdTaskProcExelog where valid = 1 and taskProcessID=?", produceTaskProcess);
                for (WOMProdTaskProcExelog exelog : exelogs) {
                    exelog.setEndTime(endTime);
                    prodTaskProcExelogDao.merge(exelog);
                }
                produceTaskProcessDao.flush();
                produceTaskProcessDao.clear();
                //更改指令单工序 状态
                produceTaskProcess.setEndTime(endTime);
                produceTaskProcess.setProcessState(sc_executory);
                produceTaskProcessDao.save(produceTaskProcess);
            }
        }

        if (produceTask.getTaskState() != null && produceTask.getTaskState().equals(new SystemCode(TASK_STATE_DOING))) {

            List<WOMProduceTaskProcess> processe_done = produceTaskProcessDao.findByHql(" from WOMProduceTaskProcess where valid = 1 and headId=? and processState.id!=?", produceTask,"processState/state03");
            if (processe_done.isEmpty()) {
                //更改指令单 状态
                produceTask.setTaskState(new SystemCode(TASK_STATE_DONE));
                produceTask.setActEndTime(endTime);
                produceTaskDao.save(produceTask);
                produceTaskDao.flush();
                produceTaskDao.clear();

                //如果是最后一道活动，需要生成完工的生产报工单
                if (produceTask.getAutoReportOnFinish() != null) {
                    generateReportingBill(endTime, produceTask);
                }
            }

        }
        return new WOMResult(ResultEnum.SUCCESS);
    }

    private DataGridService getDataGridService1() {
        return new DataGridService() {
            @Override
            public void execute() {
                if (putInMaterialParts != null && !putInMaterialParts.isEmpty()) {
                    for (WOMPutInMaterialPart part : putInMaterialParts) {
                        part.setTableInfoId(putInMaterial.getTableInfoId());
                        part.setHeadId(putInMaterial);
                        putInMaterialPartService.savePutInMaterialPart(part, null, "putinView");
                    }
                }
            }
        };
    }

    /**
     *  结束活动时的报工操作
     * @param errorMsg
     * @param produceTaskActive
     */
    private BigDecimal toProcfeedback(StringBuilder errorMsg, WOMProdTaskActiExelog actiExelog, WOMProduceTaskActive produceTaskActive, Date endTime) {
        BigDecimal actualNum = new BigDecimal("0");
        if (StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_INSPECT)) {
            // produceTaskActive.setInspectResult("合格");
        }else if(StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_OUTPUT)){
            List<WOMMaterialsOutput> materialsOutputs = procFeedbackHeadDao.findByHql("FROM WOMMaterialsOutput  WHERE activeID=? AND VALID = 1", produceTaskActive);
            if (materialsOutputs.size() == 0) {
                errorMsg.append("请先进行产出报工操作!");
                return null;
            }else {
                taskReporting = new WOMTaskReporting();
                if (materialsOutputs.size() == 0) {
                    errorMsg.append("投料表体不能为空!");
                    return null;
                }
                for (WOMMaterialsOutput materialsOutput : materialsOutputs) {
                    //指令单
                    taskReporting.setTaskID(produceTaskActive.getHeadID());
                    taskReporting.setProduceActive(produceTaskActive);
                    taskReporting.setProductID(produceTaskActive.getProductId());
                    if (produceTaskActive.getProductId() == null) {
                        errorMsg.append("物品不能为空!");
                        return null;
                    }else {
                        if (produceTaskActive.getProductId().getBatch() != null && StringUtils.equals(produceTaskActive.getProductId().getBatch().getId(),"batch/batch01")) {
                            if (StringUtils.isBlank(materialsOutput.getBatch())) {
                                errorMsg.append("物品已经启用批次，批号不能为空!");
                                return null;
                            }
                        }
                    }
                    taskReporting.setReportDate(endTime);
                    //报工人
                    taskReporting.setReportStaff(materialsOutput.getOperateStaffID());
                    //仓库
                    taskReporting.setWareID(materialsOutput.getWareID());
                    //报工类型：过程报工
                    taskReporting.setReportType((SystemCode) systemCodeService.getSystemCodeByID("womReportType/03"));
                    log.info("MesProcedureImpl - ------设置过程报工-------");
                    taskReporting.setStatus(88);
                    //找到产出数据
                    taskReportingParts = new ArrayList<>();
                    WOMTaskReportingPart taskReportingPart = new WOMTaskReportingPart();
                    taskReportingPart.setStoreID(materialsOutput.getPlaceSet());
                    taskReportingPart.setReportNum(materialsOutput.getProduceNum());
                    taskReportingPart.setBatchNum(materialsOutput.getBatch());
                    taskReportingPart.setRemark(materialsOutput.getRemark());
                    if (materialsOutput.getWareID() == null) {
                        errorMsg.append("仓库不能为空!");
                        return null;
                    }else {
                        if (materialsOutput.getWareID().getIsCargo()) {
                            if (materialsOutput.getPlaceSet() == null) {
                                errorMsg.append("仓库 ["+materialsOutput.getWareID().getWareName()+"] ").append("已经启用了货位，").append("货位不能为空!");
                                return null;
                            }
                        }
                    }
                    if (materialsOutput.getProduceNum() == null) {
                        errorMsg.append("产出数量不能为空，请完善报工数据!");
                        return null;
                    }
                    actualNum = actualNum.add(materialsOutput.getProduceNum());
                    taskReportingParts.add(taskReportingPart);
                    //表体方法
                    DataGridService dataGridService = new DataGridService() {
                        @Override
                        public void execute() {
                            if (taskReportingParts != null && !taskReportingParts.isEmpty()) {
                                for (WOMTaskReportingPart part: taskReportingParts) {
                                    part.setTableInfoId(taskReporting.getTableInfoId());
                                    part.setHeadId(taskReporting);
                                    taskReportingPartService.saveTaskReportingPart(part, null, "taskReportingEdit");
                                }
                            }
                        }
                    };

                    WorkFlowVar workFlowVar1 = new WorkFlowVar();
                    // log.info("MesProcedureImpl - SET SAVE");
                    Deployment taskReportingFlow = taskService.getCurrentDeployment("taskReportingFlow");
                    Long deploymentId = taskReportingFlow.getId();
                    Staff staff = ((User) getCurrentUser()).getStaff();
                    taskReporting.setCreateStaff(staff);
                    taskReporting.setCreateDepartmentId(staff.getMainPosition().getDepartment().getId());
                    taskReporting.setOwnerDepartmentId(staff.getMainPosition().getDepartment().getId());
                    taskReporting.setOwnerStaffId(staff.getId());
                    Long positionId = staff.getMainPosition().getId();
                    taskReporting.setCreatePositionId(positionId);
                    taskReporting.setOwnerPositionId(positionId);
                    Long staffId = ((User) getCurrentUser()).getStaff().getId();
                    String editActivityName = processService.findStartTransitions(deploymentId).getDestination().getName();
                    List<Long> workflowStaff = dataPermissionService.getPowerUserList(staffId, editActivityName, "taskReportingFlow", taskReportingFlow.getVersion() + "", positionId, null, false);
                    workFlowVar1.setOperateType("save");
                    Set<Long> ids = new HashSet<>();
                    ids.addAll(workflowStaff);
                    workFlowVar1.setAdditionalUsers(ids);
                    List<Map<String, ?>> outcomeList = new ArrayList<Map<String, ?>>();
                    for (Iterator scheduleStaff = ids.iterator(); scheduleStaff.hasNext(); ){
                        Map<String, String> outcomeMap = new HashMap<String, String>();
                        outcomeMap.put("dec", "保存");
                        outcomeMap.put("type", "normal");
                        outcomeMap.put("assignUser", scheduleStaff.next().toString());
                        outcomeMap.put("outcome", processService.findStartTransitions(deploymentId).getName());
                        outcomeList.add(outcomeMap);
                    }
                    workFlowVar1.setOutcome(processService.findStartTransitions(deploymentId).getName());
                    workFlowVar1.setOutcomeMap(outcomeList);
                    workFlowVar1.setDeploymentId(deploymentId);
                    log.info("MesProcedureImpl - SET SAVE=====");
                    //编辑
                    taskReportingService.save(taskReporting, deploymentId, null, workFlowVar1, dataGridService,null);
                    // 生效
                    //taskReportingService.saveSuperEditTaskReporting(taskReporting, workFlowVar1, dataGridService, "WOM_7.5.0.WOM_7.5.0.0_taskReporting_taskReportingEdit", false);
                    actiExelog.setProductNum(materialsOutput.getBatch());
                }
            }
        }else {
            List<WOMProcFeedbackHead> procFeedbackHeads = procFeedbackHeadDao.findByHql("FROM WOMProcFeedbackHead  WHERE processActive=? AND VALID = 1", produceTaskActive);
            if (procFeedbackHeads.size() == 0) {
                errorMsg.append("请先进行报工操作!");
                return null;
            }else {
                if (StringUtils.equals(produceTaskActive.getActiveType().getId(),ACTIVE_TYPE_COMMON)) {
                    //活动执行记录
                    actiExelog.setEndTime(endTime);
                    actiExelog.setIsFinish(true);
                    prodTaskActiExelogDao.merge(actiExelog);
                    return null;
                }
                putInMaterial = new WOMPutInMaterial();
                //投料或者配料活动时，需要生成投料单
                for (WOMProcFeedbackHead procFeedbackHead : procFeedbackHeads) {
                    putInMaterial.setTaskID(procFeedbackHead.getTaskId());
                    putInMaterial.setPutinStaff(procFeedbackHead.getStaffID());
                    putInMaterial.setStatus(99);
                    putInMaterialParts = new ArrayList<>();
                    //找到投配料表体
                    List<WOMBatchCharge> batchCharges = batchChargeService.findBatchChargesByHql(" from WOMBatchCharge where headerId=? and valid = 1", procFeedbackHead);
                    //是否启用批次
                    boolean useBatch = false;
                    //是否启用货位
                    boolean usePlaceSet = false;
                    if (batchCharges.size() == 0) {
                        errorMsg.append("配料表体不能为空!");
                        return null;
                    }
                    HashMap<Long, BigDecimal> map = new HashMap<>();
                    for (int i = 0; i < batchCharges.size(); i++) {
                        WOMBatchCharge womBatchCharge = batchCharges.get(i);
                        Long key = womBatchCharge.getStandingCrop().getId();
                        BigDecimal actualUseNum = womBatchCharge.getActualUseNum();
                        actualUseNum = actualUseNum.add(map.get(key)==null?BigDecimal.ZERO:map.get(key));
                        map.put(key,actualUseNum);
                        int c = womBatchCharge.getStandingCrop().getOnhand().compareTo(map.get(key));
                        if (c < 0) {
                            errorMsg.append(("投料表体中物料编码[" + womBatchCharge.getGood().getProductCode() + "]的用料量不能大于现存量").toString());
                            return null;
                        }
                        MESBasicWare wareID = womBatchCharge.getWareID();
                        if (i == 0) {
                            if (womBatchCharge.getGood() != null) {
                                if (womBatchCharge.getGood().getBatch() != null && StringUtils.equals(womBatchCharge.getGood().getBatch().getId(),"batch/batch01")) {
                                    useBatch = true;
                                }
                            }
                            if (womBatchCharge.getWareID() != null) {
                                usePlaceSet = wareID.getIsCargo();
                            }
                        }
                        WOMPutInMaterialPart putInMaterialPart = new WOMPutInMaterialPart();
                        if (useBatch && StringUtils.isBlank(womBatchCharge.getBatch())){
                            errorMsg.append("物品已经启用批次，批号不能为空!");
                            return null;
                        }
                        //生产批次
                        putInMaterialPart.setBatchNum(womBatchCharge.getBatch());
                        //投入的物品
                        putInMaterialPart.setProductId(womBatchCharge.getGood());
                        //活动
                        putInMaterialPart.setFormluActive(produceTaskActive.getActiveId());
                        putInMaterialPart.setTaskActiveId(produceTaskActive);
                        if (womBatchCharge.getActualUseNum() == null) {
                            errorMsg.append("实际投料量不能为空!");
                            return null;
                        }
                        //投入量
                        putInMaterialPart.setUseNum(womBatchCharge.getActualUseNum());
                        // 防止投入其他不同的料
                        if (produceTaskActive.getProductId().getProductCode().equals(womBatchCharge.getGood().getProductCode())) {
                            actualNum = actualNum.add(womBatchCharge.getActualUseNum());
                        }
                        if(wareID == null){
                            errorMsg.append("仓库不能为空!");
                            return null;
                        }

                        if (usePlaceSet && womBatchCharge.getPlaceSet() == null) {
                            errorMsg.append("仓库 ["+womBatchCharge.getWareID().getWareName()+"] ").append("已经启用了货位，").append("货位不能为空!");
                            return null;
                        }
                        //仓库
                        putInMaterialPart.setWareID(womBatchCharge.getWareID());
                        //货位
                        putInMaterialPart.setStoreID(womBatchCharge.getPlaceSet());
                        //投料时间
                        putInMaterialPart.setPutinDate(womBatchCharge.getPutinDate());
                        //投料结束时间
                        putInMaterialPart.setPutinEndDate(womBatchCharge.getPutinEndDate());
                        //工作单元
                        putInMaterialPart.setFactoryId(produceTaskActive.getOrderProcessId().getFactoryId());
                        //工序
                        putInMaterialPart.setTaskProcessId(produceTaskActive.getOrderProcessId());
                        //备注
                        putInMaterialPart.setRemark(womBatchCharge.getRemark());
                        putInMaterialParts.add(putInMaterialPart);
                    }

                    // 更新领用记录
                    for (Long keyId : map.keySet()) {
                        SQLQuery query = standingcropRefDao.createNativeQuery("UPDATE " + WOMStandingcropRef.TABLE_NAME + " SET onhand = onhand - " + map.get(keyId) + " WHERE id = " + keyId);
                        query.executeUpdate();
                    }

                    //表体方法
                    DataGridService dataGridService = getDataGridService1();

                    WorkFlowVar workFlowVar1 = new WorkFlowVar();
                    workFlowVar1.setOperateType("submit");
                    // 生效
                    putInMaterialService.saveSuperEditPutInMaterial(putInMaterial, workFlowVar1, dataGridService, "WOM_7.5.0.0_putInMaterial_putinView", false);
                }
                //真实投料量
                actiExelog.setActualNum(actualNum);
            }
        }
        //活动执行记录
        actiExelog.setEndTime(endTime);
        actiExelog.setIsFinish(true);
        prodTaskActiExelogDao.merge(actiExelog);
        return actualNum;
    }

    private boolean compareParentsSort(StringBuilder errorMsg, WOMProduceTask produceTask, WOMProduceTaskProcess produceTaskProcess, WOMProduceTaskActive produceTaskActive) {
        List<WOMProduceTaskActive> parentsProduceTaskActives = produceTaskProcessDao.findByHql(" from WOMProduceTaskActive where valid = 1 and orderProcessId=? and headID=? and parentActive=1 and sort < ?", produceTaskProcess,produceTask,produceTaskActive.getSort());
        for (WOMProduceTaskActive taskActive : parentsProduceTaskActives) {
            if (!StringUtils.equals(taskActive.getExecSort(),produceTaskActive.getExecSort()) && !StringUtils.equals(taskActive.getActiveState().getId(),PROCESS_STATE_DONE)) {
                errorMsg.append("活动 [" + taskActive.getName() + "] 还未完成,按照顺序限定不能结束当前活动！");
                return true;
            }
        }
        return false;
    }

    private void gerenalActiveRecord(WOMAdjustOrTempRecords record,WOMProduceTaskProcess process,Date startTime){
        //生成工序执行记录  如果没有执行记录 需要新插入
        if (((Number)produceTaskProcessDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_PROD_TASK_PROC_EXELOGS WHERE TASKID=? AND VALID = 1 AND TASK_PROCESSID=?", record.getHeaderID().getId(),process.getId()).uniqueResult()).intValue() == 0) {    //如果当前指令单的执行记录找不到条目，新插入
            createProcExelog(startTime,process);
        }

        //生成活动执行记录  如果没有执行记录 需要新插入
        if (((Number)produceTaskProcessDao.createNativeQuery("SELECT COUNT(ID) FROM WOM_PROD_TASK_ACTI_EXELOGS WHERE TASKID=? AND VALID = 1 AND ADJUST_RECORDID=?", record.getHeaderID().getId(),record.getId()).uniqueResult()).intValue() == 0) {    //如果当前指令单的执行记录找不到条目，新插入
            WOMProdTaskActiExelog prodTaskActiExelog = getWomProdTaskActiExelog(startTime, record,ACTIVE_ADJUST);
            //如果当前活动是检验，需要发起请检
            if (StringUtils.equals(record.getActiveType().getId(),ACTIVE_TYPE_INSPECT)) {   //质检
                interfaceSelfService.addApplyCheckByActiveExelog(prodTaskActiExelog);
            }
        }
    }
}
