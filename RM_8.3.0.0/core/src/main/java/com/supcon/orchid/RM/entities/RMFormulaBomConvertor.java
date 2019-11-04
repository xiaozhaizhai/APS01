package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMFormulaBomConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMFormulaBomConvertor {
	
	public RMFormulaBomConvertor() {
	}
	
	public String getClassName() {
		return RMFormulaBom.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMFormulaBomConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
