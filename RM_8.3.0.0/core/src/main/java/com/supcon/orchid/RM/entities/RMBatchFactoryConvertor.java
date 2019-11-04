package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMBatchFactoryConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMBatchFactoryConvertor {
	
	public RMBatchFactoryConvertor() {
	}
	
	public String getClassName() {
		return RMBatchFactory.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMBatchFactoryConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
