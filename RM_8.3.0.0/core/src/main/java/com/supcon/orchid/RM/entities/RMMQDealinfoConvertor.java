package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMMQDealinfoConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMMQDealinfoConvertor {
	
	public RMMQDealinfoConvertor() {
	}
	
	public String getClassName() {
		return RMMQDealinfo.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMMQDealinfoConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
