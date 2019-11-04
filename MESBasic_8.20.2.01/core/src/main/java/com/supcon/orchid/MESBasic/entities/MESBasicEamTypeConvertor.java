package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicEamTypeConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicEamTypeConvertor {
	
	public MESBasicEamTypeConvertor() {
	}
	
	public String getClassName() {
		return MESBasicEamType.class.getName();
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
	
	
	public MESBasicEamTypeConvertor(String code, String name) {
		super();
		this.code = code;
		this.name = name;
	}
	

	
}
