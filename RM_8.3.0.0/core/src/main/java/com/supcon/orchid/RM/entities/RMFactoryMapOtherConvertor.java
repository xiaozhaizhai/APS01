package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMFactoryMapOtherConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMFactoryMapOtherConvertor {
	
	public RMFactoryMapOtherConvertor() {
	}
	
	public String getClassName() {
		return RMFactoryMapOther.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMFactoryMapOtherConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
