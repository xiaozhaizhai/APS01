package com.supcon.orchid.WOM.services;



import com.supcon.orchid.WOM.entities.WOMStandingcropRef;


import java.util.List;
import java.util.Map;

/**
 * 生产备料接口
 */
public interface WomMesToSapService {
    /**
     * 查看库存调用
     * @param materialCode 物料编码，必填
     * @param wareCode 库存地点，选填
     * @param batchNum 批次，选填
     */
    List<WOMStandingcropRef> getStockInfo(String materialCode, String wareCode, String batchNum);
    /**
     * sap备料出库（领料）
     * @param id 备料单id
     */
    Map<String, String> prepareMaterialOutgo(String id);

    /**
     * 生产订单收货上传(入库)
     * @param id 报工单id
     */
    Map<String, String> saveProduct(String id);

    /**
     * 根据备料单库存调度
     * 查询createTime为当月的备料单的备料明细，如果使用量小于备料量，差值调用sap领料出库接口平账（出库数量为负数）
     * @return
     */
    @Deprecated
    void scheduleInventory();
  
    /**
     * 平库
     */
    Map<String, String> flat(String xml);

    /**
     * 冲销
     * @param id 报工单id
     */
    Map<String, String> writeOff(String id);
}
