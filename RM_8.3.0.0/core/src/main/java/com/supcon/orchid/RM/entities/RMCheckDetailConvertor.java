package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMCheckDetailConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMCheckDetailConvertor {
	
	public RMCheckDetailConvertor() {
	}
	
	public String getClassName() {
		return RMCheckDetail.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMCheckDetailConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
