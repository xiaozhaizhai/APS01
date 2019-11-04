package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMCraftStandardsConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMCraftStandardsConvertor {
	
	public WOMCraftStandardsConvertor() {
	}
	
	public String getClassName() {
		return WOMCraftStandards.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMCraftStandardsConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
