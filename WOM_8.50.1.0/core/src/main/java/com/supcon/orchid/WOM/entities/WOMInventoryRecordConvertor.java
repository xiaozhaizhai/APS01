package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMInventoryRecordConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMInventoryRecordConvertor {
	
	public WOMInventoryRecordConvertor() {
	}
	
	public String getClassName() {
		return WOMInventoryRecord.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMInventoryRecordConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
