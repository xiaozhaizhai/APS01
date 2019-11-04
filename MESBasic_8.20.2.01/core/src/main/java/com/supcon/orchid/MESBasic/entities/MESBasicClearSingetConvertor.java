package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicClearSingetConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicClearSingetConvertor {
	
	public MESBasicClearSingetConvertor() {
	}
	
	public String getClassName() {
		return MESBasicClearSinget.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicClearSingetConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
