package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicPurchGroupConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicPurchGroupConvertor {
	
	public MESBasicPurchGroupConvertor() {
	}
	
	public String getClassName() {
		return MESBasicPurchGroup.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	private String purchGroupName;
	
	public String getPurchGroupName(){
		return purchGroupName;
	}
	
	public void setPurchGroupName(String purchGroupName){
		this.purchGroupName = purchGroupName;
	}
	
	
	public MESBasicPurchGroupConvertor(Long id, String purchGroupName) {
		super();
		this.id = id;
		this.purchGroupName = purchGroupName;
	}
	

	
}
