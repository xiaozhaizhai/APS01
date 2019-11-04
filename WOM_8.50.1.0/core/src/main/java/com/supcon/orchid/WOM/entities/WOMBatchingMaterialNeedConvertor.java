package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMBatchingMaterialNeedConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMBatchingMaterialNeedConvertor {
	
	public WOMBatchingMaterialNeedConvertor() {
	}
	
	public String getClassName() {
		return WOMBatchingMaterialNeed.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMBatchingMaterialNeedConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
