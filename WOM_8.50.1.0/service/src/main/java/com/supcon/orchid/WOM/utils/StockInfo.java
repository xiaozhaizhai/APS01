package com.supcon.orchid.WOM.utils;

public class StockInfo {
    /**
     * 物料编码
     */
    private String MATNR;

    /**
     * 工厂
     */
    private String WERKS;

    /**
     * 库存地点
     */
    private String LGORT;

    /**
     * 数量
     */
    private String LABST;

    /**
     * 批次
     */
    private String CHARG;

    public void setMATNR(String MATNR) {
        this.MATNR = MATNR;
    }

    public void setLGORT(String LGORT) {
        this.LGORT = LGORT;
    }


    public void setCHARG(String CHARG) {
        this.CHARG = CHARG;
    }

    public String getMATNR() {
        return MATNR;
    }

    public String getLGORT() {
        return LGORT;
    }

    public String getWERKS() {
        return WERKS;
    }

    public void setWERKS(String WERKS) {
        this.WERKS = WERKS;
    }

    public String getLABST() {
        return LABST;
    }

    public void setLABST(String LABST) {
        this.LABST = LABST;
    }

    public String getCHARG() {
        return CHARG;
    }
  
      @Override
    public String toString() {
        return "StockInfo{" +
                "MATNR='" + MATNR + '\'' +
                ", WERKS='" + WERKS + '\'' +
                ", LGORT='" + LGORT + '\'' +
                ", LABST='" + LABST + '\'' +
                ", CHARG='" + CHARG + '\'' +
                '}';
    }
}
