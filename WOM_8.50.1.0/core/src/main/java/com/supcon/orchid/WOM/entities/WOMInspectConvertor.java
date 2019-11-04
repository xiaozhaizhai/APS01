package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMInspectConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMInspectConvertor {
	
	public WOMInspectConvertor() {
	}
	
	public String getClassName() {
		return WOMInspect.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMInspectConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
