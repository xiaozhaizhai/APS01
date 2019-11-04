package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMInventoryDetailConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMInventoryDetailConvertor {
	
	public WOMInventoryDetailConvertor() {
	}
	
	public String getClassName() {
		return WOMInventoryDetail.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMInventoryDetailConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
