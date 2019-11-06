package com.supcon.orchid.APSWServic.entities;

public class APSWSOpResorce {
    private String opCode;
    private String resCode;
    private String opName;
    private String cycleTime;
    private String prepareTime;
    private String cmdType;
    private String persistMode;
    private String avbCode;

    public String getopCode() {
        return opCode;
    }

    public void setOpCode(String routeCode) {
        this.opCode = opCode;
    }

    public String getResCode() {
        return resCode;
    }

    public void setResCode(String resCode) {
        this.resCode = resCode;
    }

    public String getOpName() {
        return opName;
    }

    public void setOpName(String opName) {
        this.opName = opName;
    }

    public String getCycleTime() {
        return cycleTime;
    }

    public void setCycleTime(String cycleTime) {
        this.cycleTime = cycleTime;
    }

    public String getPrepareTime() {
        return prepareTime;
    }

    public void setPrepareTime(String prepareTime) {
        this.prepareTime = prepareTime;
    }

    public String getCmdType() {
        return cmdType;
    }

    public void setCmdType(String cmdType) {
        this.cmdType = cmdType;
    }

    public String getPersistMode() {
        return persistMode;
    }

    public void setPersistMode(String persistMode) {
        this.persistMode = persistMode;
    }

    public String getAvbCode() {
        return avbCode;
    }

    public void setAvbCode(String avbCode) {
        this.avbCode = avbCode;
    }
}
