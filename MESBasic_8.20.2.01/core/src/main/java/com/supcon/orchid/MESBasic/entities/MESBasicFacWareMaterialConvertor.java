package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicFacWareMaterialConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicFacWareMaterialConvertor {
	
	public MESBasicFacWareMaterialConvertor() {
	}
	
	public String getClassName() {
		return MESBasicFacWareMaterial.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicFacWareMaterialConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
