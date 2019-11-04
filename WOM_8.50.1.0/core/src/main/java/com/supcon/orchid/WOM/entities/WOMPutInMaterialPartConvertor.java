package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMPutInMaterialPartConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMPutInMaterialPartConvertor {
	
	public WOMPutInMaterialPartConvertor() {
	}
	
	public String getClassName() {
		return WOMPutInMaterialPart.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMPutInMaterialPartConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
