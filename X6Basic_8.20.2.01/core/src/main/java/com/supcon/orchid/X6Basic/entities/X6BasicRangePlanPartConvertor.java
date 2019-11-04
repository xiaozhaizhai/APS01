package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="X6BasicRangePlanPartConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class X6BasicRangePlanPartConvertor {
	
	public X6BasicRangePlanPartConvertor() {
	}
	
	public String getClassName() {
		return X6BasicRangePlanPart.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public X6BasicRangePlanPartConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
