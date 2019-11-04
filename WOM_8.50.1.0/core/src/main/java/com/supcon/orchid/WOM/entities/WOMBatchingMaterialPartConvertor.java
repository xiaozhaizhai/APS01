package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMBatchingMaterialPartConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMBatchingMaterialPartConvertor {
	
	public WOMBatchingMaterialPartConvertor() {
	}
	
	public String getClassName() {
		return WOMBatchingMaterialPart.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMBatchingMaterialPartConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
