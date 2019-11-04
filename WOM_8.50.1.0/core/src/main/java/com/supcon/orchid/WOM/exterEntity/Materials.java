package com.supcon.orchid.WOM.exterEntity;

import java.math.BigDecimal;

public class Materials {
	long id;
	String name;
	String code;
	BigDecimal amount;
	String batchCode;
	String unit;
	int sequence;
	int phase;
	BigDecimal upTolerate;
	BigDecimal lowTolerate;
	boolean needWeigh;
	BigDecimal purity;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getBatchCode() {
		return batchCode;
	}
	public void setBatchCode(String batchCode) {
		this.batchCode = batchCode;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	public int getPhase() {
		return phase;
	}
	public void setPhase(int phase) {
		this.phase = phase;
	}
	public BigDecimal getUpTolerate() {
		return upTolerate;
	}
	public void setUpTolerate(BigDecimal upTolerate) {
		this.upTolerate = upTolerate;
	}
	public BigDecimal getLowTolerate() {
		return lowTolerate;
	}
	public void setLowTolerate(BigDecimal lowTolerate) {
		this.lowTolerate = lowTolerate;
	}
	public boolean getNeedWeigh() {
		return needWeigh;
	}
	public void setNeedWeigh(boolean needWeigh) {
		this.needWeigh = needWeigh;
	}
	public BigDecimal getPurity() {
		return purity;
	}
	public void setPurity(BigDecimal purity) {
		this.purity = purity;
	}
	
}
