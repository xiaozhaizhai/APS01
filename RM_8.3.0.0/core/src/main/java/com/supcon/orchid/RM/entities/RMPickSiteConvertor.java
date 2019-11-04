package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMPickSiteConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMPickSiteConvertor {
	
	public RMPickSiteConvertor() {
	}
	
	public String getClassName() {
		return RMPickSite.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMPickSiteConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
