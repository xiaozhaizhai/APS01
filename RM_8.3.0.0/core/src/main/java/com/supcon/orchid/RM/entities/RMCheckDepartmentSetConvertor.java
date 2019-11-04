package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMCheckDepartmentSetConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMCheckDepartmentSetConvertor {
	
	public RMCheckDepartmentSetConvertor() {
	}
	
	public String getClassName() {
		return RMCheckDepartmentSet.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMCheckDepartmentSetConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
