package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMFormulaProcessConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMFormulaProcessConvertor {
	
	public RMFormulaProcessConvertor() {
	}
	
	public String getClassName() {
		return RMFormulaProcess.class.getName();
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
	
	
	public RMFormulaProcessConvertor(Long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	

	
}
