package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMTestProjConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMTestProjConvertor {
	
	public RMTestProjConvertor() {
	}
	
	public String getClassName() {
		return RMTestProj.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMTestProjConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
