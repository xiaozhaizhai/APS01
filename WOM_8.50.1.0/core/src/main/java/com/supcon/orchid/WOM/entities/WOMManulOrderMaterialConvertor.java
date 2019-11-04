package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMManulOrderMaterialConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMManulOrderMaterialConvertor {
	
	public WOMManulOrderMaterialConvertor() {
	}
	
	public String getClassName() {
		return WOMManulOrderMaterial.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMManulOrderMaterialConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
