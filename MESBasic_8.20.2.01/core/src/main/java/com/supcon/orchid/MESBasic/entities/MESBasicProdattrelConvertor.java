package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicProdattrelConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicProdattrelConvertor {
	
	public MESBasicProdattrelConvertor() {
	}
	
	public String getClassName() {
		return MESBasicProdattrel.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicProdattrelConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
