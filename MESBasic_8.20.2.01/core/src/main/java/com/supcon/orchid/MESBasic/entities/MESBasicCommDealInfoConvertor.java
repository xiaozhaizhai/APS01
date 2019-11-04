package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicCommDealInfoConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicCommDealInfoConvertor {
	
	public MESBasicCommDealInfoConvertor() {
	}
	
	public String getClassName() {
		return MESBasicCommDealInfo.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicCommDealInfoConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
