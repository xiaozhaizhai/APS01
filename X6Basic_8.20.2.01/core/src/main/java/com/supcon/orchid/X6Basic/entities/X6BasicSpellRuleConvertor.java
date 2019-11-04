package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="X6BasicSpellRuleConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class X6BasicSpellRuleConvertor {
	
	public X6BasicSpellRuleConvertor() {
	}
	
	public String getClassName() {
		return X6BasicSpellRule.class.getName();
	}
	
	private String code;
	
	public String getCode(){
		return code;
	}
	
	public void setCode(String code){
		this.code = code;
	}

	private String name;
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	
	public X6BasicSpellRuleConvertor(String code, String name) {
		super();
		this.code = code;
		this.name = name;
	}
	

	
}
