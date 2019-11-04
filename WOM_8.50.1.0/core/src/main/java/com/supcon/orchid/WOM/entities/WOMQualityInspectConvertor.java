package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMQualityInspectConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMQualityInspectConvertor {
	
	public WOMQualityInspectConvertor() {
	}
	
	public String getClassName() {
		return WOMQualityInspect.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMQualityInspectConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
