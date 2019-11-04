package com.supcon.orchid.X6Basic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="X6BasicSignatureConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class X6BasicSignatureConvertor {
	
	public X6BasicSignatureConvertor() {
	}
	
	public String getClassName() {
		return X6BasicSignature.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public X6BasicSignatureConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
