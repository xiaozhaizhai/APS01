package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMSampleProjConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMSampleProjConvertor {
	
	public RMSampleProjConvertor() {
	}
	
	public String getClassName() {
		return RMSampleProj.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMSampleProjConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}