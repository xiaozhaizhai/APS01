package com.supcon.orchid.MESBasic.services;

public interface MobileApiService {
    /**
     * 点检业务同步到相应的移动作业点检作业项中
     */
    public void fromMobileToEam(Long eamId);
}
