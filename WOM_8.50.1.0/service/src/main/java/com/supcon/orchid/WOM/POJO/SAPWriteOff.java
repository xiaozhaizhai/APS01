package com.supcon.orchid.WOM.POJO;

public class SAPWriteOff {
    /**
     * 物料凭证
     */
    private String MBLNR;

    /**
     * 编号
     */
    private String ZEILE;


    public SAPWriteOff() {
    }

    public SAPWriteOff(String MBLNR, String ZEILE) {
        this.MBLNR = MBLNR;
        this.ZEILE = ZEILE;
    }

    public String getMBLNR() {
        return MBLNR;
    }

    public void setMBLNR(String MBLNR) {
        this.MBLNR = MBLNR;
    }

    public String getZEILE() {
        return ZEILE;
    }

    public void setZEILE(String ZEILE) {
        this.ZEILE = ZEILE;
    }

    @Override
    public String toString() {
        return "SAPWriteOff{" +
                "MBLNR='" + MBLNR + '\'' +
                ", ZEILE='" + ZEILE + '\'' +
                '}';
    }
}
