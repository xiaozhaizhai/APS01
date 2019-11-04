package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicObjEquipmentConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicObjEquipmentConvertor {
	
	public MESBasicObjEquipmentConvertor() {
	}
	
	public String getClassName() {
		return MESBasicObjEquipment.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicObjEquipmentConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
