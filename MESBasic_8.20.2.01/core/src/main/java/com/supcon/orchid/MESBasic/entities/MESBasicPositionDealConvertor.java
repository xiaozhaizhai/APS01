package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicPositionDealConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicPositionDealConvertor {
	
	public MESBasicPositionDealConvertor() {
	}
	
	public String getClassName() {
		return MESBasicPositionDeal.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicPositionDealConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
