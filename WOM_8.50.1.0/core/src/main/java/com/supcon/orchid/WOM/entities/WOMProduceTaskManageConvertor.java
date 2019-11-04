package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMProduceTaskManageConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMProduceTaskManageConvertor {
	
	public WOMProduceTaskManageConvertor() {
	}
	
	public String getClassName() {
		return WOMProduceTaskManage.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMProduceTaskManageConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
