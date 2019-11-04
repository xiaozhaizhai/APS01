package com.supcon.orchid.MESBasic.entities;

import org.apache.commons.lang.StringUtils;

import javax.persistence.Transient;

public enum ReInspectEnums {
    PURARRIVAL("采购到货"),
    NO_PRODUCT_DATE("无质检日期"),
    HAS_INSPECT_DATE("有质检日期"),
    RECHECK_QUALIFIELD("复检合格"),
    RECHECK_UN_QUALIFIELD("复检不合格"),
    RECHECK_FINISH_UN_QUALIFIELD("复检完毕并且不合格"),
    RECHECK_FINISH_QUALIFIELD("复检完毕并且合格"),
    START_REINSPECT("开始复检"),
    UPDATE_CHECK_DATE("更改复检日期"),
    UPDATE_CHECK_STATUS("更改是否正在复检状态"),
    OTHER_TYPE("其他类型"),
    ;


    private String reInspectType;

    ReInspectEnums(String reInspectType) {
        this.reInspectType = reInspectType;
    }
    @Transient
    public String getReInspectType() {
        return reInspectType;
    }

    public static ReInspectEnums of(String reInspectType){
        for (ReInspectEnums reInspectEnums : ReInspectEnums.values()) {
            if (StringUtils.equals(reInspectType,reInspectEnums.getReInspectType())){
                return reInspectEnums;
            }
        }
        return ReInspectEnums.OTHER_TYPE;
    }
}
