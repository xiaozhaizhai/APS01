package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMFormulaBeforeProcessConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMFormulaBeforeProcessConvertor {
	
	public RMFormulaBeforeProcessConvertor() {
	}
	
	public String getClassName() {
		return RMFormulaBeforeProcess.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMFormulaBeforeProcessConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
