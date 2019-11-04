package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMProductMapOtherConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMProductMapOtherConvertor {
	
	public RMProductMapOtherConvertor() {
	}
	
	public String getClassName() {
		return RMProductMapOther.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMProductMapOtherConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
