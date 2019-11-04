package com.supcon.orchid.MESBasic.localException.exceptionEnums;

import org.apache.commons.lang.StringUtils;

public enum ExceptionEnums {
    FROM_INSPECTING("欲转出批次 正在复检中,请正确选择批次!"),
    TO_INSPECTING("欲转入货位中存在相同批次且正在复检中,请正确选择批次或者重新挑选仓库/货位!"),
    TABLE_NOT_EXISTS("单据不存在,请确认此单据尚在!"),
    UNDEFINED_EXCEPTION("未定义异常!"),
    FROM_STANDINGCROP_REINSPECT_IS_BAD("所选转出货位批次检验结论不合格"),
    TO_STANDINGCROP_REINSPECT_IS_BAD("所选转入货位批次检验结论不合格"),
    IS_REINSPECTING("所选货位批次正在检验"),
    START_REINSPECT("所选货位批次检验结论不合格"),
    ;


    private String exceptionReason;

    public String getExceptionReason() {
        return exceptionReason;
    }

    ExceptionEnums(String exceptionReason) {

        this.exceptionReason = exceptionReason;
    }

    public static ExceptionEnums of(String exceptionReason){
        for (ExceptionEnums exceptionEnums : ExceptionEnums.values()) {
            if (StringUtils.equals(exceptionReason,exceptionEnums.getExceptionReason())){
                return exceptionEnums;
            }
        }
        return ExceptionEnums.UNDEFINED_EXCEPTION;
    }
}
