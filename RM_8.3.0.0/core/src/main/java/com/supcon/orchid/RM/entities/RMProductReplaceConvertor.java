package com.supcon.orchid.RM.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="RMProductReplaceConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class RMProductReplaceConvertor {
	
	public RMProductReplaceConvertor() {
	}
	
	public String getClassName() {
		return RMProductReplace.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public RMProductReplaceConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
