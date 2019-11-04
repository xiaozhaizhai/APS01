package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicFactoryModelConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicFactoryModelConvertor {
	
	public MESBasicFactoryModelConvertor() {
	}
	
	public String getClassName() {
		return MESBasicFactoryModel.class.getName();
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
	
	
	public MESBasicFactoryModelConvertor(String code, String name) {
		super();
		this.code = code;
		this.name = name;
	}
	

	
}
