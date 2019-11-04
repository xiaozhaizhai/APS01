package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMFormulaBomMaterialConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMFormulaBomMaterialConvertor {
	
	public RMFormulaBomMaterialConvertor() {
	}
	
	public String getClassName() {
		return RMFormulaBomMaterial.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMFormulaBomMaterialConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
