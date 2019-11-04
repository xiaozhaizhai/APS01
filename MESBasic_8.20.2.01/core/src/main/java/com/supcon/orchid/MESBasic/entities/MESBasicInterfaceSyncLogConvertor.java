package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicInterfaceSyncLogConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicInterfaceSyncLogConvertor {
	
	public MESBasicInterfaceSyncLogConvertor() {
	}
	
	public String getClassName() {
		return MESBasicInterfaceSyncLog.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicInterfaceSyncLogConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
