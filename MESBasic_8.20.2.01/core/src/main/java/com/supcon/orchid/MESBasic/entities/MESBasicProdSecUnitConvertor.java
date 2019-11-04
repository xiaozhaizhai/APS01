package com.supcon.orchid.MESBasic.entities;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


@XmlType(name="MESBasicProdSecUnitConvertor")
@XmlAccessorType(XmlAccessType.FIELD)
public class MESBasicProdSecUnitConvertor {
	
	public MESBasicProdSecUnitConvertor() {
	}
	
	public String getClassName() {
		return MESBasicProdSecUnit.class.getName();
	}
	
	private Long id;
	
	public Long getId(){
		return id;
	}
	
	public void setId(Long id){
		this.id = id;
	}

	
	public MESBasicProdSecUnitConvertor(Long id) {
		super();
		this.id = id;
	}
	
	

	
}
