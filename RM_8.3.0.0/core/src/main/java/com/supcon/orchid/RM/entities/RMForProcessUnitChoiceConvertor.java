package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMForProcessUnitChoiceConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMForProcessUnitChoiceConvertor {
	
	public RMForProcessUnitChoiceConvertor() {
	}
	
	public String getClassName() {
		return RMForProcessUnitChoice.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMForProcessUnitChoiceConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
