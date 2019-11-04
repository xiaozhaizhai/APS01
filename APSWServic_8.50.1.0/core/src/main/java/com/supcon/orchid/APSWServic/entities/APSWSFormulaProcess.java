package com.supcon.orchid.APSWServic.entities;


/**
 * 工序
 */
public class APSWSFormulaProcess {

    private String opSeq; //工序顺序号
    private String opName; //工序名称
    private String opCode; //工序编码
    private String routeCode; //工艺路线编码
    private  String transTime; //工序间隔时间
    private String pesistMode; //接续方式

    public String getOpSeq() {
        return opSeq;
    }

    public void setOpSeq(String opSeq) {
        this.opSeq = opSeq;
    }

    public String getOpName() {
        return opName;
    }

    public void setOpName(String opName) {
        this.opName = opName;
    }

    public String getOpCode() {
        return opCode;
    }

    public void setOpCode(String opCode) {
        this.opCode = opCode;
    }

    public String getRouteCode() {
        return routeCode;
    }

    public void setRouteCode(String routeCode) {
        this.routeCode = routeCode;
    }

    public String getTransTime() {
        return transTime;
    }

    public void setTransTime(String transTime) {
        this.transTime = transTime;
    }

    public String getPesistMode() {
        return pesistMode;
    }

    public void setPesistMode(String pesistMode) {
        this.pesistMode = pesistMode;
    }
}
