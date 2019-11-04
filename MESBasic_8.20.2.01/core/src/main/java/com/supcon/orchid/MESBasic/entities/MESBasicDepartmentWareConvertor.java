package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicDepartmentWareConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicDepartmentWareConvertor {
	
	public MESBasicDepartmentWareConvertor() {
	}
	
	public String getClassName() {
		return MESBasicDepartmentWare.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicDepartmentWareConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
