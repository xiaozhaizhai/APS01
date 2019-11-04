package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMCraftRecordsConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMCraftRecordsConvertor {
	
	public WOMCraftRecordsConvertor() {
	}
	
	public String getClassName() {
		return WOMCraftRecords.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMCraftRecordsConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
