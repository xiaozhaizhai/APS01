package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMProActAndBatStateConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMProActAndBatStateConvertor {
	
	public WOMProActAndBatStateConvertor() {
	}
	
	public String getClassName() {
		return WOMProActAndBatState.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMProActAndBatStateConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
