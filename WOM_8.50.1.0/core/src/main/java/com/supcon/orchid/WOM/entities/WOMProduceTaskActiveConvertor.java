package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMProduceTaskActiveConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMProduceTaskActiveConvertor {
	
	public WOMProduceTaskActiveConvertor() {
	}
	
	public String getClassName() {
		return WOMProduceTaskActive.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMProduceTaskActiveConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}