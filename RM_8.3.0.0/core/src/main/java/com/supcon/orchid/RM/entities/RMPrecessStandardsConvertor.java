package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMPrecessStandardsConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMPrecessStandardsConvertor {
	
	public RMPrecessStandardsConvertor() {
	}
	
	public String getClassName() {
		return RMPrecessStandards.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	private String quota;
	
	public String getQuota(){
		return quota;
	}
	
	public void setQuota(String quota){
		this.quota = quota;
	}
	
	
	public RMPrecessStandardsConvertor(Long id, String quota) {
		super();
		this.id = id;
		this.quota = quota;
	}
	

	
}
