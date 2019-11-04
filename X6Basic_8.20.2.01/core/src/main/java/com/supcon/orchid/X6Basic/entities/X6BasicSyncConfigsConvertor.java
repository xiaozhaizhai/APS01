package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="X6BasicSyncConfigsConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class X6BasicSyncConfigsConvertor {
	
	public X6BasicSyncConfigsConvertor() {
	}
	
	public String getClassName() {
		return X6BasicSyncConfigs.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public X6BasicSyncConfigsConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
