package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicProdResetDailyConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicProdResetDailyConvertor {
	
	public MESBasicProdResetDailyConvertor() {
	}
	
	public String getClassName() {
		return MESBasicProdResetDaily.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicProdResetDailyConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
