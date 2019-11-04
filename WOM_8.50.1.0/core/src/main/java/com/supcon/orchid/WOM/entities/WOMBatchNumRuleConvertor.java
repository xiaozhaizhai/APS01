package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMBatchNumRuleConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMBatchNumRuleConvertor {
	
	public WOMBatchNumRuleConvertor() {
	}
	
	public String getClassName() {
		return WOMBatchNumRule.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMBatchNumRuleConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
