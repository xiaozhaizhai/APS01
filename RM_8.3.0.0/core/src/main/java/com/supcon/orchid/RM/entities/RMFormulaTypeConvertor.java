package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMFormulaTypeConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMFormulaTypeConvertor {
	
	public RMFormulaTypeConvertor() {
	}
	
	public String getClassName() {
		return RMFormulaType.class.getName();
	}
	
	private String code;
	
	public String getCode(){
		return code;
	}
	
	public void setCode(String code){
		this.code = code;
	}

	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}
	
	
	public RMFormulaTypeConvertor(String code, Long id) {
		super();
		this.code = code;
		this.id = id;
	}
	

	
}
