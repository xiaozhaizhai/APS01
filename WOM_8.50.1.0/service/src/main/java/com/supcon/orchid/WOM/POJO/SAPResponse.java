package com.supcon.orchid.WOM.POJO;

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

    /**
     * 编号
     */
    private String ZEILE;

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

    public String getZEILE() {
        return ZEILE;
    }

    public void setZEILE(String ZEILE) {
        this.ZEILE = ZEILE;
    }

    @Override
    public String toString() {
        return "SAPResponse{" +
                "MBLNR='" + MBLNR + '\'' +
                ", TYPE='" + TYPE + '\'' +
                ", MESSAGE='" + MESSAGE + '\'' +
                ", ZEILE='" + ZEILE + '\'' +
                '}';
    }

}
