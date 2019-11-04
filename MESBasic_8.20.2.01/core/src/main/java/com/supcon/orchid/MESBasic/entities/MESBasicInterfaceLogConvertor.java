package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicInterfaceLogConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicInterfaceLogConvertor {
	
	public MESBasicInterfaceLogConvertor() {
	}
	
	public String getClassName() {
		return MESBasicInterfaceLog.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicInterfaceLogConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
