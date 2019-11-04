package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicMaintainLogConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicMaintainLogConvertor {
	
	public MESBasicMaintainLogConvertor() {
	}
	
	public String getClassName() {
		return MESBasicMaintainLog.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicMaintainLogConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
