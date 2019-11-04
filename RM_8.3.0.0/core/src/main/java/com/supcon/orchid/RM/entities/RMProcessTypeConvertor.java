package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMProcessTypeConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMProcessTypeConvertor {
	
	public RMProcessTypeConvertor() {
	}
	
	public String getClassName() {
		return RMProcessType.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMProcessTypeConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
