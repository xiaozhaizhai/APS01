package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMFormulaProcessActiveConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMFormulaProcessActiveConvertor {
	
	public RMFormulaProcessActiveConvertor() {
	}
	
	public String getClassName() {
		return RMFormulaProcessActive.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMFormulaProcessActiveConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
