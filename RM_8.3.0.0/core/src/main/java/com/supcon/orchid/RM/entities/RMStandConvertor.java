package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMStandConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMStandConvertor {
	
	public RMStandConvertor() {
	}
	
	public String getClassName() {
		return RMStand.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMStandConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
