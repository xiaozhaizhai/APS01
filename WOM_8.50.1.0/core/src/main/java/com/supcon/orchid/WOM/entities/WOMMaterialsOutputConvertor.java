package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMMaterialsOutputConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMMaterialsOutputConvertor {
	
	public WOMMaterialsOutputConvertor() {
	}
	
	public String getClassName() {
		return WOMMaterialsOutput.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMMaterialsOutputConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}