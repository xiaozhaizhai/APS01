package com.supcon.orchid.APSWServic.entities;


/**
 * 物品.
 */
public class APSWSTaskReporting {


    private String apsDispatchCode; //aps派工单号

    private String workCode; //工单号

    private String opCode; //工单编号

    private  String materialCode; //产品编号

    private  String confQty; //报工数量

    private String startDate; //开工时间

    private  String endDate; //完工时间

    private String reportDate; //报工时间

    private String reportRes; //实际使用设备

    public String getApsDispatchCode() {
        return apsDispatchCode;
    }

    public void setApsDispatchCode(String apsDispatchCode) {
        this.apsDispatchCode = apsDispatchCode;
    }

    public String getWorkCode() {
        return workCode;
    }

    public void setWorkCode(String workCode) {
        this.workCode = workCode;
    }

    public String getOpCode() {
        return opCode;
    }

    public void setOpCode(String opCode) {
        this.opCode = opCode;
    }

    public String getMaterialCode() {
        return materialCode;
    }

    public void setMaterialCode(String materialCode) {
        this.materialCode = materialCode;
    }

    public String getConfQty() {
        return confQty;
    }

    public void setConfQty(String confQty) {
        this.confQty = confQty;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getReportDate() {
        return reportDate;
    }

    public void setReportDate(String reportDate) {
        this.reportDate = reportDate;
    }

    public String getReportRes() {
        return reportRes;
    }

    public void setReportRes(String reportRes) {
        this.reportRes = reportRes;
    }
}
