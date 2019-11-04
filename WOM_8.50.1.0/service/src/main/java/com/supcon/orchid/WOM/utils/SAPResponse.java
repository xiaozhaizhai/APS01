package com.supcon.orchid.WOM.utils;

public class SAPResponse {
    /**
     * 物料凭证
     */
    private String MBLNR;

    /**
     * 消息类型
     */
    private String TYPE;

    /**
     * 消息文本
     */
    private String MESSAGE;

    public String getMBLNR() {
        return MBLNR;
    }

    public void setMBLNR(String MBLNR) {
        this.MBLNR = MBLNR;
    }

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE;
    }

    public String getMESSAGE() {
        return MESSAGE;
    }

    public void setMESSAGE(String MESSAGE) {
        this.MESSAGE = MESSAGE;
    }

    @Override
    public String toString() {
        return "SAPResponse{" +
                "MBLNR='" + MBLNR + '\'' +
                ", TYPE='" + TYPE + '\'' +
                ", MESSAGE='" + MESSAGE + '\'' +
                '}';
    }
}
