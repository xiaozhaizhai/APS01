package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicCustomerMaterialConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicCustomerMaterialConvertor {
	
	public MESBasicCustomerMaterialConvertor() {
	}
	
	public String getClassName() {
		return MESBasicCustomerMaterial.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicCustomerMaterialConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
