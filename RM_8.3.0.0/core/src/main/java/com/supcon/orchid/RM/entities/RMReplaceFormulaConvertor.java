package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMReplaceFormulaConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMReplaceFormulaConvertor {
	
	public RMReplaceFormulaConvertor() {
	}
	
	public String getClassName() {
		return RMReplaceFormula.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMReplaceFormulaConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
