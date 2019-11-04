package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="X6BasicAccountPeriodPartConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class X6BasicAccountPeriodPartConvertor {
	
	public X6BasicAccountPeriodPartConvertor() {
	}
	
	public String getClassName() {
		return X6BasicAccountPeriodPart.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public X6BasicAccountPeriodPartConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
