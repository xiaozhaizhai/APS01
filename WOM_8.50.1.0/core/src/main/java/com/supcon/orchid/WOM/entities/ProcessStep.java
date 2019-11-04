package com.supcon.orchid.WOM.entities;

import org.apache.commons.lang.StringUtils;

import java.util.List;

public class ProcessStep {

    public static final String PROCESS_STATE_TODO = "processState/state01";
    public static final String PROCESS_STATE_DOING = "processState/state02";
    public static final String PROCESS_STATE_DONE = "processState/state03";

    private Long id;

    /**
     * 工序顺序
     */
    private String step;

    /**
     * 工序名称
     */
    private String name;

    /**
     * 工序执行状态
     */
    private String status;

	 /**
     * 工序类型
     */
    private String processType;

	/**
     * 工序ID
     */
    private Long activeHeaderId;

	/**
     * 工序执行顺序
     */
    private String processStep;

    public String getProcessStep() {
        return processStep;
    }

    public void setProcessStep(String processStep) {
        this.processStep = processStep;
    }

    public Long getActiveHeaderId() {
        return activeHeaderId;
    }

    public void setActiveHeaderId(Long activeHeaderId) {
        this.activeHeaderId = activeHeaderId;
    }

    public String getProcessType() {
        return processType;
    }

    public void setProcessType(String processType) {
        this.processType = processType;
    }

    private Boolean hasChildrenNodes;

    private Long parentId;

    public Boolean getHasChildrenNodes() {
        return hasChildrenNodes;
    }

    public void setHasChildrenNodes(Boolean hasChildrenNodes) {
        this.hasChildrenNodes = hasChildrenNodes;
    }

    private List<ProcessStep> childStep;

    public ProcessStep() {}

    public ProcessStep(String step, String name, String status) {
        this.step = step;
        this.name = name;
        this.status = getProcessState(status);
    }

    public ProcessStep(Long id, String step, String name, String status) {
        this.id = id;
        this.step = step;
        this.name = name;
        this.status = this.status = getProcessState(status);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStep() {
        return step;
    }

    public void setStep(String step) {
        this.step = step;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = getProcessState(status);
    }

    public List<ProcessStep> getChildStep() {
        return childStep;
    }

    public void setChildStep(List<ProcessStep> childStep) {
        this.childStep = childStep;
    }

	public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    private String getProcessState(String status){
        if (StringUtils.equals(status,PROCESS_STATE_DONE)) {
            return "step-done";
        }else if(StringUtils.equals(status,PROCESS_STATE_DOING)){
            return "step-doing";
        }else {
            return "step-undone";
        }
    }
}
