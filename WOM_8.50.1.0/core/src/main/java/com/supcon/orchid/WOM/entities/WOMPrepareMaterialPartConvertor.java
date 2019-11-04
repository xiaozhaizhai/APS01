package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMPrepareMaterialPartConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMPrepareMaterialPartConvertor {
	
	public WOMPrepareMaterialPartConvertor() {
	}
	
	public String getClassName() {
		return WOMPrepareMaterialPart.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMPrepareMaterialPartConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
