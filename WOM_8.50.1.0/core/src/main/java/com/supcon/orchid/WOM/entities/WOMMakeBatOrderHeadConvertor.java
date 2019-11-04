package com.supcon.orchid.WOM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="WOMMakeBatOrderHeadConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class WOMMakeBatOrderHeadConvertor {
	
	public WOMMakeBatOrderHeadConvertor() {
	}
	
	public String getClassName() {
		return WOMMakeBatOrderHead.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public WOMMakeBatOrderHeadConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
