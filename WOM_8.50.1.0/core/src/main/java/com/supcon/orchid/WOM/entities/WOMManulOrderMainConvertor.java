package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMManulOrderMainConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMManulOrderMainConvertor {
	
	public WOMManulOrderMainConvertor() {
	}
	
	public String getClassName() {
		return WOMManulOrderMain.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMManulOrderMainConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
