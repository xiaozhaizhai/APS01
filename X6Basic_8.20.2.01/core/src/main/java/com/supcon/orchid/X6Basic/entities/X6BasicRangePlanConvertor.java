package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="X6BasicRangePlanConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class X6BasicRangePlanConvertor {
	
	public X6BasicRangePlanConvertor() {
	}
	
	public String getClassName() {
		return X6BasicRangePlan.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public X6BasicRangePlanConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
