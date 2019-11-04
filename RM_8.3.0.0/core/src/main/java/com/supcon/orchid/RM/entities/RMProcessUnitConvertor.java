package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMProcessUnitConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMProcessUnitConvertor {
	
	public RMProcessUnitConvertor() {
	}
	
	public String getClassName() {
		return RMProcessUnit.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMProcessUnitConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
