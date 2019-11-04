package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMProcessPointConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMProcessPointConvertor {
	
	public RMProcessPointConvertor() {
	}
	
	public String getClassName() {
		return RMProcessPoint.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMProcessPointConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}