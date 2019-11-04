package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicItemPartConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicItemPartConvertor {
	
	public MESBasicItemPartConvertor() {
	}
	
	public String getClassName() {
		return MESBasicItemPart.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicItemPartConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
