package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicObjProductConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicObjProductConvertor {
	
	public MESBasicObjProductConvertor() {
	}
	
	public String getClassName() {
		return MESBasicObjProduct.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicObjProductConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
