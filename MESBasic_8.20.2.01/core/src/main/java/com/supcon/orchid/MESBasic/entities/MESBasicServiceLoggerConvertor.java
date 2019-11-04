package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicServiceLoggerConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicServiceLoggerConvertor {
	
	public MESBasicServiceLoggerConvertor() {
	}
	
	public String getClassName() {
		return MESBasicServiceLogger.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicServiceLoggerConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
