package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMPutInManageConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMPutInManageConvertor {
	
	public WOMPutInManageConvertor() {
	}
	
	public String getClassName() {
		return WOMPutInManage.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMPutInManageConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
