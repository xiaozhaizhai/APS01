package com.supcon.orchid.WOM.utils;

public class SAPProduct {

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
     * 销售订单号
     */
    private String KDAUF;

    /**
     * 销售订单行项目
     */
    private String KDPOS;

    /**
     * 含量
     */
    private String ZHL;

    /**
     * 内部编号
     */
    private String ZNBBH;

    /**
     * 入库单号
     */
    private String ZRKDH;

    /**
     * 入库人员
     */
    private String ZRKRY;

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

    public String getKDAUF() {
        return KDAUF;
    }

    public void setKDAUF(String KDAUF) {
        this.KDAUF = KDAUF;
    }

    public String getKDPOS() {
        return KDPOS;
    }

    public void setKDPOS(String KDPOS) {
        this.KDPOS = KDPOS;
    }

    public String getZHL() {
        return ZHL;
    }

    public void setZHL(String ZHL) {
        this.ZHL = ZHL;
    }

    public String getZNBBH() {
        return ZNBBH;
    }

    public void setZNBBH(String ZNBBH) {
        this.ZNBBH = ZNBBH;
    }

    public String getZRKDH() {
        return ZRKDH;
    }

    public void setZRKDH(String ZRKDH) {
        this.ZRKDH = ZRKDH;
    }

    public String getZRKRY() {
        return ZRKRY;
    }

    public void setZRKRY(String ZRKRY) {
        this.ZRKRY = ZRKRY;
    }

    @Override
    public String toString() {
        return "SAPProduct{" +
                "BLDAT='" + BLDAT + '\'' +
                ", BUDAT='" + BUDAT + '\'' +
                ", MATNR='" + MATNR + '\'' +
                ", LGORT='" + LGORT + '\'' +
                ", CHARG='" + CHARG + '\'' +
                ", MENGE='" + MENGE + '\'' +
                ", MEINS='" + MEINS + '\'' +
                ", AUFNR='" + AUFNR + '\'' +
                ", KDAUF='" + KDAUF + '\'' +
                ", KDPOS='" + KDPOS + '\'' +
                ", ZHL='" + ZHL + '\'' +
                ", ZNBBH='" + ZNBBH + '\'' +
                ", ZRKDH='" + ZRKDH + '\'' +
                ", ZRKRY='" + ZRKRY + '\'' +
                '}';
    }
}
