package com.supcon.orchid.WOM.entities;

import com.supcon.orchid.MESBasic.entities.MESBasicBaseVendor;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;

import java.util.List;
import java.util.Map;

public class BatchAnalyze {
    /**
     * 批次中的物品
     */
    private MESBasicProduct product;

    /**
     * 批次是否源自于生产
     */
    private Boolean isProduce;

    /**
     *如果是采购来的 会有供应商
     */
    private MESBasicBaseVendor basicBaseVendor;

    /**
     * 生产报工单
     */
    private WOMTaskReporting taskReporting;

    /**
     *批次后期发生的所有事件
     */
    private List<Map<String,Object>> events;

    public MESBasicProduct getProduct() {
        return product;
    }

    public void setProduct(MESBasicProduct product) {
        this.product = product;
    }

    public Boolean getProduce() {
        return isProduce;
    }

    public void setProduce(Boolean produce) {
        isProduce = produce;
    }

    public MESBasicBaseVendor getBasicBaseVendor() {
        return basicBaseVendor;
    }

    public void setBasicBaseVendor(MESBasicBaseVendor basicBaseVendor) {
        this.basicBaseVendor = basicBaseVendor;
    }

    public List<Map<String, Object>> getEvents() {
        return events;
    }

    public void setEvents(List<Map<String, Object>> events) {
        this.events = events;
    }

    public WOMTaskReporting getTaskReporting() {
        return taskReporting;
    }

    public void setTaskReporting(WOMTaskReporting taskReporting) {
        this.taskReporting = taskReporting;
    }

    @Override
    public String toString() {
        return "BatchAnalyze{" +
                "product=" + product +
                ", isProduce=" + isProduce +
                ", basicBaseVendor=" + basicBaseVendor +
                ", taskReporting=" + taskReporting +
                ", events=" + events +
                '}';
    }
}
