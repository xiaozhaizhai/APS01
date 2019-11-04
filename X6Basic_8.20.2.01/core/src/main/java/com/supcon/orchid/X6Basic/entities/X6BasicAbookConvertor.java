package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="X6BasicAbookConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class X6BasicAbookConvertor {
	
	public X6BasicAbookConvertor() {
	}
	
	public String getClassName() {
		return X6BasicAbook.class.getName();
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
	
	
	public X6BasicAbookConvertor(Long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	

	
}
