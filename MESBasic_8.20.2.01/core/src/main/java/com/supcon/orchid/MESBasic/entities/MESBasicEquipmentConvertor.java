package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicEquipmentConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicEquipmentConvertor {
	
	public MESBasicEquipmentConvertor() {
	}
	
	public String getClassName() {
		return MESBasicEquipment.class.getName();
	}
	
	private String code;
	
	public String getCode(){
		return code;
	}
	
	public void setCode(String code){
		this.code = code;
	}

	private String name;
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	
	public MESBasicEquipmentConvertor(String code, String name) {
		super();
		this.code = code;
		this.name = name;
	}
	

	
}
