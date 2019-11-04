package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMCheckDetailItemSetupsConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMCheckDetailItemSetupsConvertor {
	
	public RMCheckDetailItemSetupsConvertor() {
	}
	
	public String getClassName() {
		return RMCheckDetailItemSetups.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMCheckDetailItemSetupsConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
