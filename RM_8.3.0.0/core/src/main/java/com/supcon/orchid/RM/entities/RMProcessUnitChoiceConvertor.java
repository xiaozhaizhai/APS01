package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMProcessUnitChoiceConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMProcessUnitChoiceConvertor {
	
	public RMProcessUnitChoiceConvertor() {
	}
	
	public String getClassName() {
		return RMProcessUnitChoice.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMProcessUnitChoiceConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
