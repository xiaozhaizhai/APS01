package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicProdDealInfoConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicProdDealInfoConvertor {
	
	public MESBasicProdDealInfoConvertor() {
	}
	
	public String getClassName() {
		return MESBasicProdDealInfo.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicProdDealInfoConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
