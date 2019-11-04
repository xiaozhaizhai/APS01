package com.supcon.orchid.APSWServic.entities;


import com.supcon.orchid.foundation.entities.SystemCode;

/**
 * 物品.
 */
public class APSWSProduct {


    private String autoSupply; //自动补充标志

    private String cad; // 包装规格型号


    private String classify; // 车间代称

    private String avbCODE; //是否有效

    private String code; // 编码

    private String mfgStockMode; // 备料方式

    private String makmac; // 生产线


    private String minTargetStock; // 安全库存


    private String name; // 名称


    private String parkingsys; // 包装方法


    private String productType; // 类型


    private String purDeliverDate; // 配送提前期


    private String purMoveUpDate; // 采购提前期


    private String unitmea; // 单位

    public String getAvbCODE() {
        return avbCODE;
    }

    public void setAvbCODE(String avbCODE) {
        this.avbCODE = avbCODE;
    }

    public String getMfgStockMode() {
        return mfgStockMode;
    }

    public void setMfgStockMode(String mfgStockMode) {
        this.mfgStockMode = mfgStockMode;
    }

    public String getAutoSupply() {
        return autoSupply;
    }

    public void setAutoSupply(String autoSupply) {
        this.autoSupply = autoSupply;
    }

    public String getCad() {
        return cad;
    }

    public void setCad(String cad) {
        this.cad = cad;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMakmac() {
        return makmac;
    }

    public void setMakmac(String makmac) {
        this.makmac = makmac;
    }

    public String getMinTargetStock() {
        return minTargetStock;
    }

    public void setMinTargetStock(String minTargetStock) {
        this.minTargetStock = minTargetStock;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParkingsys() {
        return parkingsys;
    }

    public void setParkingsys(String parkingsys) {
        this.parkingsys = parkingsys;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public String getPurDeliverDate() {
        return purDeliverDate;
    }

    public void setPurDeliverDate(String purDeliverDate) {
        this.purDeliverDate = purDeliverDate;
    }

    public String getPurMoveUpDate() {
        return purMoveUpDate;
    }

    public void setPurMoveUpDate(String purMoveUpDate) {
        this.purMoveUpDate = purMoveUpDate;
    }

    public String getUnitmea() {
        return unitmea;
    }

    public void setUnitmea(String unitmea) {
        this.unitmea = unitmea;
    }
}
