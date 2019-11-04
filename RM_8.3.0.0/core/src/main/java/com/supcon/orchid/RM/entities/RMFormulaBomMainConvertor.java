package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMFormulaBomMainConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMFormulaBomMainConvertor {
	
	public RMFormulaBomMainConvertor() {
	}
	
	public String getClassName() {
		return RMFormulaBomMain.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMFormulaBomMainConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
