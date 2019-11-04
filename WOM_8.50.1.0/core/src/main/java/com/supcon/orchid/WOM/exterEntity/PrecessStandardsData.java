package com.supcon.orchid.WOM.exterEntity;

import java.math.BigDecimal;

public class PrecessStandardsData {
	long eactiveId;//工序活动id
	String quota;//指标
	BigDecimal stValue;//标准值
	boolean overrunFlag;//统计超限
	int limitInter;//扫描间隔（超限）
	BigDecimal upperLimit;//上限
	BigDecimal maxLimit;//上上限
	BigDecimal lowerLimit;//下限
	BigDecimal loweMxLimit;//下下限
	boolean fluctuateFlag;//统计波动
	int flucInter;//波动扫描间隔(秒)
	BigDecimal flucUpperLimit;//波动上限
	BigDecimal flucLowerLimit;//波动下限
	public long getEactiveId() {
		return eactiveId;
	}
	public void setEactiveId(long eactiveId) {
		this.eactiveId = eactiveId;
	}
	public String getQuota() {
		return quota;
	}
	public void setQuota(String quota) {
		this.quota = quota;
	}
	public BigDecimal getStValue() {
		return stValue;
	}
	public void setStValue(BigDecimal stValue) {
		this.stValue = stValue;
	}
	public boolean isOverrunFlag() {
		return overrunFlag;
	}
	public void setOverrunFlag(boolean overrunFlag) {
		this.overrunFlag = overrunFlag;
	}
	public int getLimitInter() {
		return limitInter;
	}
	public void setLimitInter(int limitInter) {
		this.limitInter = limitInter;
	}
	public BigDecimal getUpperLimit() {
		return upperLimit;
	}
	public void setUpperLimit(BigDecimal upperLimit) {
		this.upperLimit = upperLimit;
	}
	public BigDecimal getMaxLimit() {
		return maxLimit;
	}
	public void setMaxLimit(BigDecimal maxLimit) {
		this.maxLimit = maxLimit;
	}
	public BigDecimal getLowerLimit() {
		return lowerLimit;
	}
	public void setLowerLimit(BigDecimal lowerLimit) {
		this.lowerLimit = lowerLimit;
	}
	public BigDecimal getLoweMxLimit() {
		return loweMxLimit;
	}
	public void setLoweMxLimit(BigDecimal loweMxLimit) {
		this.loweMxLimit = loweMxLimit;
	}
	public boolean isFluctuateFlag() {
		return fluctuateFlag;
	}
	public void setFluctuateFlag(boolean fluctuateFlag) {
		this.fluctuateFlag = fluctuateFlag;
	}
	public int getFlucInter() {
		return flucInter;
	}
	public void setFlucInter(int flucInter) {
		this.flucInter = flucInter;
	}
	public BigDecimal getFlucUpperLimit() {
		return flucUpperLimit;
	}
	public void setFlucUpperLimit(BigDecimal flucUpperLimit) {
		this.flucUpperLimit = flucUpperLimit;
	}
	public BigDecimal getFlucLowerLimit() {
		return flucLowerLimit;
	}
	public void setFlucLowerLimit(BigDecimal flucLowerLimit) {
		this.flucLowerLimit = flucLowerLimit;
	}
	
}
