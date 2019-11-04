package com.supcon.orchid.MESBasic.services;

import java.util.List;
import java.util.Map;

public interface BEAMApiService {
    /**
     * 生成缺陷单
     */
    public void createFaultInfo(List<Map<String, Object>> faultInfoMaps);
}
