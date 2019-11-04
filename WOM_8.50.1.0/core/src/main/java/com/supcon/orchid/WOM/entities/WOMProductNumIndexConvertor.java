package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMProductNumIndexConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMProductNumIndexConvertor {
	
	public WOMProductNumIndexConvertor() {
	}
	
	public String getClassName() {
		return WOMProductNumIndex.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMProductNumIndexConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
