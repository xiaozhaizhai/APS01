package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMBatchFormulaMainConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMBatchFormulaMainConvertor {
	
	public RMBatchFormulaMainConvertor() {
	}
	
	public String getClassName() {
		return RMBatchFormulaMain.class.getName();
	}
	
	private String batchFormulaId;
	
	public String getBatchFormulaId(){
		return batchFormulaId;
	}
	
	public void setBatchFormulaId(String batchFormulaId){
		this.batchFormulaId = batchFormulaId;
	}

	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}
	
	
	public RMBatchFormulaMainConvertor(String batchFormulaId, Long id) {
		super();
		this.batchFormulaId = batchFormulaId;
		this.id = id;
	}
	

	
}
