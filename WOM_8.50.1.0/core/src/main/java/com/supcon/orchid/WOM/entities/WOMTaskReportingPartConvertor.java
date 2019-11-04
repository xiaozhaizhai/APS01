package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMTaskReportingPartConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMTaskReportingPartConvertor {
	
	public WOMTaskReportingPartConvertor() {
	}
	
	public String getClassName() {
		return WOMTaskReportingPart.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMTaskReportingPartConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
