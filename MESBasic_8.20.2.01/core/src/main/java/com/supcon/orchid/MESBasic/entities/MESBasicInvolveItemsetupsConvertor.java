package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicInvolveItemsetupsConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicInvolveItemsetupsConvertor {
	
	public MESBasicInvolveItemsetupsConvertor() {
	}
	
	public String getClassName() {
		return MESBasicInvolveItemsetups.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicInvolveItemsetupsConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
