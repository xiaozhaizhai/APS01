package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMStandingcropRefConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMStandingcropRefConvertor {
	
	public WOMStandingcropRefConvertor() {
	}
	
	public String getClassName() {
		return WOMStandingcropRef.class.getName();
	}
	
	private String batchText;
	
	public String getBatchText(){
		return batchText;
	}
	
	public void setBatchText(String batchText){
		this.batchText = batchText;
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMStandingcropRefConvertor(Long id, String batchText) {
		super();
		this.id = id;
		this.batchText = batchText;
	}
	

	
}
