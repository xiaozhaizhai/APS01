package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="X6BasicSpellRulePartConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class X6BasicSpellRulePartConvertor {
	
	public X6BasicSpellRulePartConvertor() {
	}
	
	public String getClassName() {
		return X6BasicSpellRulePart.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	private String teamOrder;
	
	public String getTeamOrder(){
		return teamOrder;
	}
	
	public void setTeamOrder(String teamOrder){
		this.teamOrder = teamOrder;
	}
	
	
	public X6BasicSpellRulePartConvertor(Long id, String teamOrder) {
		super();
		this.id = id;
		this.teamOrder = teamOrder;
	}
	

	
}
