package com.supcon.orchid.WOM.exterEntity;

import java.math.BigDecimal;
import java.util.List;

/**
 * 工单的基础信息.
 */
public class ProBatch {
	long productID;//产品id
	String productName;//产品名称
	String productBatchNum;//生产批号
	long produceTaskID;//工单ID
	String produceTaskTime;//生产日期
	long workShop;//车间（分公司）
	long factoryId;//生产线
	BigDecimal amount;//数量
	long productBaseUnit;//单位id
	List<ProcessData> processList;//工艺属性
	
	public long getProductID() {
		return productID;
	}

	public void setProductID(long productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductBatchNum() {
		return productBatchNum;
	}

	public void setProductBatchNum(String productBatchNum) {
		this.productBatchNum = productBatchNum;
	}

	public long getProduceTaskID() {
		return produceTaskID;
	}

	public void setProduceTaskID(long produceTaskID) {
		this.produceTaskID = produceTaskID;
	}

	public String getProduceTaskTime() {
		return produceTaskTime;
	}

	public void setProduceTaskTime(String produceTaskTime) {
		this.produceTaskTime = produceTaskTime;
	}

	public long getWorkShop() {
		return workShop;
	}

	public void setWorkShop(long workShop) {
		this.workShop = workShop;
	}

	public long getFactoryId() {
		return factoryId;
	}

	public void setFactoryId(long factoryId) {
		this.factoryId = factoryId;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public long getProductBaseUnit() {
		return productBaseUnit;
	}

	public void setProductBaseUnit(long productBaseUnit) {
		this.productBaseUnit = productBaseUnit;
	}

	public List<ProcessData> getProcessList() {
		return processList;
	}

	public void setProcessList(List<ProcessData> processList) {
		this.processList = processList;
	}
}


