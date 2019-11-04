package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMBatchChargeDetailsConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMBatchChargeDetailsConvertor {
	
	public WOMBatchChargeDetailsConvertor() {
	}
	
	public String getClassName() {
		return WOMBatchChargeDetails.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMBatchChargeDetailsConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
