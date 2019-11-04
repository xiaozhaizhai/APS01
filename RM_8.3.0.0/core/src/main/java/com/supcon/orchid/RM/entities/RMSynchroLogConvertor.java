package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMSynchroLogConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMSynchroLogConvertor {
	
	public RMSynchroLogConvertor() {
	}
	
	public String getClassName() {
		return RMSynchroLog.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMSynchroLogConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
