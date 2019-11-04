package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMCheckManageConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMCheckManageConvertor {
	
	public WOMCheckManageConvertor() {
	}
	
	public String getClassName() {
		return WOMCheckManage.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMCheckManageConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
