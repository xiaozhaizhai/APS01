package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMTaskReportManageConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMTaskReportManageConvertor {
	
	public WOMTaskReportManageConvertor() {
	}
	
	public String getClassName() {
		return WOMTaskReportManage.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMTaskReportManageConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
