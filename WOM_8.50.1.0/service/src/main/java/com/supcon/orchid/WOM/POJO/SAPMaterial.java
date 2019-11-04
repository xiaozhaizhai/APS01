package com.supcon.orchid.WOM.POJO;

public class SAPMaterial {
    /**
     * 凭证日期
     */
    private String BLDAT;

    /**
     * 过账日期
     */
    private String BUDAT;

    /**
     * 物料号码
     */
    private String MATNR;

    /**
     * 库存地点
     */
    private String LGORT;

    /**
     * 批次
     */
    private String CHARG;

    /**
     * 数量
     */
    private String MENGE;

    /**
     * 单位
     */
    private String MEINS;

    /**
     * 生产订单号
     */
    private String AUFNR;

    /**
     * 预留号
     */
    private String RSNUM;

    /**
     * 预留项目编号
     */
    private String RSPOS;

    /**
     * 特殊库存标志
     */
    private String SOBKZ;

    /**
     * 内部编码
     */
    private String ZNBBH;

    /**
     * 出库单号
     */
    private String ZCKDH;

    /**
     * 领用人员
     */
    private String ZLYRY;

    public String getBLDAT() {
        return BLDAT;
    }

    public void setBLDAT(String BLDAT) {
        this.BLDAT = BLDAT;
    }

    public String getBUDAT() {
        return BUDAT;
    }

    public void setBUDAT(String BUDAT) {
        this.BUDAT = BUDAT;
    }

    public String getMATNR() {
        return MATNR;
    }

    public void setMATNR(String MATNR) {
        this.MATNR = MATNR;
    }

    public String getLGORT() {
        return LGORT;
    }

    public void setLGORT(String LGORT) {
        this.LGORT = LGORT;
    }

    public String getCHARG() {
        return CHARG;
    }

    public void setCHARG(String CHARG) {
        this.CHARG = CHARG;
    }

    public String getMENGE() {
        return MENGE;
    }

    public void setMENGE(String MENGE) {
        this.MENGE = MENGE;
    }

    public String getMEINS() {
        return MEINS;
    }

    public void setMEINS(String MEINS) {
        this.MEINS = MEINS;
    }

    public String getAUFNR() {
        return AUFNR;
    }

    public void setAUFNR(String AUFNR) {
        this.AUFNR = AUFNR;
    }

    public String getRSNUM() {
        return RSNUM;
    }

    public void setRSNUM(String RSNUM) {
        this.RSNUM = RSNUM;
    }

    public String getRSPOS() {
        return RSPOS;
    }

    public void setRSPOS(String RSPOS) {
        this.RSPOS = RSPOS;
    }

    public String getSOBKZ() {
        return SOBKZ;
    }

    public void setSOBKZ(String SOBKZ) {
        this.SOBKZ = SOBKZ;
    }

    public String getZNBBH() {
        return ZNBBH;
    }

    public void setZNBBH(String ZNBBH) {
        this.ZNBBH = ZNBBH;
    }

    public String getZCKDH() {
        return ZCKDH;
    }

    public void setZCKDH(String ZCKDH) {
        this.ZCKDH = ZCKDH;
    }

    public String getZLYRY() {
        return ZLYRY;
    }

    public void setZLYRY(String ZLYRY) {
        this.ZLYRY = ZLYRY;
    }

    @Override
    public String toString() {
        return "SAPMaterial{" +
                "BLDAT='" + BLDAT + '\'' +
                ", BUDAT='" + BUDAT + '\'' +
                ", MATNR='" + MATNR + '\'' +
                ", LGORT='" + LGORT + '\'' +
                ", CHARG='" + CHARG + '\'' +
                ", MENGE='" + MENGE + '\'' +
                ", MEINS='" + MEINS + '\'' +
                ", AUFNR='" + AUFNR + '\'' +
                ", RSNUM='" + RSNUM + '\'' +
                ", RSPOS='" + RSPOS + '\'' +
                ", SOBKZ='" + SOBKZ + '\'' +
                ", ZNBBH='" + ZNBBH + '\'' +
                ", ZCKDH='" + ZCKDH + '\'' +
                ", ZLYRY='" + ZLYRY + '\'' +
                '}';
    }
}
