package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="X6BasicAccountPeriodConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class X6BasicAccountPeriodConvertor {
	
	public X6BasicAccountPeriodConvertor() {
	}
	
	public String getClassName() {
		return X6BasicAccountPeriod.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public X6BasicAccountPeriodConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
