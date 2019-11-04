package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicQACheckIndexConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicQACheckIndexConvertor {
	
	public MESBasicQACheckIndexConvertor() {
	}
	
	public String getClassName() {
		return MESBasicQACheckIndex.class.getName();
	}
	
	private String checkIndexCode;
	
	public String getCheckIndexCode(){
		return checkIndexCode;
	}
	
	public void setCheckIndexCode(String checkIndexCode){
		this.checkIndexCode = checkIndexCode;
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
	
	
	public MESBasicQACheckIndexConvertor(String code, String name) {
		super();
		this.code = code;
		this.name = name;
	}
	

	
}
