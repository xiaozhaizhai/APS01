package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicObjWareStoreConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicObjWareStoreConvertor {
	
	public MESBasicObjWareStoreConvertor() {
	}
	
	public String getClassName() {
		return MESBasicObjWareStore.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicObjWareStoreConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
