package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMRejectReasonConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMRejectReasonConvertor {
	
	public WOMRejectReasonConvertor() {
	}
	
	public String getClassName() {
		return WOMRejectReason.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMRejectReasonConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
