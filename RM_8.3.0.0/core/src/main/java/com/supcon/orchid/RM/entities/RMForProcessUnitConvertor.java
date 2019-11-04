package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMForProcessUnitConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMForProcessUnitConvertor {
	
	public RMForProcessUnitConvertor() {
	}
	
	public String getClassName() {
		return RMForProcessUnit.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMForProcessUnitConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
