package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicFunctionInfoConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicFunctionInfoConvertor {
	
	public MESBasicFunctionInfoConvertor() {
	}
	
	public String getClassName() {
		return MESBasicFunctionInfo.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicFunctionInfoConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
