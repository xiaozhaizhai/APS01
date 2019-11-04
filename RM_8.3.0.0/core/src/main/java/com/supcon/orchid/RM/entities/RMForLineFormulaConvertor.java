package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMForLineFormulaConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMForLineFormulaConvertor {
	
	public RMForLineFormulaConvertor() {
	}
	
	public String getClassName() {
		return RMForLineFormula.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMForLineFormulaConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
