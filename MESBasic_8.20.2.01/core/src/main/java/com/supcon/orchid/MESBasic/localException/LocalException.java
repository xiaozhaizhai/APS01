package com.supcon.orchid.MESBasic.localException;

import com.supcon.orchid.MESBasic.localException.exceptionEnums.ExceptionEnums;
import com.supcon.orchid.services.BAPException;

public class LocalException extends BAPException {
    public LocalException(String message) {
        super(message);
    }

    public LocalException(ExceptionEnums exceptionEnums) {
        super(exceptionEnums.getExceptionReason());
    }
}
