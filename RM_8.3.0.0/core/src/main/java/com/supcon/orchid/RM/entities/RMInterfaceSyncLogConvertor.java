package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMInterfaceSyncLogConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMInterfaceSyncLogConvertor {
	
	public RMInterfaceSyncLogConvertor() {
	}
	
	public String getClassName() {
		return RMInterfaceSyncLog.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMInterfaceSyncLogConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
