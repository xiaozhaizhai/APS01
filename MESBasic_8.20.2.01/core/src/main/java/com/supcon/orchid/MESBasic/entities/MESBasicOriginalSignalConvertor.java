package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicOriginalSignalConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicOriginalSignalConvertor {
	
	public MESBasicOriginalSignalConvertor() {
	}
	
	public String getClassName() {
		return MESBasicOriginalSignal.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicOriginalSignalConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
