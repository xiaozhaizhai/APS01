package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicConfigConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicConfigConvertor {
	
	public MESBasicConfigConvertor() {
	}
	
	public String getClassName() {
		return MESBasicConfig.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	private String name;
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	
	public MESBasicConfigConvertor(Long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	

	
}
