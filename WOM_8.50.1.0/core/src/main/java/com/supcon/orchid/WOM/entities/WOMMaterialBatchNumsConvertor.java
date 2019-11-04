package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMMaterialBatchNumsConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMMaterialBatchNumsConvertor {
	
	public WOMMaterialBatchNumsConvertor() {
	}
	
	public String getClassName() {
		return WOMMaterialBatchNums.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMMaterialBatchNumsConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
