package com.supcon.orchid.WOM.exterEntity;

import java.util.List;

public class ProduceTask {
	long orderId;
	String batchCode;
	String specification;
	Produce product;
	Recipe recipe;
	WorkCenter workCenter;
	List<Materials> materials;
	String approver;
	long approvalTime;
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public String getBatchCode() {
		return batchCode;
	}
	public void setBatchCode(String batchCode) {
		this.batchCode = batchCode;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public Produce getProduct() {
		return product;
	}
	public void setProduct(Produce product) {
		this.product = product;
	}
	public Recipe getRecipe() {
		return recipe;
	}
	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}
	public WorkCenter getWorkCenter() {
		return workCenter;
	}
	public void setWorkCenter(WorkCenter workCenter) {
		this.workCenter = workCenter;
	}
	public List<Materials> getMaterials() {
		return materials;
	}
	public void setMaterials(List<Materials> materials) {
		this.materials = materials;
	}
	public String getApprover() {
		return approver;
	}
	public void setApprover(String approver) {
		this.approver = approver;
	}
	public long getApprovalTime() {
		return approvalTime;
	}
	public void setApprovalTime(long approvalTime) {
		this.approvalTime = approvalTime;
	}
	
}
