package com.supcon.orchid.APSWServic.entities;


import java.util.Date;

/**
 * 配方.
 */
public class APSWSFormula {

    private String routCode; //工艺路线编码（MES配方编码）
    private String rote_name; //工艺路线名称（MES配方名）
    private String materialCode;  //产品编码
    private String modifyDate; //修改时间

    public String getRoutCode() {
        return routCode;
    }

    public void setRoutCode(String routCode) {
        this.routCode = routCode;
    }

    public String getRote_name() {
        return rote_name;
    }

    public void setRote_name(String rote_name) {
        this.rote_name = rote_name;
    }

    public String getMaterialCode() {
        return materialCode;
    }

    public void setMaterialCode(String materialCode) {
        this.materialCode = materialCode;
    }

    public String getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
    }
}
