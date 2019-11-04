package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMBatchChargeConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMBatchChargeConvertor {
	
	public WOMBatchChargeConvertor() {
	}
	
	public String getClassName() {
		return WOMBatchCharge.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMBatchChargeConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
