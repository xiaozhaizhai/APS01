package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMLineFormulaConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMLineFormulaConvertor {
	
	public RMLineFormulaConvertor() {
	}
	
	public String getClassName() {
		return RMLineFormula.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMLineFormulaConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
