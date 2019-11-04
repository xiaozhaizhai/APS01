package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="X6BasicPlanDailyConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class X6BasicPlanDailyConvertor {
	
	public X6BasicPlanDailyConvertor() {
	}
	
	public String getClassName() {
		return X6BasicPlanDaily.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public X6BasicPlanDailyConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
